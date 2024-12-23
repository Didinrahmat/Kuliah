library ieee;
use ieee.std_logic_1164.all;

entity and_gate2 is
    port(
      in1, in2 : in std_logic;
      z        : out std_logic);
end and_gate2;

architecture dataflow of and_gate2 is
begin
  z <= in1 AND in2;
end dataflow;