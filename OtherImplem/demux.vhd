library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;


entity demux is
port(
	sel: in std_logic_vector(2 downto 0);
	write_signal: in std_logic;
	outp: out std_logic_vector(7 downto 0)
);
end entity;


architecture behav of demux is
	signal notsel: std_logic_vector(2 downto 0);

begin
	notsel(0)<=not sel(0);
	notsel(1)<=not sel(1);
	notsel(2)<=not sel(2);
	
	outp(0)<= write_signal and notsel(0) and notsel(1) and notsel(2);
	outp(1)<= write_signal and sel(0) and notsel(1) and notsel(2);
	outp(2)<= write_signal and notsel(0) and sel(1) and notsel(2);
	outp(3)<= write_signal and sel(0) and sel(1) and notsel(2);
	outp(4)<= write_signal and notsel(0) and notsel(1) and sel(2);
	outp(5)<= write_signal and sel(0) and notsel(1) and sel(2);
	outp(6)<= write_signal and notsel(0) and sel(1) and sel(2);
	outp(7)<= write_signal and sel(0) and sel(1) and sel(2);

end architecture;