library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity twobyone_mux is
port(
	inp0:in std_logic;
	inp1:in std_logic;
	sel:in std_logic;
	outp: out std_logic
);

end entity;


architecture behav of twobyone_mux is

signal notsel:std_logic;
signal temp1:std_logic;
signal temp2:std_logic;
begin
	notsel <= not sel;
	temp1<= inp1 and sel;
	temp2<= inp0 and notsel;
	outp<= temp1 or temp2;
end architecture;