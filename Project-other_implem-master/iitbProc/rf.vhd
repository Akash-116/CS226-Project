library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

--sel1 and sel2 are the locations of read positions and outp1 and outp2 are the corresponding values in those locations
--sel3 is the location of write position
--data is the data that is to be written. Obv write happens only if write_signal is 1
--obviously we will write only if all write signal is 1 and clock goes from low to high but all this is taken care by reg entity really.

entity rf is
port(
	sel1:in std_logic_vector(2 downto 0);
	sel2:in std_logic_vector(2 downto 0);
	sel3:in std_logic_vector(2 downto 0);
	data: in std_logic_vector(15 downto 0);
	write_signal:in std_logic;
	clk:in std_logic;
	rst: in std_logic;
	outp1:out std_logic_vector(15 downto 0);
	outp2 :out std_logic_vector(15 downto 0)
);
end entity;


architecture behav of rf is
component reg 
port(
	inp: in std_logic_vector(15 downto 0);
	write_signal : in std_logic;
	clk : in std_logic;
	rst : in std_logic;
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

component demux8
port(
	sel: in std_logic_vector(2 downto 0);
	write_signal: in std_logic;
	outp: out std_logic_vector(7 downto 0)
);
end component;


-- need to add the demux idea here
signal fin_write_signal: std_logic_vector(7 downto 0);
signal temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7: std_logic_vector(15 downto 0);

begin
	demux0: demux8 port map(sel3,write_signal,fin_write_signal);
	reg0 : reg port map(data,fin_write_signal(0),clk,rst,temp0);
	reg1 : reg port map(data,fin_write_signal(1),clk,rst,temp1);
	reg2 : reg port map(data,fin_write_signal(2),clk,rst,temp2);
	reg3 : reg port map(data,fin_write_signal(3),clk,rst,temp3);
	reg4 : reg port map(data,fin_write_signal(4),clk,rst,temp4);
	reg5 : reg port map(data,fin_write_signal(5),clk,rst,temp5);
	reg6 : reg port map(data,fin_write_signal(6),clk,rst,temp6);
	reg7 : reg port map(data,fin_write_signal(7),clk,rst,temp7);
	
	mux1: eightbyone_data_mux port map(temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,sel1,outp1);
	mux2: eightbyone_data_mux port map(temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,sel2,outp2);









end architecture;