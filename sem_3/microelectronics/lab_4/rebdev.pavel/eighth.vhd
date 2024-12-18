LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eighth IS
  PORT
  (
    D : IN std_logic;
    C1 : IN std_logic;
    C2 : IN std_logic;
    R : IN std_logic;
    Q0 : INOUT std_logic;
    Q1 : OUT std_logic
  );
END eighth;

ARCHITECTURE behav OF eighth IS
  SIGNAL p0, p1 : std_logic;
  BEGIN
    PROCESS (D, C1, R)
    BEGIN
      IF R = '0' THEN
        Q0 <= '0';
        Q1 <= '0';
      ELSIF RISING_EDGE(C1) THEN
        p0 <= D;
      END IF;
    END PROCESS;
    PROCESS (p0, C2)
    BEGIN
      IF RISING_EDGE(C2) THEN
        Q0 <= p0;
      END IF;
    END PROCESS;
    PROCESS (Q0, C1)
    BEGIN
      IF RISING_EDGE(C1) THEN
        p1 <= Q0;
      END IF;
    END PROCESS;
    PROCESS (p1, C2)
    BEGIN
      IF RISING_EDGE(C2) THEN
        Q1 <= p1;
      END IF;
    END PROCESS;
  END behav;
