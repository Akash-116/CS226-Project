library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
port(
	inp1:in std_logic;
	inp2: in std_logic;
	cin: in std_logic;
	out1: out std_logic;
	cout:out std_logic
);
end entity;

architecture behav of fulladd is

signal temp : std_logic;
signal temp2 : std_logic;
signal temp3 : std_logic;
begin
	temp <= inp1 xor inp2;
	out1 <= temp xor cin;
	temp2 <= inp1 and inp2;
	temp3 <= temp and cin;
	cout <= temp2 or temp3;
end architecture;