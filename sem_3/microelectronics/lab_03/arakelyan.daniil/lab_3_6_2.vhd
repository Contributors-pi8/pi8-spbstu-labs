library ieee;
use ieee.std_logic_1164.all;

entity lab_3_6_2 IS
port(
  d: in std_logic;
  clk: in std_logic;
  q1: out std_logic
);
end lab_3_6_2;
architecture behav of lab_3_6_2 IS

begin
process(d,clk)
begin
	if rising_edge(clk) then
		q1<=d;
	end if;
end process;
end behav;
