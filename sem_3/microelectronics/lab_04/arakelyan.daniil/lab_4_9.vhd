library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab_4_9 is
	Port (
		x1: IN std_logic;
		x2: IN std_logic;
		x3: IN std_logic;
		x4: IN std_logic;
		write: IN std_logic;
		reset: IN std_logic;
		read: IN std_logic;
		q : out std_logic_vector(3 downto 0)
		);
end lab_4_9;

architecture behav of lab_4_9 is
	signal vec : std_logic_vector(3 downto 0) := "0000";
begin
	process(write, reset)
	begin
		if reset = '0' then
			vec <= "0000";
		elsif (write'event and write = '1') then
			vec <= x1 & x2 & x3 & x4;
		end if;
	end process;
	process(read, reset)
	begin
		if (read = '1') then
			q <= vec;
		else
			q <= "0000";
		end if;
	end process;
end behav;
