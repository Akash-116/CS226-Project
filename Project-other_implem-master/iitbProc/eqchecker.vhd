library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity eqchecker is
port(
	inp1: in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	outp: out std_logic
);

end entity;

architecture behav of eqchecker is
signal temp: std_logic_vector(15 downto 0);


component zero_check
port(
	inp:in std_logic_vector(15 downto 0);
	outp: out std_logic
);
end component;


begin
	temp(0) <= inp1(0) xor inp2(0);
	temp(1) <= inp1(1) xor inp2(1);
	temp(2) <= inp1(2) xor inp2(2);
	temp(3) <= inp1(3) xor inp2(3);
	temp(4) <= inp1(4) xor inp2(4);
	temp(5) <= inp1(5) xor inp2(5);
	temp(6) <= inp1(6) xor inp2(6);
	temp(7) <= inp1(7) xor inp2(7);
	temp(8) <= inp1(8) xor inp2(8);
	temp(9) <= inp1(9) xor inp2(9);
	temp(10) <= inp1(10) xor inp2(10);
	temp(11) <= inp1(11) xor inp2(11);
	temp(12) <= inp1(12) xor inp2(12);
	temp(13) <= inp1(13) xor inp2(13);
	temp(14) <= inp1(14) xor inp2(14);
	temp(15) <= inp1(15) xor inp2(15);
	check: zero_check port map(temp,outp);
end architecture;