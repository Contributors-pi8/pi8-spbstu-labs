LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sixthJK IS
  PORT
  (
    J : IN std_logic;
    K : IN std_logic;
    CLK : IN std_logic;
    Q : INOUT std_logic;
    QN : INOUT std_logic
  );
END sixthJK;

ARCHITECTURE behav OF sixthJK IS
  BEGIN
    PROCESS(CLK)
    BEGIN
      IF RISING_EDGE(CLK) THEN
        IF ((J = '1') AND (K = '0')) THEN
          Q <= '1';
          QN <= '0';
        ELSIF ((J = '0') AND (K = '1')) THEN
          Q <= '0';
          QN <= '1';
        ELSIF ((J = '1') AND (K = '1')) THEN
          Q <= NOT Q;
          QN <= NOT QN;
        END IF;
      END IF;
    END PROCESS;
  END behav;
