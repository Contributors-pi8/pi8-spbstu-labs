library ieee;
use ieee.std_logic_1164.all;

entity fifth is
  port
  (
    a : in std_logic_vector (3 downto 0);
    b : in std_logic_vector (3 downto 0);
    alb : in std_logic;
    aeb : in std_logic;
    amb : in std_logic;

    less : out std_logic;
    equal : out std_logic;
    more : out std_logic
  );
end fifth;

architecture behav of fifth is
  component fourth
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
  end component;
  signal more_buf : std_logic;
  signal less_buf : std_logic;
  signal equal_buf : std_logic;
begin
  u2 : fourth
    port map(a(2), a(3), b(2), b(3), alb, aeb, amb, less_buf, equal_buf, more_buf);
  u1 : fourth
    port map(a(0), a(1), b(0), b(1), less_buf, equal_buf, more_buf, less, equal, more);
end behav;
configuration con of fifth is
  for behav
    for u1, u2 : fourth
      use entity work.fourth(behav);
    end for;
  end for;
end con;
