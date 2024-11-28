library ieee;
use ieee.std_logic_1164.all;

entity point5 is
port(
    x, y: in std_logic_vector(3 downto 0);
    xmy0, xey0, xly0: in std_logic;
    xmy, xey, xly: out std_logic
);
end point5;

architecture behav of point5 is
    component point4
    port(
        x, y: in std_logic_vector(1 downto 0);
        xmy0, xey0, xly0: in std_logic;
        xmy, xey, xly: out std_logic
    );
    end component;

    signal xmy1, xey1, xly1: std_logic;
begin
    u0: point4
        port map (x(1 downto 0), y(1 downto 0), xmy0, xey0, xly0, xmy1, xey1, xly1);

    u1: point4
        port map (x(3 downto 2), y(3 downto 2), xmy1, xey1, xly1, xmy, xey, xly);
end behav;

configuration config of point5 is
    for behav
        for u0, u1: point4
            use entity work.point4(behav);
        end for;
    end for;
end config;
