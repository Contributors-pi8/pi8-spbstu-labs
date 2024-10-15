LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity lab_3_6 is
port(
	d: IN std_logic;
	l: IN std_logic;
	q: INOUT std_logic;
	qb: INOUT std_logic
);
end lab_3_6;

architecture behav of lab_3_6 is
--OUR NAND
component lab_3_2
port(
	a: IN std_logic;
	b: IN std_logic;
	c: INOUT std_logic
);
end component;

component lab_3_3
--OUR RS-trigger
port(
	s: IN std_logic;
	r: IN std_logic;
	q: INOUT std_logic;
	qb: INOUT std_logic
);
end component;

signal s: std_logic;
signal r: std_logic;
begin
--giving name our nand1 and nand2
nand1: lab_3_2
	port map(d, l, s);
nand2: lab_3_2
	port map(s, l, r);
rst: lab_3_3
	port map(s, r, q, qb);
end behav;

--configuration
configuration config of lab_3_6 is
	for behav
		for nand1, nand2: lab_3_2
			use entity work.lab_3_2(begavior);
		end for;
		for rst: lab_3_3
			use entity work.lab_3_3(behavior);
		end for;
	end for;
end config;
