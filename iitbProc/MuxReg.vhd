library ieee;
use ieee.std_logic_1164.all;

package MuxReg is
    component Reg1 is 
			port (	Reg_datain: in std_logic; 
				clk, wr: in std_logic;
				Reg_dataout: out std_logic);
	end component;
	component Reg16 is 
			port (	Reg_datain: in std_logic_vector(15 downto 0); 
				clk, wr: in std_logic;
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

entity Reg1 is 
	port (	Reg_datain: in std_logic; 
			clk, wr: in std_logic;
			Reg_dataout: out std_logic);
end entity;

architecture Form of Reg1 is 
	signal R: std_logic := '0';

	begin
		Reg_dataout <= R;
		Reg_write:
		process (wr,Reg_datain,clk)
		begin
			if(wr = '1') then
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

entity Reg16 is 
	port (	Reg_datain: in std_logic_vector(15 downto 0); 
			clk, wr: in std_logic;
			Reg_dataout: out std_logic_vector(15 downto 0));
end entity;

architecture Form of Reg16 is 
	signal R: std_logic_vector(15 downto 0) := (others => '0');

	begin
		Reg_dataout <= R;
		Reg_write:
		process (wr,Reg_datain,clk)
		begin
			if(wr = '1') then
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

entity Mux3_2_1 is
port( A, B : in std_logic_vector(2 downto 0);
		S0 : in std_logic;
		y : out std_logic_vector(2 downto 0) );
end Mux3_2_1;


architecture arc of Mux3_2_1 is
	component Mux1_2_1 is 
		port( A, B, S0 : in std_logic;
				y : out std_logic );
	end component;

	begin 
		muxg: for i in 2 downto 0 generate
			mx: Mux1_2_1 port map(A => A(i),B => B(i), S0 => S0, y => y(i));
		end generate muxg;
end arc;

---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Mux3_4_1 is
port( A, B, C, D : in std_logic_vector(2 downto 0);
		S1, S0 : in std_logic;
		y : out std_logic_vector(2 downto 0) );
end Mux3_4_1;


architecture arc of Mux3_4_1 is
	component Mux1_4_1 is 
		port( A, B, C, D, S1, S0 : in std_logic;
				y : out std_logic );
	end component;
	begin 
		muxg: for i in 2 downto 0 generate
			mx: Mux1_4_1 port map(A => A(i), B => B(i), C => C(i), D=> D(i), S0 => S0, S1 => S1, y => y(i));
		end generate muxg;
end arc;


---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Mux16_2_1 is
port( A, B : in std_logic_vector(15 downto 0);
		S0 : in std_logic;
		y : out std_logic_vector(15 downto 0) );
end Mux16_2_1;

architecture arc of Mux16_2_1 is
	component Mux1_2_1 is 
		port( A, B, S0 : in std_logic;
				y : out std_logic );
	end component;

	begin 
		muxg: for i in 15 downto 0 generate
			mx: Mux1_2_1 port map(A => A(i),B => B(i), S0 => S0, y => y(i));
		end generate muxg;
end arc;

-- ======================================================================

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Mux16_4_1 is
	port( A, B, C, D : in std_logic_vector(15 downto 0);
			S1, S0 : in std_logic;
			y : out std_logic_vector(15 downto 0) );
end Mux16_4_1;

architecture arc of Mux16_4_1 is
	component Mux1_4_1 is 
		port( A, B, C, D, S1, S0 : in std_logic;
				y : out std_logic );
	end component;

	begin 
		muxg4: for i in 15 downto 0 generate
			mx: Mux1_4_1 port map(A => A(i),B => B(i),C => C(i),D => D(i),S0 => S0,S1 => S1,y => y(i));
		end generate muxg4;
end arc;






