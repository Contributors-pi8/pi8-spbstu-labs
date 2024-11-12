LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY lab8_4 IS
	PORT (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,
x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,
x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,
x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,
x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,
x55,x56,x57,x58,x59,x60,x61,x62,x63,
a0,a1,a2,a3,a4,a5,e : in std_logic;
q: out std_logic);
END lab8_4 ;

ARCHITECTURE behave OF lab8_4 IS
SIGNAL q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16, q17,q18,q19,q20 : std_logic;
COMPONENT lab8_2_if
	PORT(x0,x1,x2,x3,a0,a1,e: IN std_logic;
	q: OUT std_logic);
END COMPONENT;

BEGIN
	mux1: lab8_2_if
	 PORT MAP(x0,x1,x2,x3,a0,a1,e, q1);
	mux2: lab8_2_if
	 PORT MAP(x4,x5,x6,x7,a0,a1,e, q2);
	mux3: lab8_2_if
	 PORT MAP(x8,x9,x10,x11,a0,a1,e, q3);
	mux4: lab8_2_if
	 PORT MAP(x12,x13,x14,x15,a0,a1,e, q4);
	mux5: lab8_2_if
	 PORT MAP(x16,x17,x18,x19,a0,a1,e, q5);
	mux6: lab8_2_if
	 PORT MAP(x20,x21,x22,x23,a0,a1,e, q6);
	mux7: lab8_2_if
	 PORT MAP(x24,x25,x26,x27,a0,a1,e, q7);
	mux8: lab8_2_if
	 PORT MAP(x28,x29,x30,x31,a0,a1,e, q8);
	mux9: lab8_2_if
	 PORT MAP(x32,x33,x34,x35,a0,a1,e, q9);
	mux10: lab8_2_if
	 PORT MAP(x36,x37,x38,x39,a0,a1,e, q10);
	mux11: lab8_2_if
	 PORT MAP(x40,x41,x42,x43,a0,a1,e, q11);
	mux12: lab8_2_if
	 PORT MAP(x44,x45,x46,x47,a0,a1,e, q12);
	mux13: lab8_2_if
	 PORT MAP(x48,x49,x50,x51,a0,a1,e, q13);
	mux14: lab8_2_if
	 PORT MAP(x52,x53,x54,x55,a0,a1,e, q14);
	mux15: lab8_2_if
	 PORT MAP(x56,x57,x58,x59,a0,a1,e, q15);
	mux16: lab8_2_if
	 PORT MAP(x60,x61,x62,x63,a0,a1,e, q16);
	mux17: lab8_2_if
	 PORT MAP(q1,q2,q3,q4,a2,a3,e, q17);
	mux18: lab8_2_if
	 PORT MAP(q5,q6,q7,q8,a2,a3,e, q18);
	mux19: lab8_2_if
	 PORT MAP(q9,q10,q11,q12,a2,a3,e, q19);
	mux20: lab8_2_if
	 PORT MAP(q13,q14,q15,q16,a2,a3,e, q20);
	mux21: lab8_2_if
	 PORT MAP(q17,q18,q19,q20,a4,a5,e, q);


	
END behave;

CONFIGURATION cond OF lab8_4 IS
	FOR behave
		FOR mux1,mux2,mux3,mux4,mux5,mux6,mux7,mux8,mux9,mux10,mux11,mux12,mux13,mux14,mux15,mux16,mux17,mux18,mux19,mux20,mux21: lab8_2_if
			USE ENTITY work.lab8_2_if(behav);
		END FOR;
	END FOR;
END cond;


