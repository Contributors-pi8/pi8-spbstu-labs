library ieee;
use ieee.std_logic_1164.all;

entity mux81_vhdl is
port(
    x: in std_logic_vector(7 downto 0);
    a: in std_logic_vector(2 downto 0);
    e: in std_logic;
    f: out std_logic
);
end mux81_vhdl;

architecture beh of mux81_vhdl is
    component mux41_vhdl
    port(
        x: in std_logic_vector(3 downto 0);
        a: in std_logic_vector(1 downto 0);
        e: in std_logic;
        f: out std_logic
    );
    end component;

    signal muxes: std_logic_vector(3 downto 0) := "0000";
    signal aces: std_logic_vector(1 downto 0) := "00";
begin
    u0: mux41_vhdl
        port map (x(3 downto 0), a(1 downto 0), e, muxes(0));

    u1: mux41_vhdl
        port map (x(7 downto 4), a(1 downto 0), e, muxes(1));

    aces <= "0" & a(2);
    muxes(3 downto 2) <= "00";

    u2: mux41_vhdl
        port map (muxes, aces, e, f);
end beh;

configuration config of mux81_vhdl is
    for beh
        for u0, u1, u2: mux41_vhdl
            use entity work.mux41_vhdl(beh);
        end for;
    end for;
end config;
