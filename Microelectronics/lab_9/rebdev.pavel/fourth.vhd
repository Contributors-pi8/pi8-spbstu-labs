library ieee;
use ieee.std_logic_1164.all;

entity fourth is
  port
	(
    a0 : in std_logic;
    a1 : in std_logic;
    b0 : in std_logic;
    b1 : in std_logic;
    alb : in std_logic;
    aeb : in std_logic;
    amb : in std_logic;

    less : out std_logic;
    equal : out std_logic;
    more : out std_logic
  );
end fourth;

architecture behav of fourth is
begin
  process(a0, a1, b0, b1, alb, aeb, amb)
  begin
    less <= (not a0 and b0) or ((a0 xnor b0) and ((not a1 and b1) or ((a1 xnor b1) and alb)));
    equal <= (a0 xnor b0) and (a1 xnor b1) and aeb;
    more <= ( a0 and not b0) or ((a0 xnor b0) and ((a1 and not b1) or ((a1 xnor b1) and amb)));
  end process;
end behav;
