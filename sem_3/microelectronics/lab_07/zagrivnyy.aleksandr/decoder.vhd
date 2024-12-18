library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port (
        en  : in  STD_LOGIC;
        a   : in  STD_LOGIC_VECTOR (2 downto 0);
        y   : out STD_LOGIC_VECTOR (7 downto 0)
    );
end decoder;

architecture behav of decoder is
begin
    process(en, a)
    begin
        if (en = '1') then
            case a is
                when "000" => y <= "00000001";
                when "001" => y <= "00000010";
                when "010" => y <= "00000100";
                when "011" => y <= "00001000";
                when "100" => y <= "00010000";
                when "101" => y <= "00100000";
                when "110" => y <= "01000000";
                when "111" => y <= "10000000";
                when others => y <= "00000000";
            end case;
        else
            y <= "00000000";
        end if;
    end process;
end behav;
