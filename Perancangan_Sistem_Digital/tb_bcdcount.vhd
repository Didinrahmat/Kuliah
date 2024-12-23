library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_bcdcount is
end entity;

architecture proses_count of tb_bcdcount is

component bcd_counter is
  generic (LOADING : std_logic_vector(3 downto 0) := "0000");
  port (clk, rst, en, ld : in std_logic;
  q : out std_logic_vector(3 downto 0));
end component;
  
signal clock, rst1, ena, ld1 : std_logic := '0';
signal q1 : std_logic_vector (3 downto 0);

begin 
  tester: bcd_counter
  port map(clk => clock, 
           en => ena,
           ld => ld1,
           q => q1, 
           rst => rst1);
           
process 
  begin 
    clock <= '1'; wait for 1 ns; 
    clock <= '0'; wait for 1 ns;
end process;

process 
  begin 
    ena <= '1'; wait for 20 ns;
    ena <= '0'; wait for 5 ns; 
    ena <= '1'; wait for 1000 ns;
end process;

process 
  begin
  rst1 <= '1'; wait for 10 ns;
    rst1 <= '0'; wait for 5 ns;
    rst1 <= '1'; wait for 1000 ns;
end process;

end;