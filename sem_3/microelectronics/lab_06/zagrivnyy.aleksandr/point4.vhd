library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity point4 is
    Port (
        en  : in  STD_LOGIC;
        a   : in  STD_LOGIC_VECTOR (5 downto 0);
        y   : out STD_LOGIC_VECTOR (63 downto 0)
    );
end point4;

architecture Behavioral of point4 is
    component point3
        Port (
            en  : in  STD_LOGIC;
            a   : in  STD_LOGIC_VECTOR (2 downto 0);
            y   : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    signal y_segments : STD_LOGIC_VECTOR(63 downto 0);
    signal enable_signals : STD_LOGIC_VECTOR(7 downto 0);

begin
    decoder_enable: point3
        Port map (
            en => en,
            a => a(5 downto 3),
            y => enable_signals
        );

    gen_decoders: for i in 0 to 7 generate
        decoder_inst: point3
            Port map (
                en => not enable_signals(i),
                a  => a(2 downto 0),
                y  => y_segments(i*8+7 downto i*8)
            );
    end generate;

    y <= y_segments;
end Behavioral;