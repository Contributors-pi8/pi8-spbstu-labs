library ieee;
use ieee.std_logic_1164.all;

entity lab8_2 is
port(
  enable : in std_logic;
  x0 : in std_logic;
  x1 : in std_logic;
  x2 : in std_logic;
  x3 : in std_logic;
  a : in std_logic_vector(1 downto 0);
  q : out std_logic
);
end lab8_2;

architecture behav of lab8_2 is
begin
  process(x0, x1, x2, x3, a, enable)
  begin
	if enable = '1' then
    	case a is
			when "00" => q <= x0;
			when "10" => q <= x1;
			when "01" => q <= x2;
			when "11" => q <= x3;
			when others => q <= '0';
		end case;
	else q <= '0';
	end if;
  end process;
end behav;

