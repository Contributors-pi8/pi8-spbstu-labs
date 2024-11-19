library ieee;
use ieee.std_logic_1164.all;

entity fourth is
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
    r8 : in std_logic;
    r9 : in std_logic;
    r10 : in std_logic;
    r11 : in std_logic;
    r12 : in std_logic;
    r13 : in std_logic;
    r14 : in std_logic;
    r15 : in std_logic;
    EI : in std_logic;

    a0 : out std_logic;
    a1 : out std_logic;
    a2 : out std_logic;
    a3 : out std_logic;
    G : out std_logic
  );
end fourth;

architecture behav of fourth is
  component third
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
  end component;
  signal a0_buf : std_logic_vector (1 downto 0);
  signal a1_buf : std_logic_vector (1 downto 0);
  signal a2_buf : std_logic_vector (1 downto 0);
  signal G_buf : std_logic_vector (1 downto 0);
  signal a3_internal : std_logic;
begin
  u2 : third
    port map(r8, r9, r10, r11, r12, r13, r14, r15, EI, a0_buf(0), a1_buf(0), a2_buf(0), G_buf(0), a3_internal);
  u1 : third
    port map(r0, r1, r2, r3, r4, r5, r6, r7, a3_internal, a0_buf(1), a1_buf(1), a2_buf(1), G_buf(1));
  a0 <= a0_buf(0) or a0_buf(1);
  a1 <= a1_buf(0) or a1_buf(1);
  a2 <= a2_buf(0) or a2_buf(1);
  G <= G_buf(0) or G_buf(1);

  process (a3_internal)
  begin
    a3 <= not a3_internal;
  end process;
end behav;
configuration con of fourth is
  for behav
    for u1, u2 : third
      use entity work.third(behaviour);
    end for;
  end for;
end con;
