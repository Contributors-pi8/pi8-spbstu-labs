LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY point6_t IS
PORT(T: IN std_logic;
     Q: OUT std_logic;
     Qi: OUT std_logic);
END point6_t;

ARCHITECTURE behav OF point6_t IS
    signal state: std_logic := '0';
BEGIN
    PROCESS(T)
    BEGIN
        IF (T'event AND T = '1') THEN
            state <= NOT state;
        END IF;
    END PROCESS;

    Q <= state;
    Qi <= NOT state;
END behav;
