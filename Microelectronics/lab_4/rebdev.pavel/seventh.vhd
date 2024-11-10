LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY seventh IS
  PORT
  (
    D : IN std_logic;
    C : IN std_logic;
    R : IN std_logic;
    Q0 : INOUT std_logic;
    Q1 : OUT std_logic
  );
END seventh;

ARCHITECTURE behav OF seventh IS
  SIGNAL p0, p1, p2 : std_logic;
  BEGIN
    PROCESS (D, C, R)
    BEGIN
      IF R = '0' THEN
        Q0 <= '0';
        Q1 <= '0';
      ELSIF FALLING_EDGE(C) THEN
        p0 <= D;
      END IF;
    END PROCESS;
    PROCESS (p0, C)
    BEGIN
      IF RISING_EDGE(C) THEN
        p1 <= p0;
      END IF;
    END PROCESS;
    PROCESS (p1, C)
    BEGIN
      IF FALLING_EDGE(C) THEN
        p2 <= p1;
      END IF;
    END PROCESS;
    PROCESS (p2, C)
    BEGIN
      IF RISING_EDGE(C) THEN
        Q0 <= p2;
      END IF;
    END PROCESS;
    PROCESS (Q0, C)
    BEGIN
      IF FALLING_EDGE(C) THEN
        Q1 <= Q0;
      END IF;
    END PROCESS;
  END behav;
