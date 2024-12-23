library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity timer59 is
    port (clock, rst_sw, en_sw : in std_logic;
          seg5, seg9 : out std_logic_vector(6 downto 0));
end timer59;

architecture struc of timer59 is
  component bcd_counter is
    port (clk, rst, en, ld : in std_logic;
          q : out std_logic_vector(3 downto 0));
  end component;
  component encoder7seg is
    port(
      hex	: in std_logic_vector(3 downto 0);
      s		: out std_logic_vector(6 downto 0));
  end component;
  component clkdiv is
    port (clk : in std_logic;
          clko : out std_logic);
  end component;
  component and_gate2 is
    port (in1, in2 : in std_logic;
          z : out std_logic);
  end component;
  component and_gate3 is
    port (in1, in2, in3 : in std_logic;
          z : out std_logic);
  end component;
  signal clk1, z1, z2 : std_logic;
  signal q5, q9       : std_logic_vector(3 downto 0);

begin
  
  clockdiv : clkdiv      port map (clk => clock, clko => clk1);
  andgate0 : and_gate2   port map (in1 => q9(1), in2 => q9(2), z => z1);
  andgate1 : and_gate3   port map (in1 => q5(1), in2 => q5(1), in3 => z1, z => z2);
  counter9 : bcd_counter port map (clk => clk1, rst => rst_sw, en => en_sw, ld => z1, q => q9);
  segment9 : encoder7seg port map (hex => q9, s => seg9);
  counter5 : bcd_counter port map (clk => clk1, rst => rst_sw, en => z1, ld => z2, q => q5);
  segment5 : encoder7seg port map (hex => q5, s => seg5);
  
end struc;


