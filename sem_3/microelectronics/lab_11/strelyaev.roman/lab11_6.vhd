LIBRARY ieee; 

USE ieee.std_logic_1164.all; 
ENTITY lab11_6 IS 
PORT 
(
dtm: in std_logic_vector(7 downto 0);
d: in std_logic_vector(3 downto 0);
od:inout std_logic_vector(3 downto 0);
one_err, dbl_err: inout std_logic
);
END lab11_6; 
architecture behav of lab11_6 is
signal dtx:std_logic_vector(7 downto 0);
signal dtx1:std_logic_vector(7 downto 0);
signal r1,r2,r3,r4: std_logic;

Component lab11_5_1
PORT 
(d0_3,d1_5,d2_6,d3_7: IN std_logic;
od0,od1,od2,od3,k1,k2,k3,k: INOUT std_logic
);
END component; 

Component lab11_5_2
PORT
(d0_3,d1_5,d2_6,d3_7,k,k1,k2,k3: IN std_logic;
od0,od1,od2,od3,one_err, dbl_err,p1,p2,p3,kp: INOUT std_logic
);
END component;

Component myxor
Port
(
x1,x2: IN std_logic;
result: INOUT std_logic
);
End component;
begin

u1: lab11_5_1
Port Map (d(0),d(1),d(2),d(3),dtx(0),dtx(1),dtx(2),dtx(3),dtx(4),dtx(5),dtx(6),dtx(7));

c0:myxor
Port Map (dtx(0),dtm(0),dtx1(0));

c1:myxor
Port Map (dtx(1),dtm(1),dtx1(1));

c2:myxor
Port Map (dtx(2),dtm(2),dtx1(2));

c3:myxor
Port Map (dtx(3),dtm(3),dtx1(3));

c4:myxor
Port Map (dtx(4),dtm(4),dtx1(4));

c5:myxor
Port Map (dtx(5),dtm(5),dtx1(5));

c6:myxor
Port Map (dtx(6),dtm(6),dtx1(6));

c7:myxor
Port Map (dtx(7),dtm(7),dtx1(7));

u2: lab11_5_2
Port Map(dtx1(0),dtx1(1),dtx1(2),dtx1(3),dtx1(7),dtx1(4),dtx1(5),dtx1(6),od(0),od(1),od(2),od(3),one_err,dbl_err,r1,r2,r3,r4);

end behav;

configuration con of lab11_6 is
for behav 
for c0,c1,c2,c3,c4,c5,c6,c7:myxor
use entity work.myxor(behav);
end for; 

for u1: lab11_5_1
use entity work.lab11_5_1(behav);
end for;
for u2: lab11_5_2
use entity work.lab11_5_2(behav);
end for;

end for;
end con;
