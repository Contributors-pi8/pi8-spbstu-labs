LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab_3_4 IS
PORT(
  s: IN std_logic;
  r: IN std_logic;
  q: OUT std_logic
);
END lab_3_4;

ARCHITECTURE behav OF lab_3_4 IS
SIGNAL qs: std_logic;
BEGIN
PROCESS (s,r)
  BEGIN
    IF s='1' THEN
	  IF r='1' THEN qs <=qs;
	  ELSE qs <='0';
      END IF;
	ELSE qs<='1';
	END IF;
END PROCESS;
q<=qs;
END behav;
