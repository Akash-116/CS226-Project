library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;


--mem_addr is the read position.If write signal is also one then write happens with the data input at the mem_addr location 

entity memory is
port(
	mem_addr:in std_logic_vector(15 downto 0);
	data: in std_logic_vector(15 downto 0);
	write_signal:in std_logic;
	clk:in std_logic;
	rst: in std_logic;
	outp:out std_logic_vector(15 downto 0)
);
end entity;

architecture behav of memory is 

component demux32
port(
	sel: in std_logic_vector(4 downto 0);
	write_signal: in std_logic;
	outp: out std_logic_vector(31 downto 0)
);
end component;


component reg  
port(
	inp: in std_logic_vector(15 downto 0);
	write_signal : in std_logic;
	clk : in std_logic;
	rst : in std_logic;
	outp: out std_logic_vector(15 downto 0)
);
end component;

component thirtytwobyone_data_mux
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

end component;


signal write_signal_act: std_logic_vector(31 downto 0);
signal temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7 : std_logic_vector(15 downto 0);
signal temp8,temp9,temp10,temp11,temp12,temp13,temp14,temp15 : std_logic_vector(15 downto 0);
signal temp16,temp17,temp18,temp19,temp20,temp21,temp22,temp23 : std_logic_vector(15 downto 0);
signal temp24,temp25,temp26,temp27,temp28,temp29,temp30,temp31 : std_logic_vector(15 downto 0);

begin
	
	demux : demux32 port map(mem_addr(4 downto 0),write_signal,write_signal_act);
	
	reg0 : reg port map(data,write_signal_act(0),clk,rst,temp0);
	reg1 : reg port map(data,write_signal_act(1),clk,rst,temp1);
	reg2 : reg port map(data,write_signal_act(2),clk,rst,temp2);
	reg3 : reg port map(data,write_signal_act(3),clk,rst,temp3);
	reg4 : reg port map(data,write_signal_act(4),clk,rst,temp4);
	reg5 : reg port map(data,write_signal_act(5),clk,rst,temp5);
	reg6 : reg port map(data,write_signal_act(6),clk,rst,temp6);
	reg7 : reg port map(data,write_signal_act(7),clk,rst,temp7);
	reg8 : reg port map(data,write_signal_act(8),clk,rst,temp8);
	reg9 : reg port map(data,write_signal_act(9),clk,rst,temp9);
	reg10 : reg port map(data,write_signal_act(10),clk,rst,temp10);
	reg11 : reg port map(data,write_signal_act(11),clk,rst,temp11);
	reg12 : reg port map(data,write_signal_act(12),clk,rst,temp12);
	reg13 : reg port map(data,write_signal_act(13),clk,rst,temp13);
	reg14 : reg port map(data,write_signal_act(14),clk,rst,temp14);
	reg15 : reg port map(data,write_signal_act(15),clk,rst,temp15);
	reg16 : reg port map(data,write_signal_act(16),clk,rst,temp16);
	reg17 : reg port map(data,write_signal_act(17),clk,rst,temp17);
	reg18 : reg port map(data,write_signal_act(18),clk,rst,temp18);
	reg19 : reg port map(data,write_signal_act(19),clk,rst,temp19);
	reg20 : reg port map(data,write_signal_act(20),clk,rst,temp20);
	reg21 : reg port map(data,write_signal_act(21),clk,rst,temp21);
	reg22 : reg port map(data,write_signal_act(22),clk,rst,temp22);
	reg23 : reg port map(data,write_signal_act(23),clk,rst,temp23);
	reg24 : reg port map(data,write_signal_act(24),clk,rst,temp24);
	reg25 : reg port map(data,write_signal_act(25),clk,rst,temp25);
	reg26 : reg port map(data,write_signal_act(26),clk,rst,temp26);
	reg27 : reg port map(data,write_signal_act(27),clk,rst,temp27);
	reg28 : reg port map(data,write_signal_act(28),clk,rst,temp28);
	reg29 : reg port map(data,write_signal_act(29),clk,rst,temp29);
	reg30 : reg port map(data,write_signal_act(30),clk,rst,temp30);
	reg31 : reg port map(data,write_signal_act(31),clk,rst,temp31);
	
	data_mux : thirtytwobyone_data_mux port map(temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,
																temp9,temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17,
																temp18,temp19,temp20,temp21,temp22,temp23,temp24,temp25,temp26,temp27,
																temp28,temp29,temp30,temp31,mem_addr(4 downto 0),outp);
	
	
	
	



end architecture;
