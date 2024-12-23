library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity timer23 is
    port (clock, rst_sw, en_sw : in std_logic;
          seg2, seg3 : out std_logic_vector(6 downto 0));
end timer23;

architecture struc of timer23 is
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
  
  component or_gate2 is
    port (in1, in2 : in std_logic;
          z : out std_logic);
  end component;
  
  signal clk1, z0, z1, z2, z3 : std_logic;
  signal q2, q3       : std_logic_vector(3 downto 0);

begin
  clockdiv : clkdiv      port map (clk => clock, clko => clk1);
  andgate0 : and_gate2   port map (in1 => q3(0), in2 => q3(3), z => z0);
  andgate1 : and_gate3   port map (in1 => q2(1), in2 => q3(0), in3 => q3(1), z => z1);
  orgate0  : or_gate2    port map (in1 => z0, in2 => z1, z => z3);
  counter3 : bcd_counter port map (clk => clk1, rst => rst_sw, en => en_sw, ld => z3, q => q3);
  segment3 : encoder7seg port map (hex => q3, s => seg3);
  counter2 : bcd_counter port map (clk => clk1, rst => rst_sw, en => z3, ld => z1, q => q2);
  segment2 : encoder7seg port map (hex => q2, s => seg2);
  
end struc;
