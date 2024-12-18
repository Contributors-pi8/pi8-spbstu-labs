LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY point8 IS
	PORT(data: IN std_logic;
		clk1: IN std_logic;
		clk2: IN std_logic;
		reset: IN std_logic;
		Q1: OUT std_logic;
		Q2: OUT std_logic);
END point8;

ARCHITECTURE behav OF point8 IS
	SIGNAL tmp1: std_logic_vector(1 DOWNTO 0) := "00";
	SIGNAL tmp2: std_logic_vector(1 DOWNTO 0) := "00";
BEGIN
	PROCESS(clk1, reset)
	BEGIN
		IF reset='0' THEN
			tmp1(0) <= '0';
		ELSIF rising_edge(clk1) THEN
			tmp1(0) <= data;
		END IF;
	END PROCESS;
	
	PROCESS(clk2, reset)
	BEGIN
		IF reset='0' THEN
			tmp1(1) <= '0';
		ELSIF rising_edge(clk2) THEN
			tmp1(1) <= tmp1(0);
		END IF;
	END PROCESS;
	
	PROCESS(clk1, reset)
	BEGIN
		IF reset='0' THEN
			tmp2(0) <= '0';
		ELSIF rising_edge(clk1) THEN
			tmp2(0) <= tmp1(1);
		END IF;
	END PROCESS;
	
	PROCESS(clk2, reset)
	BEGIN
		IF reset='0' THEN
			tmp2(1) <= '0';
		ELSIF rising_edge(clk2) THEN
			tmp2(1) <= tmp2(0);
		END IF;
	END PROCESS;
	
	Q1 <= tmp1(1);
	Q2 <= tmp2(1);
END behav;
