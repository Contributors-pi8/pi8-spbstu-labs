LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab7_7_decoder IS

	PORT
	(
		a  : IN 	STD_LOGIC_VECTOR(2 downto 0);
		EN : IN 	STD_LOGIC;
		y  : OUT 	STD_LOGIC_VECTOR(7 downto 0)
	);
	
END lab7_7_decoder;

ARCHITECTURE behav OF lab7_7_decoder IS
BEGIN
	PROCESS(EN, a)
	BEGIN
		IF (EN = '1') THEN
			CASE a IS
				WHEN "000"  => y <= "01111111";
				WHEN "001"  => y <= "10111111";
				WHEN "010"  => y <= "11011111";
				WHEN "011"  => y <= "11101111";
				WHEN "100"  => y <= "11110111";
				WHEN "101"  => y <= "11111011";
				WHEN "110"  => y <= "11111101";
				WHEN "111" 	=> y <= "11111110";
				WHEN OTHERS => y <= "11111111";
			END CASE;
		ELSE
			y <= "11111111";
		END IF;
	END PROCESS;
END behav;
