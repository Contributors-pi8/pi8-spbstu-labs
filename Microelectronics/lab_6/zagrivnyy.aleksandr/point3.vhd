library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity point3 is
    Port (
        en  : in  STD_LOGIC;
        a   : in  STD_LOGIC_VECTOR (2 downto 0);
        y   : out STD_LOGIC_VECTOR (7 downto 0)
    );
end point3;

architecture behav of point3 is
begin
    process(en, a)
    begin
        if (en = '1') then
            case a is
                when "000" => y <= "01111111";
                when "001" => y <= "10111111";
                when "010" => y <= "11011111";
                when "011" => y <= "11101111";
                when "100" => y <= "11110111";
                when "101" => y <= "11111011";
                when "110" => y <= "11111101";
                when "111" => y <= "11111110";
                when others => y <= "11111111";
            end case;
        else
            y <= "11111111";
        end if;
    end process;
end behav;
