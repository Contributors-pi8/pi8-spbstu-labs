LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY r2_t2_shift_r_vhdl IS
PORT (
	d 	   : IN  std_logic;
	c1     : IN  std_logic;
	c2     : IN std_logic;
	reload : IN  std_logic;
	Q1     : OUT std_logic;
	Q2     : OUT std_logic


);
END r2_t2_shift_r_vhdl ;
ARCHITECTURE behav OF r2_t2_shift_r_vhdl IS
	SIGNAL Q1S, Q1S_1t, Q1S_2t, Q2S_2t : std_logic := '0';
BEGIN

	-- Первый dff первый такт
	PROCESS (c1, reload) 
	BEGIN
		IF (reload = '0') THEN
			Q1S_1t <= '0';
		ELSIF (c1'event and c1 = '1') THEN
			Q1S_1t <= d;
		END IF;
	END PROCESS;

    -- Первый dff второй такт
	PROCESS (c2, reload) 
	BEGIN
		IF (reload = '0') THEN
			Q1S <= '0';
		ELSIF (c2'event and c2 = '1') THEN
			Q1S <= Q1S_1t;
		END IF;
	END PROCESS;

	-- Второй dff первый такт
	PROCESS (c1, reload) 
	BEGIN
		IF (reload = '0') THEN
			Q2S_2t <= '0';
		ELSIF (c1'event and c1 = '1') THEN
			Q2S_2t <= Q1S;

		END IF;
	END PROCESS;

	-- Второй dff второй такт
	PROCESS (c2, reload) 
	BEGIN
		IF (reload = '0') THEN
			Q2 <= '0';
		ELSIF (c2'event and c2 = '1') THEN
			Q2 <= Q2S_2t;

		END IF;
	END PROCESS;

	Q1 <= Q1S;

END behav;
