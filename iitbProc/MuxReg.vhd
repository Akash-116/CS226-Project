library ieee;
use ieee.std_logic_1164.all;

package MuxReg is
    component Register1 is 
			port (	Reg_datain: in std_logic; 
				clk, Reg_wrbar: in std_logic;
				Reg_dataout: out std_logic);
	end component;
	component Register16 is 
			port (	Reg_datain: in std_logic_vector(15 downto 0); 
				clk, Reg_wrbar: in std_logic;
				Reg_dataout: out std_logic_vector(15 downto 0));
	end component;
	component Mux1_2_1 is 
			port( A, B, S0 : in std_logic;
					y : out std_logic );
	end component;
	component Mux1_4_1 is
		port( A, B, C, D, S1, S0 : in std_logic;
				y : out std_logic );
	end component;
	component Mux3_2_1 is 
			port( A, B : in std_logic_vector(2 downto 0);
					S0 : in std_logic;
					y : out std_logic_vector(2 downto 0) );
	end component;
	component Mux3_4_1 is 
			port( A, B, C, D : in std_logic_vector(2 downto 0);
					S1, S0 : in std_logic;
					y : out std_logic_vector(2 downto 0) );
	end component;
	component Mux16_2_1 is 
			port( A, B : in std_logic_vector(15 downto 0);
					S0 : in std_logic;
					y : out std_logic_vector(15 downto 0) );
	end component;
	component Mux16_4_1 is 
			port( A, B, C, D: in std_logic_vector(15 downto 0);
					S1, S0 : in std_logic;
					y : out std_logic_vector(15 downto 0) );
	end component;

	
end package MuxReg;
-- ================================================
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

-- since The Memory is asynchronous read, there is no read signal, but you can use it based on your preference.
-- this memory gives 16 Bit data in one clock cycle, so edit the file to your requirement.

entity Register1 is 
	port (	Reg_datain: in std_logic; 
			clk, Reg_wrbar: in std_logic;
			Reg_dataout: out std_logic);
end entity;

architecture Form of Register1 is 
--type regarray is array(7 downto 0) of std_logic_vector(15 downto 0);   -- defining a new type
--signal Register: regarray:=(1 => x"0000",2 => x"0000",3 => x"0000",4 => x"0000",5 => x"0000",6 => x"0000",7 => x"0000");
-- you can use the above mentioned way to initialise the memory with the instructions and the data as required to test your processor
signal R: std_logic := '0';

begin
Reg_dataout <= R;
Reg_write:
process (Reg_wrbar,Reg_datain,clk)
	begin
	if(Reg_wrbar = '0') then
		if(rising_edge(clk)) then
			R <= Reg_datain;
		end if;
	end if;
	end process;

end Form;
-- ================================================

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

-- since The Memory is asynchronous read, there is no read signal, but you can use it based on your preference.
-- this memory gives 16 Bit data in one clock cycle, so edit the file to your requirement.

entity Register16 is 
	port (	Reg_datain: in std_logic_vector(15 downto 0); 
			clk, Reg_wrbar: in std_logic;
			Reg_dataout: out std_logic_vector(15 downto 0));
end entity;

architecture Form of Register16 is 
--type regarray is array(7 downto 0) of std_logic_vector(15 downto 0);   -- defining a new type
--signal Register: regarray:=(1 => x"0000",2 => x"0000",3 => x"0000",4 => x"0000",5 => x"0000",6 => x"0000",7 => x"0000");
-- you can use the above mentioned way to initialise the memory with the instructions and the data as required to test your processor
signal R: std_logic_vector(15 downto 0) := (others => '0');

begin
Reg_dataout <= R;
Reg_write:
process (Reg_wrbar,Reg_datain,clk)
	begin
	if(Reg_wrbar = '0') then
		if(rising_edge(clk)) then
			R <= Reg_datain;
		end if;
	end if;
	end process;

end Form;

-- ================================================

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Mux1_2_1 is
port( A, B, S0 : in std_logic;
		y : out std_logic );
end Mux1_2_1;

architecture struct of Mux1_2_1 is
begin
	y <= (A and not S0) or (B and S0); 
end struct;
-- ================================================

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Mux1_4_1 is
port( A, B, C, D, S1, S0 : in std_logic;
		y : out std_logic );
end Mux1_4_1;

architecture struct of Mux1_4_1 is
begin
	y <= (A and (not S1) and (not S0))
			or (B and (not S1) and (S0))
			or (C and (S1) and (not S0))
			or (D and (S1) and (S0));
end struct;

-- ================================================
 
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
-- Begin entity
entity Mux3_2_1 is
port( A, B : in std_logic_vector(2 downto 0);
		S0 : in std_logic;
		y : out std_logic_vector(2 downto 0) );
end Mux3_2_1;


-- Begin architecture
architecture behave of Mux3_2_1 is
-- Define components
component Mux1_2_1 is 
	port( A, B, S0 : in std_logic;
			y : out std_logic );
end component;
begin 
	muxg: for i in 2 downto 0 generate
		mx: Mux1_2_1 port map(A => A(i),B => B(i), S0 => S0, y => y(i));
	end generate muxg;
end behave;

---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
-- Begin entity
entity Mux3_4_1 is
port( A, B, C, D : in std_logic_vector(2 downto 0);
		S1, S0 : in std_logic;
		y : out std_logic_vector(2 downto 0) );
end Mux3_4_1;


-- Begin architecture
architecture behave of Mux3_4_1 is
-- Define components
component Mux1_4_1 is 
	port( A, B, C, D, S1, S0 : in std_logic;
			y : out std_logic );
end component;
begin 
	muxg: for i in 2 downto 0 generate
		mx: Mux1_4_1 port map(A => A(i), B => B(i), C => C(i), D=> D(i), S0 => S0, S1 => S1, y => y(i));
	end generate muxg;
end behave;


---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
-- Begin entity
entity Mux16_2_1 is
port( A, B : in std_logic_vector(15 downto 0);
		S0 : in std_logic;
		y : out std_logic_vector(15 downto 0) );
end Mux16_2_1;


-- Begin architecture
architecture behave of Mux16_2_1 is
-- Define components
component Mux1_2_1 is 
	port( A, B, S0 : in std_logic;
			y : out std_logic );
end component;
begin 
	muxg: for i in 15 downto 0 generate
		mx: Mux1_2_1 port map(A => A(i),B => B(i), S0 => S0, y => y(i));
	end generate muxg;
end behave;

-- ======================================================================

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
-- Begin entity
entity Mux16_4_1 is
port( A, B, C, D : in std_logic_vector(15 downto 0);
		S1, S0 : in std_logic;
		y : out std_logic_vector(15 downto 0) );
end Mux16_4_1;


-- Begin architecture
architecture behave of Mux16_4_1 is
-- Define components
component Mux1_4_1 is 
	port( A, B, C, D, S1, S0 : in std_logic;
			y : out std_logic );
end component;
begin 
	muxg4: for i in 15 downto 0 generate
		mx: Mux1_4_1 port map(A => A(i),B => B(i),C => C(i),D => D(i),S0 => S0,S1 => S1,y => y(i));
	end generate muxg4;
end behave;






