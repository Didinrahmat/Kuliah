library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity jam_digital is
    port (clock, rst_sw, en_sw : in std_logic;
          seg2, seg3, seg5, seg9 : out std_logic_vector(6 downto 0));
end jam_digital;

architecture struc of jam_digital is
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
  component and_gate4 is
    port (in1, in2, in3, in4 : in std_logic;
          z : out std_logic);
  end component;
  component or_gate2 is
    port (in1, in2 : in std_logic;
          z : out std_logic);
  end component;
  
  signal clk1, z0, z1, z2, z3, z4 : std_logic;
  signal q2, q3, q5, q9           : std_logic_vector(3 downto 0);

begin
  clockdiv : clkdiv      port map (clk => clock, clko => clk1);
  
  andgate0 : and_gate2   port map (in1 => q9(0), in2 => q9(3), z => z0);
  andgate1 : and_gate3   port map (in1 => q5(0), in2 => q5(2), in3 => z0, z => z1);
  andgate2 : and_gate3   port map (in1 => q3(0), in2 => q3(3), in3 => z1, z => z2);
  andgate3 : and_gate4   port map (in1 => q2(1), in2 => q3(0), in3 => q3(1), in4 => z1, z => z3);
  orgate0  : or_gate2    port map (in1 => z3, in2 => z2, z => z4);
  
  counter3 : bcd_counter port map (clk => clk1, rst => rst_sw, en => z1, ld => z4, q => q3);
  segment3 : encoder7seg port map (hex => q3, s => seg3);
  counter2 : bcd_counter port map (clk => clk1, rst => rst_sw, en => z4, ld => z3, q => q2);
  segment2 : encoder7seg port map (hex => q2, s => seg2);
  
  counter9 : bcd_counter port map (clk => clk1, rst => rst_sw, en => en_sw, ld => z0, q => q9);
  segment9 : encoder7seg port map (hex => q9, s => seg9);
  counter5 : bcd_counter port map (clk => clk1, rst => rst_sw, en => z0, ld => z1, q => q5);
  segment5 : encoder7seg port map (hex => q5, s => seg5);
  
end struc;