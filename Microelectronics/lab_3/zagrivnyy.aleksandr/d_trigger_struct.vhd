LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_trigger_struct IS
PORT(d: IN std_logic;
 l: IN std_logic;
 q: INOUT std_logic;
 qb: INOUT std_logic);
END d_trigger_struct;

ARCHITECTURE behav of d_trigger_struct IS
COMPONENT notand
PORT(a: IN std_logic;
 b: IN std_logic;
 c: INOUT std_logic);
END COMPONENT;

COMPONENT rstr
PORT(s: IN std_logic;
 r: IN std_logic;
 q: INOUT std_logic;
 qb: INOUT std_logic);
END COMPONENT;

SIGNAL s: std_logic;
SIGNAL r: std_logic;
BEGIN
nand1: notand
 PORT MAP(d, l, s);
nand2: notand
 PORT MAP(s, l, r);
rst: rstr
 PORT MAP(s, r, q, qb);
END behav;

CONFIGURATION conf OF d_trigger_struct IS
 FOR behav
  FOR nand1, nand2: notand
   USE ENTITY work.notand(behavior);
  END FOR;
  FOR rst: rstr
   USE ENTITY work.rstr(behav);
  END FOR;
 END FOR;
END conf;
 