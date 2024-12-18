LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab_3_3 IS
PORT(
  s: IN std_logic;
  r: IN std_logic;
  q: INOUT std_logic;
  qb: INOUT std_logic );
END lab_3_3;

ARCHITECTURE behav OF lab_3_3 IS
COMPONENT lab_3_2
PORT( a: IN std_logic;
  b: IN std_logic;
  c: INOUT std_logic );
END COMPONENT;

BEGIN
u1: lab_3_2
  PORT MAP(s, qb, q);
u2: lab_3_2
  PORT MAP(q, r, qb);
END behav;

CONFIGURATION con OF lab_3_3 IS
  FOR behav
    FOR u1, u2: lab_3_2
      USE ENTITY work.lab_3_2(behavior);
    END FOR;
  END FOR;
END con;
