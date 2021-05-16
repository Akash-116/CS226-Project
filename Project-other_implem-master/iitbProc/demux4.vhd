library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;


entity demux4 is
port(
	sel: in std_logic_vector(1 downto 0);
	write_signal: in std_logic;
	outp: out std_logic_vector(3 downto 0)
);
end entity;


architecture behav of demux4 is
component demux2 
port(
	sel: in std_logic;
	write_signal: in std_logic;
	outp: out std_logic_vector(1 downto 0)
);
end component;

signal temp:std_logic_vector(1 downto 0);
begin
	mux0: demux2 port map(sel(1),write_signal,temp);
	mux1: demux2 port map(sel(0),temp(1),outp(3 downto 2));
	mux2: demux2 port map(sel(0),temp(0),outp(1 downto 0));
end architecture;