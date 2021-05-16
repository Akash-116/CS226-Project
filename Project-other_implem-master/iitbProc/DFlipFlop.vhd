library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity DFlipFlop is 
port(
	inp: in std_logic;
	write_signal : in std_logic;
	clk : in std_logic;
	rst : in std_logic;
	outp: out std_logic
);
end entity;


architecture behav of DFlipFlop is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(rst ='1') then
				outp<= '0';
			else
				if(write_signal = '1') then 
					outp <= inp;
				end if;
			end if;
		end if;
	end process;
end architecture;