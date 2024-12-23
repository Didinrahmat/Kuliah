library ieee;
use ieee.std_logic_1164.all;

entity and_gate3 is
    port(
      in1, in2, in3 : in std_logic;
      z        : out std_logic);
end and_gate3;

architecture dataflow of and_gate3 is
begin
  z <= in1 AND in2 AND in3;
end dataflow;
