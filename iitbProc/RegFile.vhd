library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity RegFile is 
	port (	RF_A1, RF_A2, RF_A3: in std_logic_vector(2 downto 0); --3 bits used to address 8 values
			RF_D3: in std_logic_vector(15 downto 0); 
			wr, clk: in std_logic;
			RF_D1, RF_D2: out std_logic_vector(15 downto 0));
end entity;

architecture arc of RegFile is 
	-- our storage type in register file
	type regArray is array(7 downto 0) of std_logic_vector(15 downto 0);
	
	-- Instantiate a object of above type
	signal RegFile: regArray := (others => x"0000");

	begin
		RF_D1 <= RegFile(conv_integer(RF_A1)); -- This is asyncronous reading
		RF_D2 <= RegFile(conv_integer(RF_A2)); -- This is asyncronous reading

		process (wr, RF_D3, RF_A3, clk)
			begin
			if(wr = '1') then
				if(rising_edge(clk)) then
					RegFile(conv_integer(RF_A3)) <= RF_D3; --Syncronous write to the register storage
				end if;
			end if;
		end process;

end arc;