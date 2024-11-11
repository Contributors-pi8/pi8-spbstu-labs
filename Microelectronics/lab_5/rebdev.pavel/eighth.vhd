library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity eighth is
    port
	(
        clk : in std_logic;
        rst : in std_logic;
        count : inout std_logic_vector (3 downto 0)
    );
end eighth;

architecture behav of eighth is
begin
    process (clk, rst, count)
    begin
        if (rst = '1') then
            count <= "0000";
        elsif rising_edge(clk) then
            if (count(0) = '1') then
				if (count(1) = '1') then
					if(count(2) = '1') then
						count(3) <= not count(3);
						count(2) <= '0';
						count(1) <= '0';
						count(0) <= '0';
					else
						count(2) <= '1';
						count(1) <= '0';
						count(0) <= '0';
					end if;
				else
					count(1) <= '1';
					count(0) <= '0';
				end if;
			else
				count(0) <= '1';
			end if;
        end if;
    end process;
end behav;
