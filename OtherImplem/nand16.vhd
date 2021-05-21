library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity nand16 is
port(
	inp1: in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end entity;

architecture behav of nand16 is
begin

	outp(0) <= inp1(0) nand inp2(0);
	outp(1) <= inp1(1) nand inp2(1);
	outp(2) <= inp1(2) nand inp2(2);
	outp(3) <= inp1(3) nand inp2(3);
	outp(4) <= inp1(4) nand inp2(4);
	outp(5) <= inp1(5) nand inp2(5);
	outp(6) <= inp1(6) nand inp2(6);
	outp(7) <= inp1(7) nand inp2(7);
	outp(8) <= inp1(8) nand inp2(8);
	outp(9) <= inp1(9) nand inp2(9);
	outp(10) <= inp1(10) nand inp2(10);
	outp(11) <= inp1(11) nand inp2(11);
	outp(12) <= inp1(12) nand inp2(12);
	outp(13) <= inp1(13) nand inp2(13);
	outp(14) <= inp1(14) nand inp2(14);
	outp(15) <= inp1(15) nand inp2(15);

end architecture;