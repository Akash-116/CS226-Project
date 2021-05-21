library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;


entity demux2 is
port(
	sel: in std_logic;
	write_signal: in std_logic;
	outp: out std_logic_vector(1 downto 0)
);
end entity;


architecture behav of demux2 is
	signal notsel : std_logic;

begin
	notsel <= not sel;
	outp(0) <= notsel and write_signal;
	outp(1) <= sel and write_signal;
end architecture;