library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity thirtytwobyone_data_mux is
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	inp3: in std_logic_vector(15 downto 0);
	inp4:in std_logic_vector(15 downto 0);
	inp5:in std_logic_vector(15 downto 0);
	inp6: in std_logic_vector(15 downto 0);
	inp7: in std_logic_vector(15 downto 0);
	inp8:in std_logic_vector(15 downto 0);
	inp9:in std_logic_vector(15 downto 0);
	inp10: in std_logic_vector(15 downto 0);
	inp11: in std_logic_vector(15 downto 0);
	inp12:in std_logic_vector(15 downto 0);
	inp13:in std_logic_vector(15 downto 0);
	inp14: in std_logic_vector(15 downto 0);
	inp15: in std_logic_vector(15 downto 0);
	inp16 : in std_logic_vector(15 downto 0);
	inp17 : in std_logic_vector(15 downto 0);
	inp18 : in std_logic_vector(15 downto 0);
	inp19 : in std_logic_vector(15 downto 0);
	inp20 : in std_logic_vector(15 downto 0);
	inp21 : in std_logic_vector(15 downto 0);
	inp22 : in std_logic_vector(15 downto 0);
	inp23 : in std_logic_vector(15 downto 0);
	inp24 : in std_logic_vector(15 downto 0);
	inp25 : in std_logic_vector(15 downto 0);
	inp26 : in std_logic_vector(15 downto 0);
	inp27 : in std_logic_vector(15 downto 0);
	inp28 : in std_logic_vector(15 downto 0);
	inp29 : in std_logic_vector(15 downto 0);
	inp30 : in std_logic_vector(15 downto 0);
	inp31 : in std_logic_vector(15 downto 0);
	sel:in std_logic_vector(4 downto 0);
	outp: out std_logic_vector(15 downto 0)
);

end entity;


architecture behav of thirtytwobyone_data_mux is
component twobyone_data_mux is
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(15 downto 0)
);
end component;

component sixteenbyone_data_mux
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	inp3: in std_logic_vector(15 downto 0);
	inp4:in std_logic_vector(15 downto 0);
	inp5:in std_logic_vector(15 downto 0);
	inp6: in std_logic_vector(15 downto 0);
	inp7: in std_logic_vector(15 downto 0);
	inp8:in std_logic_vector(15 downto 0);
	inp9:in std_logic_vector(15 downto 0);
	inp10: in std_logic_vector(15 downto 0);
	inp11: in std_logic_vector(15 downto 0);
	inp12:in std_logic_vector(15 downto 0);
	inp13:in std_logic_vector(15 downto 0);
	inp14: in std_logic_vector(15 downto 0);
	inp15: in std_logic_vector(15 downto 0);
	sel:in std_logic_vector(3 downto 0);
	outp: out std_logic_vector(15 downto 0)
);

end component;


signal temp0 : std_logic_vector(15 downto 0);
signal temp1 : std_logic_vector(15 downto 0);
--signal temp2 : std_logic_vector(15 downto 0);
begin
	mux1 : sixteenbyone_data_mux port map(inp0,inp1,inp2,inp3,inp4,inp5,inp6,inp7,inp8,inp9,inp10,inp11,inp12,inp13,inp14,inp15,sel(3 downto 0),temp0);
	mux2 : sixteenbyone_data_mux port map(inp16,inp17,inp18,inp19,inp20,inp21,inp22,inp23,inp24,inp25,inp26,inp27,inp28,inp29,inp30,inp31,sel(3 downto 0),temp1);
	mux3: twobyone_data_mux port map(temp0,temp1,sel(4),outp);

end architecture;