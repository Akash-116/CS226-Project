library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity twobyone_data_mux is
port(
	inp0:in std_logic_vector(15 downto 0);
	inp1:in std_logic_vector(15 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(15 downto 0)
);

end entity;


architecture behav of twobyone_data_mux is

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
	mux3 : twobyone_mux port map(inp0(3),inp1(3),sel,outp(3));
	mux4 : twobyone_mux port map(inp0(4),inp1(4),sel,outp(4));
	mux5 : twobyone_mux port map(inp0(5),inp1(5),sel,outp(5));
	mux6 : twobyone_mux port map(inp0(6),inp1(6),sel,outp(6));
	mux7 : twobyone_mux port map(inp0(7),inp1(7),sel,outp(7));
	mux8 : twobyone_mux port map(inp0(8),inp1(8),sel,outp(8));
	mux9 : twobyone_mux port map(inp0(9),inp1(9),sel,outp(9));
	mux10 : twobyone_mux port map(inp0(10),inp1(10),sel,outp(10));
	mux11 : twobyone_mux port map(inp0(11),inp1(11),sel,outp(11));
	mux12 : twobyone_mux port map(inp0(12),inp1(12),sel,outp(12));
	mux13 : twobyone_mux port map(inp0(13),inp1(13),sel,outp(13));
	mux14 : twobyone_mux port map(inp0(14),inp1(14),sel,outp(14));
	mux15 : twobyone_mux port map(inp0(15),inp1(15),sel,outp(15));
end architecture;