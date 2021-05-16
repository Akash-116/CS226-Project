library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity adder16 is
port(
	inp1:in std_logic_vector(15 downto 0);
	inp2:in std_logic_vector(15 downto 0);
	outp:out std_logic_vector(15 downto 0);
	cout:out std_logic
);
end entity;


architecture behav of adder16 is 
signal carr0: std_logic;
signal carr1: std_logic;
signal carr2: std_logic;
signal carr3: std_logic;
signal carr4: std_logic;
signal carr5: std_logic;
signal carr6: std_logic;
signal carr7: std_logic;
signal carr8: std_logic;
signal carr9: std_logic;
signal carr10: std_logic;
signal carr11: std_logic;
signal carr12: std_logic;
signal carr13: std_logic;
signal carr14: std_logic;

component fulladd
port(
	inp1:in std_logic;
	inp2: in std_logic;
	cin: in std_logic;
	out1: out std_logic;
	cout:out std_logic
);
end component;

begin
	add0 : fulladd port map(inp1(0),inp2(0),'0',outp(0),carr0);
	add1 : fulladd port map(inp1(1),inp2(1),carr0,outp(1),carr1);
	add2 : fulladd port map(inp1(2),inp2(2),carr1,outp(2),carr2);
	add3 : fulladd port map(inp1(3),inp2(3),carr2,outp(3),carr3);
	add4 : fulladd port map(inp1(4),inp2(4),carr3,outp(4),carr4);
	add5 : fulladd port map(inp1(5),inp2(5),carr4,outp(5),carr5);
	add6 : fulladd port map(inp1(6),inp2(6),carr5,outp(6),carr6);
	add7 : fulladd port map(inp1(7),inp2(7),carr6,outp(7),carr7);
	add8 : fulladd port map(inp1(8),inp2(8),carr7,outp(8),carr8);
	add9 : fulladd port map(inp1(9),inp2(9),carr8,outp(9),carr9);
	add10 : fulladd port map(inp1(10),inp2(10),carr9,outp(10),carr10);
	add11 : fulladd port map(inp1(11),inp2(11),carr10,outp(11),carr11);
	add12 : fulladd port map(inp1(12),inp2(12),carr11,outp(12),carr12);
	add13 : fulladd port map(inp1(13),inp2(13),carr12,outp(13),carr13);
	add14 : fulladd port map(inp1(14),inp2(14),carr13,outp(14),carr14);
	add15 : fulladd port map(inp1(15),inp2(15),carr14,outp(15),cout);
end architecture;


