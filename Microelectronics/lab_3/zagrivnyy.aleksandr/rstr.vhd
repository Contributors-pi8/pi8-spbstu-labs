LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY rstr IS
PORT(s: IN std_logic;
 r: IN std_logic;
 q: INOUT std_logic;
 qb: INOUT std_logic);
END rstr;
ARCHITECTURE behav OF rstr IS
COMPONENT notand							-- описание используемого компонента
PORT(a: IN std_logic;
 b: IN std_logic;
 c: INOUT std_logic);
END COMPONENT;
BEGIN
u1: notand									-- указание u1, как компонента notand
 PORT MAP(s, qb, q);					-- указание входов и выхода для u1
u2: notand
 PORT MAP(q, r, qb);
END behav;
CONFIGURATION con OF rstr IS
 FOR behav
  FOR u1, u2: notand
   USE ENTITY work.notand(behavior);	-- определяет интерфейс
  END FOR;										-- и модель компонента notand
 END FOR;
END con;