library ieee;
use ieee.std_logic_1164.all;

entity and_gate4 is
    port(
      in1, in2, in3, in4 : in std_logic;
      z        : out std_logic);
end and_gate4;

architecture dataflow of and_gate4 is
begin
  z <= in1 AND in2 AND in3 AND in4;
end dataflow;