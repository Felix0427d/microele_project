-- =============================================================================
-- chip.vhd  —  Jeu des 4 zéros
-- Traduction VHDL fidèle de chip.v pour Lattice Radiant / iCE40UP5K
--
-- Entrées :
--   clk   : 12 MHz (pico-ice : broche 35, ICE_35_G0)
--   reset : actif HAUT
--   btn   : bouton LOCK, actif HAUT, front montant détecté en interne
--           (ICE_PB = broche 10 est actif BAS sur pico-ice → inverser dans le .pcf)
-- Sorties :
--   seg0..3 : 4 afficheurs 7 segments séparés, common cathode, actif HAUT
--             bit [6]=g (toujours 0), [5]=f, [4]=e, [3]=d, [2]=c, [1]=b, [0]=a
--
-- Diviseur d'horloge : 12 MHz / 2^DIV_BITS ≈ 5,7 Hz par pas de curseur
--   → une rotation complète (6 positions) en ~1 seconde
--   Modifier DIV_BITS pour changer la vitesse :
--     18 → ~46 Hz (très rapide)   21 → ~5.7 Hz   23 → ~1.4 Hz (lent)
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mini_light_up_game is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        btn   : in  std_logic;
        seg0  : out std_logic_vector(6 downto 0);
        seg1  : out std_logic_vector(6 downto 0);
        seg2  : out std_logic_vector(6 downto 0);
        seg3  : out std_logic_vector(6 downto 0)
    );
end entity mini_light_up_game;

architecture rtl of mini_light_up_game is

    -- -------------------------------------------------------------------------
    -- Constante de vitesse : 2^DIV_BITS cycles d'horloge entre deux pas
    -- -------------------------------------------------------------------------
    constant DIV_BITS : integer := 21;   -- ~5.7 Hz à 12 MHz

    -- -------------------------------------------------------------------------
    -- Générateur de clock enable
    -- -------------------------------------------------------------------------
    signal div_cnt : unsigned(DIV_BITS - 1 downto 0) := (others => '0');
    signal ce      : std_logic := '0';

    -- -------------------------------------------------------------------------
    -- Détection front montant bouton
    -- -------------------------------------------------------------------------
    signal btn_prev  : std_logic := '0';
    signal btn_pulse : std_logic;

    -- -------------------------------------------------------------------------
    -- Registre à décalage circulaire 1-hot (bit 0 = seg a … bit 5 = seg f)
    -- -------------------------------------------------------------------------
    signal cursor : std_logic_vector(5 downto 0) := "000001";

    -- -------------------------------------------------------------------------
    -- Compteur digit actif (0 → 1 → 2 → 3, bloqué à 3)
    -- -------------------------------------------------------------------------
    signal cnt : unsigned(1 downto 0) := (others => '0');

    -- -------------------------------------------------------------------------
    -- Mémoires segments (6 bits : f downto a)
    -- -------------------------------------------------------------------------
    signal mem0, mem1, mem2, mem3 : std_logic_vector(5 downto 0) := (others => '0');

    -- -------------------------------------------------------------------------
    -- Drapeaux "digit complet" enregistrés
    -- -------------------------------------------------------------------------
    signal done_ff : std_logic_vector(3 downto 0) := (others => '0');

    -- -------------------------------------------------------------------------
    -- Signaux combinatoires internes
    -- -------------------------------------------------------------------------
    signal sel0, sel1, sel2, sel3         : std_logic;
    signal sel0_v, sel1_v, sel2_v, sel3_v : std_logic_vector(5 downto 0);
    signal wr0, wr1, wr2, wr3            : std_logic;
    signal nxt0, nxt1, nxt2, nxt3        : std_logic_vector(5 downto 0);
    signal done_comb                      : std_logic_vector(3 downto 0);
    signal cnt_advance                    : std_logic;

