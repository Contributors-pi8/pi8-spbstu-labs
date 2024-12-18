library ieee;
use ieee.std_logic_1164.all;

entity sixthdataPest is
  port
	(
    input : in std_logic_vector (7 downto 0);

    output : out std_logic_vector (7 downto 0)
  );
end sixthdataPest;

architecture behav of sixthdataPest is
begin
  process(input)
	begin
    output(0) <= input(0);
    output(1) <= input(1);
    output(2) <= input(2);
    output(3) <= input(3);
    output(4) <= not input(4);
    output(5) <= input(5);
    output(6) <= input(6);
    output(7) <= input(7);
  end process;
end behav;
