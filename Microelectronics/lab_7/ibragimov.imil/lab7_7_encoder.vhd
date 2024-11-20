LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab7_7_encoder IS

	PORT
	(
		EI		: IN	STD_LOGIC;
		r		: IN	STD_LOGIC_VECTOR(0 to 7);

		a		: OUT	STD_LOGIC_VECTOR(2 downto 0);
        G       : OUT	STD_LOGIC;
		EO		: OUT 	STD_LOGIC
	);
	
END lab7_7_encoder;

ARCHITECTURE behav OF lab7_7_encoder IS

	SIGNAL Encoding : STD_LOGIC_VECTOR(0 to 2);

BEGIN
	PROCESS(EI, r)
	BEGIN
		IF (EI = '1') THEN
			G <= '1';
			EO <= '0';

			IF (r(7) = '1') THEN
				Encoding <= "111";
			ELSIF (r(6) = '1') THEN
				Encoding <= "110";
			ELSIF (r(5) = '1') THEN
				Encoding <= "101";
			ELSIF (r(4) = '1') THEN
				Encoding <= "100";
			ELSIF (r(3) = '1') THEN
				Encoding <= "011";
			ELSIF (r(2) = '1') THEN
				Encoding <= "010";
			ELSIF (r(1) = '1') THEN
				Encoding <= "001";
			ELSIF (r(0) = '1') THEN
				Encoding <= "000";
			ELSE
				Encoding <= "000"; G <= '0'; EO <= '1';
			END IF;
		ELSE
			Encoding <= "000"; G <= '0'; EO <= '0';
		END IF;

	END PROCESS;

	a <= Encoding;
	
END behav;
