library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity twobyone_mux_3bit is
port(
	inp0:in std_logic_vector(2 downto 0);
	inp1:in std_logic_vector(2 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(2 downto 0)
);

end entity;


architecture behav of twobyone_mux_3bit is

component twobyone_mux 
port(
	inp0:in std_logic;
	inp1:in std_logic;
	sel:in std_logic;
	outp: out std_logic
);
end component;

begin
	mux0 : twobyone_mux port map(inp0(0),inp1(0),sel,outp(0));
	mux1 : twobyone_mux port map(inp0(1),inp1(1),sel,outp(1));
	mux2 : twobyone_mux port map(inp0(2),inp1(2),sel,outp(2));
end architecture;