library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Tb_counter is
end entity;

architecture proses_count of Tb_counter is

component counter_to_encoder7seg is
  port (clk_in, rst_in, en_in, ld_in : in std_logic;
          s : out std_logic_vector(6 downto 0));
end component;
  
signal clock, reset, en, ld : std_logic;
signal s : std_logic_vector (6 downto 0);

begin
  unit_under_test: counter_to_encoder7seg
  port map( rst_in => reset, 
            clk_in => clock,
            en_in => en,
            ld_in => ld,
            s => s);  

reset <= '0', '1' after 10 ns;
en <= '0', '1' after 15 ns;
ld <= '1', '0' after 20 ns;

process 
  begin
  clock <= '0'; wait for 10 ns;
  clock <= '1'; wait for 10 ns;
end process;

end;