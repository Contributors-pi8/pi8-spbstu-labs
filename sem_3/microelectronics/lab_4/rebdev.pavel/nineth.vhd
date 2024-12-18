LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nineth IS
  PORT
  (
    X0 : IN std_logic;
    X1 : IN std_logic;
    X2 : IN std_logic;
    X3 : IN std_logic;
    Q0 : OUT std_logic;
    Q1 : OUT std_logic;
    Q2 : OUT std_logic;
    Q3 : OUT std_logic;
    WRITE : IN std_logic;
    RESET : IN std_logic;
    READ : IN std_logic
  );
END nineth;

ARCHITECTURE behav OF nineth IS
  SIGNAL p0, p1, p2, p3 : std_logic;
  BEGIN
    PROCESS (WRITE, RESET, X0, X1, X2, X3)
    BEGIN
      IF (RESET = '0') THEN
        p0 <= '0';
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
      ELSIF RISING_EDGE(WRITE) THEN
        p0 <= X0;
        p1 <= X1;
        p2 <= X2;
        p3 <= X3;
      END IF;
    END PROCESS;
    PROCESS (READ, p0, p1, p2, p3)
    BEGIN
        Q0 <= (p0 AND READ);
        Q1 <= (p1 AND READ);
        Q2 <= (p2 AND READ);
        Q3 <= (p3 AND READ);
    END PROCESS;
  END behav;
