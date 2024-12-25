LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab7_4 IS
	PORT
	(
		EI 					: IN STD_LOGIC;
		r					: IN	STD_LOGIC_VECTOR(0 to 15);
		a					: OUT 	STD_LOGIC_VECTOR(3 downto 0);
		G 					: OUT 	STD_LOGIC
	);
END lab7_4;

ARCHITECTURE a OF lab7_4 IS
	COMPONENT lab7_3
		PORT
		(
			EI		: IN	STD_LOGIC;
			r		: IN	STD_LOGIC_VECTOR(0 to 7);
			a		: OUT	STD_LOGIC_VECTOR(2 downto 0);
        	G       : OUT	STD_LOGIC;
			EO		: OUT 	STD_LOGIC
		);
	END COMPONENT;

	SIGNAL first_encoding 	: STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL second_encoding 	: STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL first_G 			: STD_LOGIC;
	SIGNAL second_G 		: STD_LOGIC;
	SIGNAL EO 				: STD_LOGIC;
BEGIN
	encoder1: lab7_3
		PORT MAP(
			EI => EI, 
			r => r(8 to 15),
			a => first_encoding,
			G => first_G,
			EO => EO
		);

	encoder2: lab7_3
		PORT MAP(
			EI => EO,
			r => r(0 to 7),
			a => second_encoding,
			G => second_G,
			EO => OPEN
		);

	a(2 downto 0) <= first_encoding(2 downto 0) OR second_encoding(2 downto 0);
	a(3) <= NOT EO;
	G <= first_G OR second_G;
END a;

