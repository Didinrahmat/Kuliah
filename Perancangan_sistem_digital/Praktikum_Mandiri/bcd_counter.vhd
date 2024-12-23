library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity bcd_counter is
    generic (LOADING : std_logic_vector(3 downto 0) := "0000");
    port (clk, rst, en, ld : in std_logic;
          q : out std_logic_vector(3 downto 0));
end bcd_counter;

architecture alg of bcd_counter is
    signal qc : std_logic_vector(3 downto 0);
begin
    process(clk, rst, en)
    begin
        if rst = '0' then
            qc <= (others => '0');
        elsif rising_edge(clk) and en = '1' then
            if ld = '1' then
                qc <= LOADING;
            else
                qc <= qc + 1;
            end if;
        end if;
    end process;
    q <= qc;
end alg;