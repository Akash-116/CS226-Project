library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

-- signextender6 entity this fills the left 15-6 bits with the 5th bit 
entity signextender6 is
port(
	inp: in std_logic_vector(5 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end entity;

architecture behav of signextender6 is
begin
	outp(5 downto 0) <= inp;
	outp(15) <= inp(5);
	outp(14) <= inp(5);
	outp(13) <= inp(5);
	outp(12) <= inp(5);
	outp(11) <= inp(5);
	outp(10) <= inp(5);
	outp(9) <= inp(5);
	outp(8) <= inp(5);
	outp(7) <= inp(5);
	outp(6) <= inp(5);
end architecture;