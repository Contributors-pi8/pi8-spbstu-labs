LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity lab_4_7_1 is 
    port (
        clk : in std_logic;
        data : in std_logic;
        reset : in std_logic;
        q0 : out std_logic;
        q1 : out std_logic
    );
end lab_4_7_1 ;

architecture behavioral of lab_4_7_1 is
    signal q : std_logic_vector(1 downto 0);
	signal d0,d1,p,pp : std_logic;
begin
    process (clk, reset, pp)
    begin
        if reset = '0' then
			q0 <= '0';
			q1 <= '0';
		elsif falling_edge(clk) then
			if pp = '0' then
				q0 <= d0;
				pp <= '1';
			else
				q1 <= d1;
				pp <= '0';
			end if;
		end if;
    end process;
	process (clk,p)
	begin
        if rising_edge(clk) then 
			if p = '0' then
				d0 <= data;
				p <= '1';
			else
				d1 <= d0;
				p <= '0';
			end if;
        end if;
	end process;
end behavioral;

