library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity zero_check is 
port(
	inp:in std_logic_vector(15 downto 0);
	outp: out std_logic
);

end entity;


architecture behav of zero_check is


signal temp0 : std_logic;
signal temp1 : std_logic;
signal temp2 : std_logic;
signal temp3 : std_logic;
signal temp4 : std_logic;
signal temp5 : std_logic;
signal temp6 : std_logic;
signal temp7 : std_logic;
signal temp8 : std_logic;
signal temp9 : std_logic;
signal temp10 : std_logic;
signal temp11 : std_logic;
signal temp12 : std_logic;
signal temp13 : std_logic;
signal temp14 : std_logic;


begin
	temp0 <= inp(0) or inp(1);
	temp1 <= temp0 or inp(2);
	temp2 <= temp1 or inp(3);
	temp3 <= temp2 or inp(4);
	temp4 <= temp3 or inp(5);
	temp5 <= temp4 or inp(6);
	temp6 <= temp5 or inp(7);
	temp7 <= temp6 or inp(8);
	temp8 <= temp7 or inp(9);
	temp9 <= temp8 or inp(10);
	temp10 <= temp9 or inp(11);
	temp11 <= temp10 or inp(12);
	temp12 <= temp11 or inp(13);
	temp13 <= temp12 or inp(14);
	temp14 <= temp13 or inp(15);
	outp<= not temp14;

end architecture;
