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
  signal more_buf : std_logic_vector (1 downto 0);
  signal less_buf : std_logic_vector (1 downto 0);
  signal equal_buf : std_logic_vector (1 downto 0);
begin
  u2 : fourth
    port map(a(0), a(1), b(0), b(1), more_buf(0), less_buf(0), equal_buf(0));
  u1 : fourth
    port map(a(2), a(3), b(2), b(3), more_buf(1), less_buf(1), equal_buf(1));
  process(a, b)
  begin
    more <= more_buf(1) or (equal_buf(1) and more_buf(0));
    less <= less_buf(1) or (equal_buf(1) and less_buf(0));
    equal <= (equal_buf(0) and equal_buf(1));
  end process;
end behav;
configuration con of fifth is
  for behav
    for u1, u2 : fourth
      use entity work.fourth(behaviour);
    end for;
  end for;
end con;
