library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity tb2_counter is
-- Testbench tidak memiliki port
end entity;

architecture behavior of tb2_counter is
    -- Komponen yang akan diuji
    component counter_to_ecoder7seg is
        port (
            clk_in : in std_logic;
            rst_in : in std_logic;
            en_in : in std_logic;
            ld_in : in std_logic;
            s : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Sinyal internal untuk menghubungkan testbench dengan DUT (Device Under Test)
    signal clk_in : std_logic := '0';
    signal rst_in : std_logic := '0';
    signal en_in : std_logic := '0';
    signal ld_in : std_logic := '0';
    signal s : std_logic_vector(6 downto 0);

    -- Konstanta untuk period clock
    constant clk_period : time := 10 ns;
begin
    -- Instansiasi DUT
    uut: counter_to_ecoder7seg
        port map (
            clk_in => clk_in,
            rst_in => rst_in,
            en_in => en_in,
            ld_in => ld_in,
            s => s
        );

    -- Proses untuk menghasilkan sinyal clock
    clk_process: process
    begin
        while true loop
            clk_in <= '0';
            wait for clk_period / 2;
            clk_in <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Proses stimulus untuk menguji DUT
    stim_proc: process
    begin
        -- Reset sistem
        rst_in <= '1';
        wait for 20 ns;
        rst_in <= '0';

        -- Aktifkan enable dan load
        en_in <= '1';
        ld_in <= '1';
        wait for 10 ns;
        ld_in <= '0';

        -- Berikan waktu untuk proses counting
        wait for 100 ns;

        -- Matikan enable
        en_in <= '0';
        wait for 50 ns;

        -- Simulasi selesai
        wait;
    end process;
end behavior;

