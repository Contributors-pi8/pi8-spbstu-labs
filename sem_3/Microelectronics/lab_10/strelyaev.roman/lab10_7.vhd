LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
ENTITY lab10_7 IS 
PORT 
(x1,x2,x3 : IN STD_logic;
x,a0,a1: OUT STD_logic);
END lab10_7; 
architecture behav of lab10_7 is 
begin  
--process(x1,x2,x3)
--begin
a0<=x1 xor x3;
a1<=x2 xor x3;
x<=(x1 and x2) or (x2 and x3) or (x1 and x3);
--end process;
end behav;
