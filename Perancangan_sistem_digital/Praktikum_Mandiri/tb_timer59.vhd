library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb_timer59 is  
end entity;

architecture proses_count of tb_timer59 is

component timer59 is
  port (clock, rst_sw, en_sw : in std_logic;
        seg5, seg9 : out std_logic_vector(6 downto 0)); 
end component;

signal clk_in, rst_in, en_in : std_logic;
signal SEG5, SEG9 : std_logic_vector(6 downto 0); 

begin
  tester: timer59
  port map(clock => clk_in, 
           rst_sw => rst_in, 
           en_sw => en_in, 
           seg5 => SEG5, 
           seg9 => SEG9);
           
rst_in <= '0','1' after 1 ns;
en_in <= '0','1' after 1 ns;

process
  begin
   clk_in <= '0'; wait for 1 ns;
   clk_in <= '1'; wait for 1 ns;
end process;
end;
    

