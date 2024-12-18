library IEEE;
use IEEE.std_logic_1164.all;
entity dff_async is
172
port (data, clk, reset, preset : in std_logic;
 q : out std_logic);
end dff_async;
architecture behav of dff_async is
begin
process (clk, reset, preset) begin
 if (reset = '0') then
 q <= '0';
 elsif (preset = '0') then
 q <= '1';
 elsif (clk'event and clk = '1') then
 q <= data;
 end if;
end process;
end behav;
