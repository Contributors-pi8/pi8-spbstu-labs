LIBRARY ieee; 

USE ieee.std_logic_1164.all; 
ENTITY lab11_3_1 IS 
PORT 
(
p1,p2,p3,kp: IN std_logic;
one_err,dbl_err: INOUT std_logic
);
END lab11_3_1; 
architecture behav of lab11_3_1 is 
begin 
one_err<=kp;
dbl_err<=(not kp) and (p1 or p2 or p3);
end behav;
