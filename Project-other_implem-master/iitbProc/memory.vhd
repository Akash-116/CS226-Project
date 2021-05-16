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
signal temp0:std_logic_vector(15 downto 0):=x"4054";
signal temp1:std_logic_vector(15 downto 0):=x"6000";
signal temp2:std_logic_vector(15 downto 0):=x"c042";
signal temp3:std_logic_vector(15 downto 0):=x"0210";
signal temp4:std_logic_vector(15 downto 0):=x"c4c3";
signal temp5:std_logic_vector(15 downto 0):=x"0000";
signal temp6:std_logic_vector(15 downto 0):=x"0000";
signal temp7:std_logic_vector(15 downto 0):=x"13be";
signal temp8:std_logic_vector(15 downto 0):=x"2128";
signal temp9:std_logic_vector(15 downto 0):=x"0a32";
signal temp10:std_logic_vector(15 downto 0):=x"c982";
signal temp11:std_logic_vector(15 downto 0):=x"212a";
signal temp12:std_logic_vector(15 downto 0):=x"3caa";
signal temp13:std_logic_vector(15 downto 0):=x"5044";
signal temp14:std_logic_vector(15 downto 0):=x"8202";
signal temp15:std_logic_vector(15 downto 0):=x"0000";
signal temp16:std_logic_vector(15 downto 0):=x"91c0";
signal temp17:std_logic_vector(15 downto 0):=x"0000";
signal temp18:std_logic_vector(15 downto 0):=x"7000";
signal temp19:std_logic_vector(15 downto 0):=x"f000";
signal temp20:std_logic_vector(15 downto 0):=x"0014";
signal temp21:std_logic_vector(15 downto 0):=x"0002";
signal temp22:std_logic_vector(15 downto 0):=x"0000";
signal temp23:std_logic_vector(15 downto 0):=x"0016";
signal temp24:std_logic_vector(15 downto 0):=x"ffff";
signal temp25:std_logic_vector(15 downto 0):=x"0000";
signal temp26:std_logic_vector(15 downto 0):=x"ffff";
signal temp27:std_logic_vector(15 downto 0):=x"0012";
signal temp28:std_logic_vector(15 downto 0):=x"0000";
signal temp29:std_logic_vector(15 downto 0):=x"0000";
signal temp30:std_logic_vector(15 downto 0):=x"0000";
signal temp31:std_logic_vector(15 downto 0):=x"0000";

begin
	
	demux : demux32 port map(mem_addr(4 downto 0),write_signal,write_signal_act);
	
	reg0 : reg port map(data,write_signal_act(0),clk,'0',temp0);
	reg1 : reg port map(data,write_signal_act(1),clk,'0',temp1);
	reg2 : reg port map(data,write_signal_act(2),clk,'0',temp2);
	reg3 : reg port map(data,write_signal_act(3),clk,'0',temp3);
	reg4 : reg port map(data,write_signal_act(4),clk,'0',temp4);
	reg5 : reg port map(data,write_signal_act(5),clk,'0',temp5);
	reg6 : reg port map(data,write_signal_act(6),clk,'0',temp6);
	reg7 : reg port map(data,write_signal_act(7),clk,'0',temp7);
	reg8 : reg port map(data,write_signal_act(8),clk,'0',temp8);
	reg9 : reg port map(data,write_signal_act(9),clk,'0',temp9);
	reg10 : reg port map(data,write_signal_act(10),clk,'0',temp10);
	reg11 : reg port map(data,write_signal_act(11),clk,'0',temp11);
	reg12 : reg port map(data,write_signal_act(12),clk,'0',temp12);
	reg13 : reg port map(data,write_signal_act(13),clk,'0',temp13);
	reg14 : reg port map(data,write_signal_act(14),clk,'0',temp14);
	reg15 : reg port map(data,write_signal_act(15),clk,'0',temp15);
	reg16 : reg port map(data,write_signal_act(16),clk,'0',temp16);
	reg17 : reg port map(data,write_signal_act(17),clk,'0',temp17);
	reg18 : reg port map(data,write_signal_act(18),clk,'0',temp18);
	reg19 : reg port map(data,write_signal_act(19),clk,'0',temp19);
	reg20 : reg port map(data,write_signal_act(20),clk,'0',temp20);
	reg21 : reg port map(data,write_signal_act(21),clk,'0',temp21);
	reg22 : reg port map(data,write_signal_act(22),clk,'0',temp22);
	reg23 : reg port map(data,write_signal_act(23),clk,'0',temp23);
	reg24 : reg port map(data,write_signal_act(24),clk,'0',temp24);
	reg25 : reg port map(data,write_signal_act(25),clk,'0',temp25);
	reg26 : reg port map(data,write_signal_act(26),clk,'0',temp26);
	reg27 : reg port map(data,write_signal_act(27),clk,'0',temp27);
	reg28 : reg port map(data,write_signal_act(28),clk,'0',temp28);
	reg29 : reg port map(data,write_signal_act(29),clk,'0',temp29);
	reg30 : reg port map(data,write_signal_act(30),clk,'0',temp30);
	reg31 : reg port map(data,write_signal_act(31),clk,'0',temp31);
	
	data_mux : thirtytwobyone_data_mux port map(temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,
																temp9,temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17,
																temp18,temp19,temp20,temp21,temp22,temp23,temp24,temp25,temp26,temp27,
																temp28,temp29,temp30,temp31,mem_addr(4 downto 0),outp);
	
	
	
	



end architecture;
