LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY point6_jk IS
	PORT(j: IN std_logic;
		c: IN std_logic;
		k: IN std_logic;
		q: OUT std_logic;
		qi: OUT std_logic);
END point6_jk;

ARCHITECTURE behav OF point6_jk IS
	SIGNAL jk: std_logic_vector(1 DOWNTO 0) := "00";
	SIGNAL qsig: std_logic := 'X';
BEGIN
	jk <= j & k;
	PROCESS(c)
	BEGIN
		IF (C'EVENT and C='1') THEN
			CASE jk IS
				WHEN "11" => qsig <= not qsig;
				WHEN "01" => qsig <= '0';
				WHEN "10" => qsig <= '1';
				WHEN OTHERS => qsig <= qsig;
			END CASE;
		END IF;
	END PROCESS;
	
	q <= qsig;
	qi <= not qsig;
END behav;
