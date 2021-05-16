library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity testbench is 
end entity;

architecture behav of testbench is
component IITBProc
port(
	clk:in std_logic;
	rst : in std_logic
);

end component;
signal clock,reset: std_logic;
begin

proc: IITBProc port map(clock,reset);

process

	begin
	clock<='1';
	reset<='1';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='1';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='1';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='0';
	reset<='0';
	wait for 2.5 sec;
	
	clock<='1';
	reset<='0';
	wait for 2.5 sec;


wait;
end process;
	




end architecture;