LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY vhdcounter IS
PORT( r, jk, c: in std_logic;
	q1, q2, q3, q4: out std_logic);
END vhdcounter;
ARCHITECTURE behav OF vhdcounter IS
	signal t1,t2,t3,t4:std_logic;
BEGIN
		q1<=t1;
		q2<=t2;
		q3<=t3;
		q4<=t4;
PROCESS(r, jk, c)
	BEGIN
		if(r='0') then
			t1<='0';
			t2<='0';
			t3<='0';
			t4<='0';
		elsif(c'event and c='1')then
			if (jk='1' and r='1') then
				if(t1='0') then
					t1<='1';
				elsif(t2='0') then
					t2<='1';
					t1<='0';
				elsif(t3='0') then
					t3<='1';
					t2<='0';
					t1<='0';
				elsif(t4='0') then
					t4<='1';
					t3<='0';
					t2<='0';
					t1<='0';
				end if;
			end if;
		end if;
		END PROCESS;
END behav;

