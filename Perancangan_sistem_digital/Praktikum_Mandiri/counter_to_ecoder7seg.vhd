library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity counter_to_ecoder7seg is
    port (clk_in, rst_in, en_in, ld_in : in std_logic;
          s : out std_logic_vector(6 downto 0));
end counter_to_ecoder7seg;

architecture final of counter_to_ecoder7seg is
    component bcd_counter is
      port (clk, rst, en, ld : in std_logic;
            q : out std_logic_vector(3 downto 0));
    end component;
    component encoder7seg is
      port(
             hex	: in std_logic_vector(3 downto 0);
              s		: out std_logic_vector(6 downto 0));
    end component;
    
    signal b4 : std_logic_vector(3 downto 0);
    
  begin
    counter : bcd_counter port map (clk => clk_in, rst => rst_in, en => en_in, ld => ld_in, q => b4);
    segment : encoder7seg port map (hex => b4, s => s);
end final;