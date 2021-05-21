library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;


entity demux16 is
port(
	sel: in std_logic_vector(3 downto 0);
	write_signal: in std_logic;
	outp: out std_logic_vector(15 downto 0)
);
end entity;


architecture behav of demux16 is

component demux2 
port(
	sel: in std_logic;
	write_signal: in std_logic;
	outp: out std_logic_vector(1 downto 0)
);
end component;

component demux8
port(
	sel: in std_logic_vector(2 downto 0);
	write_signal: in std_logic;
	outp: out std_logic_vector(7 downto 0)
);
end component;

signal temp:std_logic_vector(1 downto 0);
begin
	mux0: demux2 port map(sel(3),write_signal,temp);
	mux1: demux8 port map(sel(2 downto 0),temp(1),outp(15 downto 8));
	mux2: demux8 port map(sel(2 downto 0),temp(0),outp(7 downto 0));
end architecture;