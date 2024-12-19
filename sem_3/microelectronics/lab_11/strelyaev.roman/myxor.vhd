LIBRARY ieee; 

USE ieee.std_logic_1164.all; 
ENTITY myxor IS 
PORT 
(
x1,x2: IN std_logic;
result: INOUT std_logic
);
END myxor; 
architecture behav of myxor is 
begin
result<=x1 xor x2;
end behav;
