LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY point3 IS
	PORT(input: IN std_logic_vector(7 downto 0);
		EL: IN std_logic;
		output: OUT std_logic_vector(2 downto 0);
		EO: OUT std_logic;
		G: INOUT std_logic);
END point3;

ARCHITECTURE behav OF point3 IS
BEGIN
	PROCESS(input, EL)
	BEGIN
		IF EL = '0' THEN
			output <= "000";
			G <= '0';
			EO <= '0';
		ELSE 
			G <= input(0) or input(1) or input(2) or input(3) or input(4) or input(5) or input(6) or input(7);
			IF input(7) = '1'    THEN output <= "111";
			ELSIF input(6) = '1' THEN output <= "110";
			ELSIF input(5) = '1' THEN output <= "101";
			ELSIF input(4) = '1' THEN output <= "100";
			ELSIF input(3) = '1' THEN output <= "011";
			ELSIF input(2) = '1' THEN output <= "010";
			ELSIF input(1) = '1' THEN output <= "001";
			ELSIF input(0) = '1' THEN output <= "000";
			ELSE output <= "000";
			END IF;
			EO <= not G;
		END IF;
	END PROCESS;
END behav;
			
