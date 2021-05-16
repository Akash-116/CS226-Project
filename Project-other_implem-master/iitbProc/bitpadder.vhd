library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

-- bitpadder9 entity this fills the right 6 bits with 0 and left 9 bits to input
 
entity bitpadder9 is
port(
	inp: in std_logic_vector(8 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end entity;

architecture behav of bitpadder9 is
begin
	outp(15 downto 7) <= inp;
	outp(6) <= '0';
	outp(5) <= '0';
	outp(4) <= '0';
	outp(3) <= '0';
	outp(2) <= '0';
	outp(1) <= '0';
	outp(0) <= '0';
end architecture;