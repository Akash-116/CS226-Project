library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity reg is 
port(
	inp: in std_logic_vector(15 downto 0);
	write_signal : in std_logic;
	clk : in std_logic;
	rst : in std_logic;
	outp: out std_logic_vector(15 downto 0)
);
end entity;


architecture behav of reg is

	component DFlipFlop  
	port(
		inp: in std_logic;
		write_signal : in std_logic;
		clk : in std_logic;
		rst : in std_logic;
		outp: out std_logic
	);
	end component;

begin
	
	store0 : DFlipFlop port map(inp(0),write_signal,clk,rst,outp(0));
	store1 : DFlipFlop port map(inp(1),write_signal,clk,rst,outp(1));
	store2 : DFlipFlop port map(inp(2),write_signal,clk,rst,outp(2));
	store3 : DFlipFlop port map(inp(3),write_signal,clk,rst,outp(3));
	store4 : DFlipFlop port map(inp(4),write_signal,clk,rst,outp(4));
	store5 : DFlipFlop port map(inp(5),write_signal,clk,rst,outp(5));
	store6 : DFlipFlop port map(inp(6),write_signal,clk,rst,outp(6));
	store7 : DFlipFlop port map(inp(7),write_signal,clk,rst,outp(7));
	store8 : DFlipFlop port map(inp(8),write_signal,clk,rst,outp(8));
	store9 : DFlipFlop port map(inp(9),write_signal,clk,rst,outp(9));
	store10 : DFlipFlop port map(inp(10),write_signal,clk,rst,outp(10));
	store11 : DFlipFlop port map(inp(11),write_signal,clk,rst,outp(11));
	store12 : DFlipFlop port map(inp(12),write_signal,clk,rst,outp(12));
	store13 : DFlipFlop port map(inp(13),write_signal,clk,rst,outp(13));
	store14 : DFlipFlop port map(inp(14),write_signal,clk,rst,outp(14));
	store15 : DFlipFlop port map(inp(15),write_signal,clk,rst,outp(15));
	
end architecture;