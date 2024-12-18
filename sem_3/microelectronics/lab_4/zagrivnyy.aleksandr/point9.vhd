LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY point9 IS
	PORT(x1: IN std_logic;
		x2: IN std_logic;
		x3: IN std_logic;
		x4: IN std_logic;
		save: IN std_logic;
		reset: IN std_logic;
		print: IN std_logic;
		q: OUT std_logic_vector(3 DOWNTO 0));
END point9;

ARCHITECTURE behav OF point9 IS
	SIGNAL data: std_logic_vector(3 DOWNTO 0) := "0000";
BEGIN
	PROCESS(save, reset)
	BEGIN
		if reset='0' THEN
			data <= "0000";
		ELSIF (save'EVENT and save='1') THEN
			data <= x1 & x2 & x3 & x4;
		END IF;
	END PROCESS;
	
	PROCESS(print)
	BEGIN
		IF print='1' THEN
			q <= data;
		ELSE
			q <= "0000";
		END IF;
	END PROCESS;
END behav;
