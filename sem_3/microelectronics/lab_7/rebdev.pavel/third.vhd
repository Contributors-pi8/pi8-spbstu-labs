library ieee;
use ieee.std_logic_1164.all;

entity third is
  port
	(
    r0 : in std_logic;
    r1 : in std_logic;
    r2 : in std_logic;
    r3 : in std_logic;
    r4 : in std_logic;
    r5 : in std_logic;
    r6 : in std_logic;
    r7 : in std_logic;
    EI : in std_logic;

    a0 : out std_logic;
    a1 : out std_logic;
    a2 : out std_logic;
    G : out std_logic;
    EO : out std_logic
  );
end third;

architecture behav of third is
begin
  process(r0, r1, r2, r3, r4, r5, r6, r7, EI)
  begin
    a2 <= EI and (r7 or r6 or r5 or r4);
    a1 <= EI and (r7 or r6 or r3 or r2);
    a0 <= EI and (r7 or r5 or r3 or r1);
    G <= EI and (r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7);
    EO <= EI and (not (r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7));
  end process;
end behav;
