library ieee;
use ieee.std_logic_1164.all;

entity mux41_vhdl is
port(
    x: in std_logic_vector(3 downto 0);
    a: in std_logic_vector(1 downto 0);
    e: in std_logic;
    f: out std_logic
);
end mux41_vhdl;

architecture beh of mux41_vhdl is
begin
    process(a, e)
    begin
        if e = '0' then
            f <= '0';
        else
            case a is
                when "00" => f <= x(0);
                when "01" => f <= x(1);
                when "10" => f <= x(2);
                when "11" => f <= x(3);
                when others => f <= '0';
            end case;
        end if;
    end process;
end beh;
