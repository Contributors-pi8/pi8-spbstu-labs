LIBRARY ieee; 

USE ieee.std_logic_1164.all; 
ENTITY lab11_5_1 IS 
PORT 
(
d0_3,d1_5,d2_6,d3_7: IN std_logic;
od0,od1,od2,od3,k1,k2,k3,k: INOUT std_logic
);
END lab11_5_1; 
architecture behav of lab11_5_1 is 
begin 
--process (d0_3,d1_5,d2_6,d3_7) 
--begin 
od0<=d0_3;
od1<=d1_5;
od2<=d2_6;
od3<=d3_7;
k1<= d0_3 xor d1_5 xor d3_7;
k2<= d0_3 xor d2_6 xor d3_7;
k3<= d1_5 xor d2_6 xor d3_7;
k<= (d0_3 xor d1_5 xor d3_7) xor (d0_3 xor d2_6 xor d3_7) xor (d1_5 xor d2_6 xor d3_7) xor d0_3 xor d1_5 xor d2_6 xor d3_7;
--end process;
end behav;
