library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

-- Reading is avaliable all the time. No READ signal

entity Register_file is 
	port (	aout1, aout2, ain3: in std_logic_vector(2 downto 0); --3 bits used to address 8 values
			datain: in std_logic_vector(15 downto 0); 
			clk, wr_signal_bar: in std_logic; -- Here wr_bar is opposite of wr signal
			dataout1, dataout2: out std_logic_vector(15 downto 0));
end entity;

architecture arc of Register_file is 
	-- our storage type in register file
	type regArray is array(7 downto 0) of std_logic_vector(15 downto 0);
	
	-- Instantiate a object of above type
	signal RegFile: regArray := (0 => x"000", 1 => x"0000", 2 => x"0000", 3 => x"0000",
	4 => x"0000", 5 => x"0000", 6 => x"0000", 7 => x"0000");

	begin
	dataout1 <= RegFile(conv_integer(aout1)); -- This is asyncronous reading
	dataout2 <= RegFile(conv_integer(aout2)); -- This is asyncronous reading

	process (wr_signal_bar, datain, ain3, clk)
		begin
		if(wr_signal_bar = '0') then
			if(rising_edge(clk)) then
				RegFile(conv_integer(ain3)) <= datain; --Syncronous write to the register storage
			end if;
		end if;
	end process;

end arc;