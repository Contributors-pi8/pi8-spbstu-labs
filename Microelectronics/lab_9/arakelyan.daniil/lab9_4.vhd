library ieee;
use ieee.std_logic_1164.all;

entity lab9_4 is

port(
	x : in std_logic_vector(1 downto 0);
	y : in std_logic_vector(1 downto 0);
	xmy0, xly0, xey0 : in std_logic;
	xmy, xly, xey : out std_logic
);

end lab9_4;


architecture behav of lab9_4 is
begin
	process(x,y,xly0,xmy0,xey0)
	begin
		if (x > y) then
			xmy <= '1';
			xly <= '0';
			xey <= '0';
		elsif (x < y) then
			xly <= '1';
			xmy <= '0';
			xey <= '0';
		else
			xly <= xly0;
			xmy <= xmy0;
			xey <= xey0;
		end if;
	end process;
end behav;
