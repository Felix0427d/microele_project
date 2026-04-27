// Jeu des 4 zéros — implémentation fidèle au schéma diagram_detailed.json
//
// Règle : le curseur (1-hot, 6 bits) tourne en permanence à la fréquence clk.
// btn (LOCK) : front montant → verrouille la position courante du curseur dans
//              la mémoire du digit actif (OR cumulatif, segments a..f seulement).
// Un digit est « complet » quand ses 6 segments a..f sont tous à 1 (= chiffre "0").
// Le drapeau done_ff est enregistré ; une pression supplémentaire fait avancer
// le compteur de digit (0→1→2→3, bloqué à 3).
// reset (actif HAUT) : remet tout à zéro de façon asynchrone.
//
// Sorties : 4 afficheurs 7 segments séparés (non multiplexés), common cathode,
//           actif HAUT. Bit [6]=g (toujours 0), [5]=f, [4]=e, [3]=d, [2]=c, [1]=b, [0]=a.

module mini_light_up_game (
    input  clk,         // Horloge système
    input  reset,       // Reset actif HAUT (bouton RST du schéma)
    input  btn,         // Bouton LOCK actif HAUT (front montant détecté en interne)
    output [6:0] seg0,  // Afficheur 0 — [6:g, 5:f, 4:e, 3:d, 2:c, 1:b, 0:a]
    output [6:0] seg1,  // Afficheur 1
    output [6:0] seg2,  // Afficheur 2
    output [6:0] seg3   // Afficheur 3
);

    // -----------------------------------------------------------------------
    // 1. Détection du front montant du bouton (btn_lock_ff + and_btn_pulse)
    // -----------------------------------------------------------------------
    reg btn_prev;
    wire btn_pulse;
    always @(posedge clk or posedge reset) begin
        if (reset) btn_prev <= 1'b0;
        else       btn_prev <= btn;
    end
    assign btn_pulse = btn & ~btn_prev;

    // -----------------------------------------------------------------------
    // 2. Registre à décalage circulaire 1-hot (sr0..sr5)
    //    Rotation : cursor[0](a)→cursor[1](b)→…→cursor[5](f)→cursor[0](a)
    //    Après reset : cursor[0]=1, les autres à 0
    // -----------------------------------------------------------------------
    reg [5:0] cursor;
    always @(posedge clk or posedge reset) begin
        if (reset) cursor <= 6'b000001;
        else       cursor <= {cursor[4:0], cursor[5]};
    end

    // -----------------------------------------------------------------------
    // 3. Compteur 2 bits — digit actif (cnt0/cnt1 du schéma)
    //    Avance de 0→1→2→3 ; bloqué à 3 (and_cnt_max / not_cnt_max)
    // -----------------------------------------------------------------------
    reg [1:0] cnt;

    // -----------------------------------------------------------------------
    // 4. Mémoire segments a..f (6 bits) pour chacun des 4 afficheurs
    //    Le segment g n'est jamais allumé (entrée B des MUX liée à GND dans le schéma)
    // -----------------------------------------------------------------------
    reg [5:0] mem0, mem1, mem2, mem3;

    // -----------------------------------------------------------------------
    // 5. Drapeaux "digit complet" enregistrés (done_ff0..3)
    //    Calculés sur les sorties MUX (valeurs qui seront écrites), pas sur les
    //    valeurs déjà en mémoire — cohérent avec le schéma (and_done* → done_ff*)
    // -----------------------------------------------------------------------
    reg [3:0] done_ff;

    // Signaux de décodage (and_sel0..3 du schéma)
    wire sel0 = (cnt == 2'b00);
    wire sel1 = (cnt == 2'b01);
    wire sel2 = (cnt == 2'b10);
    wire sel3 = (cnt == 2'b11);

    // Write-enable par digit (and_wr_en0..3 = sel_i AND btn_pulse)
    wire wr0 = btn_pulse & sel0;
    wire wr1 = btn_pulse & sel1;
    wire wr2 = btn_pulse & sel2;
    wire wr3 = btn_pulse & sel3;

    // Sorties MUX : maintien si pas d'écriture, sinon OR avec curseur (or_write + mx)
    wire [5:0] nxt0 = wr0 ? (mem0 | cursor) : mem0;
    wire [5:0] nxt1 = wr1 ? (mem1 | cursor) : mem1;
    wire [5:0] nxt2 = wr2 ? (mem2 | cursor) : mem2;
    wire [5:0] nxt3 = wr3 ? (mem3 | cursor) : mem3;

    // Done combinatoire : tous les segments a..f à 1 = le chiffre "0" est formé
    wire [3:0] done_comb;
    assign done_comb[0] = &nxt0;
    assign done_comb[1] = &nxt1;
    assign done_comb[2] = &nxt2;
    assign done_comb[3] = &nxt3;

    // Avancement du compteur : btn_pulse ET done_ff du cycle PRÉCÉDENT ET cnt ≠ 3
    // (and_cnt_adv_a/b + not_cnt_max du schéma)
    wire cnt_advance = btn_pulse & done_ff[cnt] & ~sel3;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cnt     <= 2'b00;
            mem0    <= 6'b0;  mem1 <= 6'b0;
            mem2    <= 6'b0;  mem3 <= 6'b0;
            done_ff <= 4'b0;
        end else begin
            // Mise à jour de la mémoire (synchrone avec le schéma)
            mem0 <= nxt0;
            mem1 <= nxt1;
            mem2 <= nxt2;
            mem3 <= nxt3;
            // Mise à jour des drapeaux done (done_ff* cloqués sur les mêmes valeurs)
            done_ff <= done_comb;
            // Avancement du digit actif
            if (cnt_advance)
                cnt <= cnt + 1'b1;
        end
    end

    // -----------------------------------------------------------------------
    // 6. Affichage — overlay du curseur sur le digit actif uniquement
    //    (and_disp_* + or_disp_* du schéma)
    //    seg_i[5:0] = mem_i OR (cursor si digit i sélectionné)
    //    seg_i[6]   = g = 0 (toujours éteint, comme dans le schéma)
    // -----------------------------------------------------------------------
    assign seg0 = {1'b0, mem0 | (cursor & {6{sel0}})};
    assign seg1 = {1'b0, mem1 | (cursor & {6{sel1}})};
    assign seg2 = {1'b0, mem2 | (cursor & {6{sel2}})};
    assign seg3 = {1'b0, mem3 | (cursor & {6{sel3}})};

endmodule