library ieee;
use ieee.std_logic_1164.all;

entity sixthCODER is
  port
	(
    D : in std_logic_vector (3 downto 0);

    output : out std_logic_vector (7 downto 0)
  );
end sixthCODER;

architecture behav of sixthCODER is
signal k : std_logic_vector(2 downto 0);
begin
  process(D)
  begin
    k(0) <= D(0) xor D(1) xor D(3);
    k(1) <= D(0) xor D(2) xor D(3);
    k(2) <= D(1) xor D(2) xor D(3);

    output(0) <= k(0);
    output(1) <= k(1);
    output(2) <= D(0);
    output(3) <= k(2);
    output(4) <= D(1);
    output(5) <= D(2);
    output(6) <= D(3);
    output(7) <= k(0) xor k(1) xor D(0) xor k(2) xor D(1) xor D(2) xor D(3);
  end process;
end behav;