begin

    -- =========================================================================
    -- 0. Générateur de clock enable
    --    ce = '1' pendant exactement 1 cycle toutes les 2^DIV_BITS périodes clk
    -- =========================================================================
    p_div : process(clk, reset)
    begin
        if reset = '1' then
            div_cnt <= (others => '0');
            ce      <= '0';
        elsif rising_edge(clk) then
            ce <= '0';
            if div_cnt = to_unsigned(2**DIV_BITS - 1, DIV_BITS) then
                div_cnt <= (others => '0');
                ce      <= '1';
            else
                div_cnt <= div_cnt + 1;
            end if;
        end if;
    end process p_div;

    -- =========================================================================
    -- 1. Détection front montant bouton (btn_lock_ff + and_btn_pulse du schéma)
    --    btn_prev n'est mis à jour qu'à chaque pulse ce → détection correcte
    -- =========================================================================
    p_btn : process(clk, reset)
    begin
        if reset = '1' then
            btn_prev <= '0';
        elsif rising_edge(clk) then
            if ce = '1' then
                btn_prev <= btn;
            end if;
        end if;
    end process p_btn;

    btn_pulse <= btn and (not btn_prev) and ce;

    -- =========================================================================
    -- 2. Registre à décalage circulaire 1-hot (sr0..sr5 du schéma)
    --    Rotation : cursor[0](a)→cursor[1](b)→…→cursor[5](f)→cursor[0](a)
    -- =========================================================================
    p_cursor : process(clk, reset)
    begin
        if reset = '1' then
            cursor <= "000001";
        elsif rising_edge(clk) then
            if ce = '1' then
                cursor <= cursor(4 downto 0) & cursor(5);
            end if;
        end if;
    end process p_cursor;

    -- =========================================================================
    -- 3. Décodage digit actif (and_sel0..3 du schéma)
    -- =========================================================================
    sel0 <= '1' when cnt = "00" else '0';
    sel1 <= '1' when cnt = "01" else '0';
    sel2 <= '1' when cnt = "10" else '0';
    sel3 <= '1' when cnt = "11" else '0';

    -- Vecteur répliqué pour masquage bit-à-bit du curseur
    sel0_v <= (others => sel0);
    sel1_v <= (others => sel1);
    sel2_v <= (others => sel2);
    sel3_v <= (others => sel3);

    -- =========================================================================
    -- 4. Write-enables et prochaines valeurs mémoire
    --    (and_wr_en* + or_write + mx du schéma)
    -- =========================================================================
    wr0 <= btn_pulse and sel0;
    wr1 <= btn_pulse and sel1;
    wr2 <= btn_pulse and sel2;
    wr3 <= btn_pulse and sel3;

    nxt0 <= (mem0 or cursor) when wr0 = '1' else mem0;
    nxt1 <= (mem1 or cursor) when wr1 = '1' else mem1;
    nxt2 <= (mem2 or cursor) when wr2 = '1' else mem2;
    nxt3 <= (mem3 or cursor) when wr3 = '1' else mem3;

    -- =========================================================================
    -- 5. Drapeaux done combinatoires
    --    "111111" = tous segments a..f allumés = chiffre "0" formé
    -- =========================================================================
    done_comb(0) <= '1' when nxt0 = "111111" else '0';
    done_comb(1) <= '1' when nxt1 = "111111" else '0';
    done_comb(2) <= '1' when nxt2 = "111111" else '0';
    done_comb(3) <= '1' when nxt3 = "111111" else '0';

    -- Avancement : btn_pulse ET digit actif déjà complété ET pas déjà au digit 3
    cnt_advance <= btn_pulse and done_ff(to_integer(cnt)) and (not sel3);

    -- =========================================================================
    -- 6. Registres synchrones : cnt, mem*, done_ff
    -- =========================================================================
    p_regs : process(clk, reset)
    begin
        if reset = '1' then
            cnt     <= (others => '0');
            mem0    <= (others => '0');
            mem1    <= (others => '0');
            mem2    <= (others => '0');
            mem3    <= (others => '0');
            done_ff <= (others => '0');
        elsif rising_edge(clk) then
            if ce = '1' then
                mem0    <= nxt0;
                mem1    <= nxt1;
                mem2    <= nxt2;
                mem3    <= nxt3;
                done_ff <= done_comb;
                if cnt_advance = '1' then
                    cnt <= cnt + 1;
                end if;
            end if;
        end if;
    end process p_regs;

    -- =========================================================================
    -- 7. Sorties : overlay du curseur sur le digit actif uniquement
    --    seg[6] = g = toujours '0'  (segment du milieu, jamais allumé)
    --    seg[5:0] = mémoire OR (curseur masqué si digit sélectionné)
    -- =========================================================================
    seg0 <= '0' & (mem0 or (cursor and sel0_v));
    seg1 <= '0' & (mem1 or (cursor and sel1_v));
    seg2 <= '0' & (mem2 or (cursor and sel2_v));
    seg3 <= '0' & (mem3 or (cursor and sel3_v));

end architecture rtl;
