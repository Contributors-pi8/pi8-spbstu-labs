LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dtrig IS
	PORT
	(
		d: IN std_logic;
		l: IN std_logic;
		q: INOUT std_logic;
		qb: INOUT std_logic
	);
END dtrig;

ARCHITECTURE behav of dtrig IS
	COMPONENT notand
	PORT
		(
			a: IN std_logic;
			b: IN std_logic;
			c: INOUT std_logic;
		);
	END COMPONENT;

	COMPONENT rstr
		PORT
		(
			s: IN std_logic;
			r: IN std_logic;
			q: INOUT std_logic;
			qb: INOUT std_logic
		);
	END COMPONENT;

	SIGNAL s: std_logic;
	SIGNAL r: std_logic;
	BEGIN
	notAnd1: notand
		PORT MAP(d, l, s);
	notAnd2: notand
		PORT MAP(s, l, r);
	RStr: rstr
		PORT MAP(s, r, q, qb);
END behav;

CONFIGURATION config OF dtrig IS
	FOR behav
		FOR notAnd1, notAnd2: notand
			USE ENTITY work.notand(behavior);
		END FOR;
		FOR RStr: rstr
			USE ENTITY work.notand(behavior);
		END FOR;
	END FOR;
END config
