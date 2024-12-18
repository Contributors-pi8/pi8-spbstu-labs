library ieee;
use ieee.std_logic_1164.all;

entity mux641_vhdl is
port(
    x: in std_logic_vector(63 downto 0);
    a: in std_logic_vector(5 downto 0);
    e: in std_logic;
    f: out std_logic
);
end mux641_vhdl;

architecture beh of mux641_vhdl is
    component mux81_vhdl
    port(
        x: in std_logic_vector(7 downto 0);
        a: in std_logic_vector(2 downto 0);
        e: in std_logic;
        f: out std_logic
    );
    end component;

    signal muxes: std_logic_vector(7 downto 0);
begin
    u0: mux81_vhdl
        port map (x(7 downto 0), a(2 downto 0), e, muxes(0));

    u1: mux81_vhdl
        port map (x(15 downto 8), a(2 downto 0), e, muxes(1));

    u2: mux81_vhdl
        port map (x(23 downto 16), a(2 downto 0), e, muxes(2));

    u3: mux81_vhdl
        port map (x(31 downto 24), a(2 downto 0), e, muxes(3));

    u4: mux81_vhdl
        port map (x(39 downto 32), a(2 downto 0), e, muxes(4));

    u5: mux81_vhdl
        port map (x(47 downto 40), a(2 downto 0), e, muxes(5));

    u6: mux81_vhdl
        port map (x(55 downto 48), a(2 downto 0), e, muxes(6));

    u7: mux81_vhdl
        port map (x(63 downto 56), a(2 downto 0), e, muxes(7));

    u: mux81_vhdl
        port map (muxes, a(5 downto 3), e, f);
end beh;
