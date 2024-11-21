library IEEE;
use IEEE.std_logic_1164.ALL;

entity lab7_7 is
            port (  
				r : in std_logic_vector(7 downto 0);
				en: in std_logic;
                e0: out std_logic;
				f : out std_logic_vector(7 downto 0);
				a : inout std_logic_vector(2 downto 0);
				g : inout std_logic
				);
end lab7_7;

architecture behav of lab7_7 is

component encoder is
	port (  
			EI 	: in std_logic;
			r 	: in std_logic_vector(7 downto 0);
			a 	: out std_logic_vector(2 downto 0);
			g 	: out std_logic;
			EO	: out std_logic
		);
end component;

component decoder is
	port ( 
			a : in std_logic_vector (2 downto 0);
			en : in std_logic;
            y : out std_logic_vector (7 downto 0)
		);
end component;
begin
   c: encoder
	port map(en, r, a, g, e0);
   d: decoder
	port map(a, g, f);
end behav;

configuration con of lab7_7 is
	for behav
		for c: encoder
		use entity work.lab7_7_encoder(behav);
		end for;

		for d: decoder
		use entity work.lab7_7_decoder(behav);
		end for;
	end for;
end con;