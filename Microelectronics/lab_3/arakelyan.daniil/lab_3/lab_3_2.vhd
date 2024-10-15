LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY lab_3_2 IS
PORT (a: IN std_logic;
  b: IN std_logic;
  c: INOUT std_logic);
END lab_3_2;
ARCHITECTURE behavior OF lab_3_2 IS
BEGIN
  C <= NOT (a AND b);
END behavior;
