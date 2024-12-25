LIBRARY ieee; 

USE ieee.std_logic_1164.all; 
ENTITY lab11_5_2 IS 
PORT 
(
d0_3,d1_5,d2_6,d3_7,k,k1,k2,k3: IN std_logic;
od0,od1,od2,od3,one_err, dbl_err,p1,p2,p3,kp: INOUT std_logic
);
END lab11_5_2; 
architecture behav of lab11_5_2 is 

begin 
p1<= k1 xor d0_3 xor d1_5 xor d3_7;
p2<= k2 xor d0_3 xor d2_6 xor d3_7;
p3<= k3 xor d1_5 xor d2_6 xor d3_7;
kp<= k1 xor k2 xor k3 xor k xor d0_3 xor d1_5 xor d2_6 xor d3_7;

one_err<=kp;
dbl_err<=(not kp) and (p1 or p2 or p3);
od0<= d0_3 xor (p1 and p2 and not p3);
od1<= d1_5 xor (p3 and p1 and not p2);
od2<= d2_6 xor (p3 and p2 and not p1);
od3<= d3_7 xor (p3 and p2 and p1);
end behav;
