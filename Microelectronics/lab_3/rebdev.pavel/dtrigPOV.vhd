LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtrigpov IS
	PORT
	(
		d: IN std_logic;
		clk: IN std_logic;
		q1: OUT std_logic
	);
END dtrigpov;

ARCHITECTURE behav of dtrigpov IS
	BEGIN
	PROCESS(d, clk)
		BEGIN
		IF RISING_EDGE(clk) THEN
			q1<=d;
		END IF;
	END PROCESS;
END behav;
