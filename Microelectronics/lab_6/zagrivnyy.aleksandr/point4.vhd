library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity point4 is
    Port (
        en  : in  STD_LOGIC;
        a   : in  STD_LOGIC_VECTOR (3 downto 0);
        y   : out STD_LOGIC_VECTOR (15 downto 0)
    );
end point4;

architecture behav of point4 is
    component point3
        Port (
            en  : in  STD_LOGIC;
            a   : in  STD_LOGIC_VECTOR (2 downto 0);
            y   : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal y_lower : STD_LOGIC_VECTOR(7 downto 0);
    signal y_upper : STD_LOGIC_VECTOR(7 downto 0);
begin
    lower_decoder: point3
        Port map (
            en => en AND NOT a(3),
            a  => a(2 downto 0),
            y  => y_lower
        );

    upper_decoder: point3
        Port map (
            en => en AND a(3),
            a  => a(2 downto 0),
            y  => y_upper
        );

    y <= y_lower & y_upper;
end behav;