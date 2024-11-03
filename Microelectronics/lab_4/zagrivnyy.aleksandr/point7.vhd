LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY point7 IS
	PORT(data: IN std_logic;
		clk: IN std_logic;
		reset: IN std_logic;
		Q1: OUT std_logic;
		Q2: OUT std_logic);
END point7;

ARCHITECTURE behav OF point7 IS
	SIGNAL reg_data: std_logic_vector(3 DOWNTO 0) := "0000";
BEGIN
	PROCESS(clk, reset)
	BEGIN
		IF reset='0' THEN
			reg_data <= "0000";
		ELSE
			IF falling_edge(clk) THEN reg_data(3) <= reg_data(2);
			ELSIF rising_edge(clk) THEN reg_data(2) <= reg_data(1);
			ELSIF falling_edge(clk) THEN reg_data(1) <= reg_data(0);
			ELSIF rising_edge(clk) THEN reg_data(0) <= data;
			END IF;
		END IF;
	END PROCESS;
	
	Q1 <= reg_data(1);
	Q2 <= reg_data(3);
END behav;
