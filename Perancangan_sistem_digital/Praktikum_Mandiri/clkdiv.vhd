library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clkdiv is
    port (clk : in std_logic;
          clko : out std_logic);
end clkdiv;

architecture alg of clkdiv is
    signal cnt : integer := 0;
    signal clktmp : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if cnt < 500000 then
                cnt <= cnt + 1;
            else
                clktmp <= not(clktmp);
                cnt <= 0;
            end if;
        end if;
    end process;
    clko <= clktmp;
end alg;