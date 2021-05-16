library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;


--control  = 1 means go add 
--control = 0 means NAND
entity alu is
port(
	inp1: in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	control : in std_logic;
	outp: out std_logic_vector(15 downto 0);
	cout: out std_logic;
	zout : out std_logic
);

end entity;

architecture behav of alu is

component adder16 
port(
	inp1:in std_logic_vector(15 downto 0);
	inp2:in std_logic_vector(15 downto 0);
	outp:out std_logic_vector(15 downto 0);
	cout:out std_logic
);
end component;

component nand16
port(
	inp1: in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end component;

component zero_check
port(
	inp:in std_logic_vector(15 downto 0);
	outp: out std_logic
);

end component;

component twobyone_data_mux
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(15 downto 0)
);
end component;

signal temp0: std_logic_vector(15 downto 0); --for nand result --should be outputted when control is 0
signal temp1: std_logic_vector(15 downto 0); --for adder result --should be outputted when control is 1
signal temp2 : std_logic_vector(15 downto 0); -- temporary storage for the net outoput.This is just used for zero checking

begin
	adder : adder16 port map(inp1,inp2,temp1,cout);
	nand16gate: nand16 port map(inp1,inp2,temp0);
	mux : twobyone_data_mux port map(temp0,temp1,control,temp2);
	zcheck : zero_check port map(temp2,zout);
	outp<= temp2;
end architecture;