library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity fourbyone_mux_3bit is
port(
	inp0:in std_logic_vector(2 downto 0);
	inp1:in std_logic_vector(2 downto 0);
	inp2:in std_logic_vector(2 downto 0);
	inp3:in std_logic_vector(2 downto 0);
	sel:in std_logic_vector(1 downto 0);
	outp: out std_logic_vector(2 downto 0)
);

end entity;


architecture behav of fourbyone_mux_3bit is

component twobyone_mux_3bit
port(
	inp0:in std_logic_vector(2 downto 0);
	inp1:in std_logic_vector(2 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(2 downto 0)
);

end component;

signal temp0,temp1:std_logic_vector(2 downto 0);

begin
	mux0: twobyone_mux_3bit port map(inp0,inp1,sel(0),temp0);
	mux1: twobyone_mux_3bit port map(inp2,inp3,sel(0),temp1);
	mux2: twobyone_mux_3bit port map(temp0,temp1,sel(1),outp);
end architecture;