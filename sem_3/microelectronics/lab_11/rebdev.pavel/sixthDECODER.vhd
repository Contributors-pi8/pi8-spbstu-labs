library ieee;
use ieee.std_logic_1164.all;

entity sixthDECODER is
  port
	(
    input : in std_logic_vector (7 downto 0);

    D : out std_logic_vector (3 downto 0);
    ONE_ERR : out std_logic;
    DBL_ERR : out std_logic
  );
end sixthDECODER;

architecture behav of sixthDECODER is
signal p : std_logic_vector(3 downto 0);
begin
  process(input)
  begin
    p(0) <= input(0) xor input(2) xor input(4) xor input(6);
    p(1) <= input(1) xor input(2) xor input(5) xor input(6);
    p(2) <= input(3) xor input(4) xor input(5) xor input(6);
    p(3) <= input(0) xor input(1) xor input(2) xor input(3) xor input(4) xor input(5) xor input(6) xor input(7);

    D(0) <= input(2) xor (p(0) and p(1) and not p(2) and p(3));
    D(1) <= input(4) xor (p(0) and not p(1) and p(2) and p(3));
    D(2) <= input(5) xor (not p(0) and p(1) and p(2) and p(3));
    D(3) <= input(6) xor (p(0) and p(1) and p(2) and p(3));
    ONE_ERR <= p(3);
    DBL_ERR <= not (not (p(0) or p(1) or p(2) or p(3)) or p(3));
  end process;
end behav;
