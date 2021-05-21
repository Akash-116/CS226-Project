library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity sixteenbyone_data_mux is
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

end entity;


architecture behav of sixteenbyone_data_mux is
component twobyone_data_mux is
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(15 downto 0)
);
end component;

component eightbyone_data_mux
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	inp3: in std_logic_vector(15 downto 0);
	inp4:in std_logic_vector(15 downto 0);
	inp5:in std_logic_vector(15 downto 0);
	inp6: in std_logic_vector(15 downto 0);
	inp7: in std_logic_vector(15 downto 0);
	sel:in std_logic_vector(2 downto 0);
	outp: out std_logic_vector(15 downto 0)
);

end component;

signal temp0 : std_logic_vector(15 downto 0);
signal temp1 : std_logic_vector(15 downto 0);
--signal temp2 : std_logic_vector(15 downto 0);
begin
	mux1 : eightbyone_data_mux port map(inp0,inp1,inp2,inp3,inp4,inp5,inp6,inp7,sel(2 downto 0),temp0);
	mux2 : eightbyone_data_mux port map(inp8,inp9,inp10,inp11,inp12,inp13,inp14,inp15,sel(2 downto 0),temp1);
	mux3: twobyone_data_mux port map(temp0,temp1,sel(3),outp);

end architecture;