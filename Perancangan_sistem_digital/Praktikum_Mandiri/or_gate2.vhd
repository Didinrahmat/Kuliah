library ieee;
use ieee.std_logic_1164.all;

entity or_gate2 is
    port(
      in1, in2 : in std_logic;
      z        : out std_logic);
end or_gate2;

architecture dataflow of or_gate2 is
begin
  z <= in1 OR in2;
end dataflow;
