library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity halfadd is
port(
	inp1:in std_logic;
	inp2: in std_logic;
	out1: out std_logic;
	cout:out std_logic
);
end entity;

architecture behav of halfadd is
begin
	out1 <= inp1 xor inp2;
	cout <= inp1 and inp2;
end architecture;