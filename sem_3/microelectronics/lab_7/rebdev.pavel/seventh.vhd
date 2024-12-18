library ieee;
use ieee.std_logic_1164.all;

entity seventh is
  port
	(
    input : in std_logic_vector (7 downto 0);
    EI : in std_logic;

    output : out std_logic_vector (7 downto 0)
  );
end seventh;

architecture behav of seventh is
begin
  process(input, EI)
  begin
    output(0) <= EI and input(0) and not (input(1) or input(2) or input(3) or input(4) or input(5) or input(6) or input(7));
    output(1) <= EI and input(1) and not (input(2) or input(3) or input(4) or input(5) or input(6) or input(7));
    output(2) <= EI and input(2) and not (input(3) or input(4) or input(5) or input(6) or input(7));
    output(3) <= EI and input(3) and not (input(4) or input(5) or input(6) or input(7));
    output(4) <= EI and input(4) and not (input(5) or input(6) or input(7));
    output(5) <= EI and input(5) and not (input(6) or input(7));
    output(6) <= EI and input(6) and not input(7);
    output(7) <= EI and input(7);
  end process;
end behav;
