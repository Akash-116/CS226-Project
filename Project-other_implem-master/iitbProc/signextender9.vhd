library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

-- signextender9 entity this fills the left 15-9 bits with the 8th bit
 
entity signextender9 is
port(
	inp: in std_logic_vector(8 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end entity;

architecture behav of signextender9 is
begin
	outp(8 downto 0) <= inp;
	outp(15) <= inp(8);
	outp(14) <= inp(8);
	outp(13) <= inp(8);
	outp(12) <= inp(8);
	outp(11) <= inp(8);
	outp(10) <= inp(8);
	outp(9) <= inp(8);
end architecture;