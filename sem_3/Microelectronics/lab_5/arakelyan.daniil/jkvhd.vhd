LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY jkvhd IS
PORT( J: IN std_logic;
	K: IN std_logic;
	C: IN std_logic;
	Q: OUT std_logic;
	Qi: OUT std_logic);
END jkvhd;
ARCHITECTURE behav OF jkvhd IS
	signal Q1t, Q2t : std_logic;
BEGIN
PROCESS(J,K,C)
	BEGIN
		if(C'event and C='1') then
			if(J='0' and K='1') then
				Q1t<='0';
				Q2t<='1';
			elsif(J='1' and K='0') then
				Q1t<='1';
				Q2t<='0';
			elsif(J='1' and K='1') then
				if(Q1t='0' and Q2t='0') then
					Q1t<='1';
				else
					Q1t<=not Q1t;
					Q2t<=not Q2t;
				end if;
			END if;
		END IF;
		Q<=Q1t;
		Qi<=Q2t;
END PROCESS;
END behav;
