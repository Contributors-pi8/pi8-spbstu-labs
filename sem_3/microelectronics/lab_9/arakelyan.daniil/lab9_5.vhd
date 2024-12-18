library ieee;
use ieee.std_logic_1164.all;

entity lab9_5 is

port(
	x_full : in std_logic_vector(3 downto 0);
	y_full : in std_logic_vector(3 downto 0);
	xmy0, xly0, xey0 : in std_logic;
	xmy, xly, xey : out std_logic
);

end lab9_5;

architecture behav of lab9_5 is

signal tmpxmy0, tmpxly0, tmpxey0 : std_logic;

component lab9_4

	port(
		x : in std_logic_vector(1 downto 0);
		y : in std_logic_vector(1 downto 0);
		xmy0, xly0, xey0 : in std_logic;
		xmy, xly, xey : out std_logic
	);

end component;

begin

	compr1: lab9_4
		port map(
			x => x_full(3 downto 2),
			y => y_full(3 downto 2),
			xmy0,
			xly0,
			xey0,
			tmpxmy0,
			tmpxly0,
			tmpxey0
		);
	compr2: lab9_4
		port map(
			x => x_full(1 downto 0),
			y => y_full(1 downto 0),
			tmpxmy0,
			tmpxly0,
			tmpxey0,
			xmy,
			xly,
			xey
		);

end behav;

configuration conf of lab9_5 is
	for behav
		for compr1, compr2 : lab9_4
			use entity work.lab9_4(behav);
		end for;
	end for;
end conf;
