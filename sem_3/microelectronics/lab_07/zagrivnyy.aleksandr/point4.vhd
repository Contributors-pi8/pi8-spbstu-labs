LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY point4 IS
	PORT(input: IN std_logic_vector(15 downto 0);
		EL: IN std_logic;
		output: OUT std_logic_vector(3 downto 0);
		EO: OUT std_logic;
		G: INOUT std_logic);
END point4;

ARCHITECTURE behav OF point4 IS
	COMPONENT point3
		PORT(input: IN std_logic_vector(7 downto 0);
			EL: IN std_logic;
			output: OUT std_logic_vector(2 downto 0);
			EO: OUT std_logic;
			G: INOUT std_logic);
	END COMPONENT;
	
	SIGNAL G1, G2: std_logic;
	SIGNAL EO1, EO2: std_logic;
	SIGNAL output1, output2: std_logic_vector(2 downto 0);

BEGIN
	encoder1: point3
		PORT MAP(input => input(7 downto 0),
			EL => EO2,
			output => output1,
			EO => EO1,
			G => G1);
	
	encoder2: point3
		PORT MAP(input => input(15 downto 8),
			EL => EL,
			output => output2,
			EO => EO2,
			G => G2);
	
	G <= G1 or G2;
	output(2 downto 0) <= output1(2 downto 0) or output2(2 downto 0);
	output(3) <= not EO2;
END behav;
