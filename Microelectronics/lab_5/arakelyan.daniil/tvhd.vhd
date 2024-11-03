LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tvhd IS
PORT( T: IN std_logic;
	Q: OUT std_logic;
	Qi: OUT std_logic);
END tvhd;
ARCHITECTURE behav OF tvhd IS
	signal Q1t, Q2t: std_logic:='0';
BEGIN
PROCESS(T)
	BEGIN
		if(T'event and T='1') then
			Q<=not Q1t;
			Qi<=Q1t;
			Q2t<=not Q1t;
		END IF;
END PROCESS;
Q1t<=Q2t;
END behav;
