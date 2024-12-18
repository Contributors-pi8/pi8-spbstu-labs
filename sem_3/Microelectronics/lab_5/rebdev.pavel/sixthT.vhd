library ieee;
use ieee.std_logic_1164.all;

entity sixtht is
    port (
        clk : in std_logic;
        t   : in std_logic;
        q   : inout std_logic;
        q_n : inout std_logic
    );
end sixtht;

architecture behav of sixtht is
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if (t = '1') then
				q_n <= q;
                q <= not q;
            end if;
        end if;
    end process;
end behav;
