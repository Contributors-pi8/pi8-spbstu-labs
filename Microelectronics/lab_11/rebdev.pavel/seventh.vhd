library ieee;
use ieee.std_logic_1164.all;

entity seventh is
  port
  (
    DIN : in std_logic_vector(3 downto 0);

    DOUT : out std_logic_vector(3 downto 0);
    ONE_ERR : out std_logic;
    DBL_ERR : out std_logic
  );
end seventh;

architecture behav of seventh is
  component sixthCODER
  port
  (
    D : in std_logic_vector (3 downto 0);

    output : out std_logic_vector (7 downto 0)
  );
  end component;
  component sixthdataPest
  port
  (
    input : in std_logic_vector (7 downto 0);
    output : out std_logic_vector (7 downto 0)
  );
  end component;
  component sixthDECODER
  port
  (
    input : in std_logic_vector (7 downto 0);

    D : out std_logic_vector (3 downto 0);
    ONE_ERR : out std_logic;
    DBL_ERR : out std_logic
  );
  end component;

  signal coderOut : std_logic_vector(7 downto 0);
  signal decoderInput : std_logic_vector(7 downto 0);
begin
  coder : sixthCODER
    port map(DIN, coderOut);
  dataPest: sixthdataPest
    port map(coderOut, decoderInput);
  decoder : sixthDECODER
    port map(decoderInput, DOUT, ONE_ERR, DBL_ERR);
end behav;
configuration con of seventh is
  for behav
    for coder : sixthCODER
      use entity work.sixthCODER(behav);
    end for;
    for dataPest: sixthdataPest
      use entity work.sixthdataPest(behav);
    end for;
    for decoder : sixthDECODER
      use entity work.sixthDECODER(behav);
    end for;
  end for;
end con;
