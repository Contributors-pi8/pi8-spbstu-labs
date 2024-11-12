LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab8_2_if IS
PORT( x0,x1,x2,x3,a0,a1,e: IN std_logic;
	q: OUT std_logic);
END lab8_2_if;

ARCHITECTURE behav OF lab8_2_if IS
BEGIN
PROCESS(a0,a1,e)
	BEGIN
		if(e='0') then
			q<='0';
		elsif(a0='0' and a1='0')then
			q<=x0;
		elsif(a0='1' and a1='0')then
			q<=x1; 
		elsif(a0='0' and a1='1')then
			q<=x2;
		elsif(a0='1' and a1='1')then
			q<=x3;
		end if;
END PROCESS;
END behav;
