library ieee;
use ieee.std_logic_1164.all;

entity lab8_7 is
port(
  x : in std_logic_vector(1 downto 0);
  f : out std_logic_vector(3 downto 0);
  e : in std_logic
);
end lab8_7;

architecture behav of lab8_7 is
begin
process(x,e)
  begin
	if (e = '0') then
		f <= "0000";
	elsif (e = '1' ) then
		case x is
			when "00" => f <= "0001";
			when "10" => f <= "0010";
			when "01" => f <= "0100";
			when "11" => f <= "1000";
			when others => f <= "0000";
		end case;
	end if;
end process;
end behav;
