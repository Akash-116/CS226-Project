library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity eightbyone_data_mux is
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

end entity;


architecture behav of eightbyone_data_mux is
component twobyone_data_mux is
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(15 downto 0)
);
end component;

component fourbyone_data_mux
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	inp3: in std_logic_vector(15 downto 0);
	sel:in std_logic_vector(1 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end component;

signal temp0,temp1: std_logic_vector(15 downto 0);

begin
	mux0: fourbyone_data_mux port map(inp0,inp1,inp2,inp3,sel(1 downto 0),temp0);
	mux1: fourbyone_data_mux port map(inp4,inp5,inp6,inp7,sel(1 downto 0),temp1);
	mux2: twobyone_data_mux port map(temp0,temp1,sel(2),outp);
end architecture;