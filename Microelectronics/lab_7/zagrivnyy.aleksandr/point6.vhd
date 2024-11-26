LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY point6 IS
	PORT(input: IN std_logic_vector(7 downto 0);
		EL: IN std_logic;
		output: OUT std_logic_vector(7 downto 0);
		EO: OUT std_logic);
END point6;

ARCHITECTURE behav of point6 IS
	COMPONENT point3
		PORT(input: IN std_logic_vector(7 downto 0);
			EL: IN std_logic;
			output: OUT std_logic_vector(2 downto 0);
			EO: OUT std_logic;
			G: INOUT std_logic);
	END COMPONENT;
	
	COMPONENT decoder
		PORT(en: IN  std_logic;
			a: IN  std_logic_vector(2 downto 0);
			y: OUT std_logic_vector(7 downto 0));
	END COMPONENT;
	
	SIGNAL enc_out: std_logic_vector(2 downto 0);
	SIGNAL g: std_logic;
	
BEGIN
	enc: point3
		PORT MAP(input => input(7 downto 0),
			EL => EL,
			output => enc_out,
			EO => EO,
			G => g);
			
	dec: decoder
		PORT MAP(en => g,
			a => enc_out,
			y => output);
END behav;
