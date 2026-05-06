--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed May  6 15:24:43 2026
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wrapper_for_mini_light_up_game is
   port (
      clk : in std_logic;
      reset : in std_logic;
      btn : in std_logic;
      seg0 : out std_logic_vector(5 downto 0);
      seg1 : out std_logic_vector(5 downto 0);
      seg2 : out std_logic_vector(5 downto 0);
      seg3 : out std_logic_vector(5 downto 0)
   );
end wrapper_for_mini_light_up_game;

architecture rtl of wrapper_for_mini_light_up_game is

component mini_light_up_game
 port (
   clk : in std_logic;
   reset : in std_logic;
   btn : in std_logic;
   seg0 : out std_logic_vector (5 downto 0);
   seg1 : out std_logic_vector (5 downto 0);
   seg2 : out std_logic_vector (5 downto 0);
   seg3 : out std_logic_vector (5 downto 0)
 );
end component;

signal tmp_clk : std_logic;
signal tmp_reset : std_logic;
signal tmp_btn : std_logic;
signal tmp_seg0 : std_logic_vector (5 downto 0);
signal tmp_seg1 : std_logic_vector (5 downto 0);
signal tmp_seg2 : std_logic_vector (5 downto 0);
signal tmp_seg3 : std_logic_vector (5 downto 0);

begin

tmp_clk <= clk;

tmp_reset <= reset;

tmp_btn <= btn;

seg0 <= tmp_seg0;

seg1 <= tmp_seg1;

seg2 <= tmp_seg2;

seg3 <= tmp_seg3;



u1:   mini_light_up_game port map (
		clk => tmp_clk,
		reset => tmp_reset,
		btn => tmp_btn,
		seg0 => tmp_seg0,
		seg1 => tmp_seg1,
		seg2 => tmp_seg2,
		seg3 => tmp_seg3
       );
end rtl;
