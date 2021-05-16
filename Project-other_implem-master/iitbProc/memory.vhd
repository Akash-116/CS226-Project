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
signal temp0:std_logic_vector(15 downto 0);
signal temp1:std_logic_vector(15 downto 0);
signal temp2:std_logic_vector(15 downto 0);
signal temp3:std_logic_vector(15 downto 0);
signal temp4:std_logic_vector(15 downto 0);
signal temp5:std_logic_vector(15 downto 0);
signal temp6:std_logic_vector(15 downto 0);
signal temp7:std_logic_vector(15 downto 0);
signal temp8:std_logic_vector(15 downto 0);
signal temp9:std_logic_vector(15 downto 0);
signal temp10:std_logic_vector(15 downto 0);
signal temp11:std_logic_vector(15 downto 0);
signal temp12:std_logic_vector(15 downto 0);
signal temp13:std_logic_vector(15 downto 0);
signal temp14:std_logic_vector(15 downto 0);
signal temp15:std_logic_vector(15 downto 0);
signal temp16:std_logic_vector(15 downto 0);
signal temp17:std_logic_vector(15 downto 0);
signal temp18:std_logic_vector(15 downto 0);
signal temp19:std_logic_vector(15 downto 0);
signal temp20:std_logic_vector(15 downto 0);
signal temp21:std_logic_vector(15 downto 0);
signal temp22:std_logic_vector(15 downto 0);
signal temp23:std_logic_vector(15 downto 0);
signal temp24:std_logic_vector(15 downto 0);
signal temp25:std_logic_vector(15 downto 0);
signal temp26:std_logic_vector(15 downto 0);
signal temp27:std_logic_vector(15 downto 0);
signal temp28:std_logic_vector(15 downto 0);
signal temp29:std_logic_vector(15 downto 0);
signal temp30:std_logic_vector(15 downto 0);
signal temp31:std_logic_vector(15 downto 0);

begin
	
	demux : demux32 port map(mem_addr(4 downto 0),write_signal,write_signal_act);
	
	-- reg0 : reg port map(data,write_signal_act(0),clk,'0',temp0);
	-- reg1 : reg port map(data,write_signal_act(1),clk,'0',temp1);
	-- reg2 : reg port map(data,write_signal_act(2),clk,'0',temp2);
	-- reg3 : reg port map(data,write_signal_act(3),clk,'0',temp3);
	-- reg4 : reg port map(data,write_signal_act(4),clk,'0',temp4);
	-- reg5 : reg port map(data,write_signal_act(5),clk,'0',temp5);
	-- reg6 : reg port map(data,write_signal_act(6),clk,'0',temp6);
	-- reg7 : reg port map(data,write_signal_act(7),clk,'0',temp7);
	-- reg8 : reg port map(data,write_signal_act(8),clk,'0',temp8);
	-- reg9 : reg port map(data,write_signal_act(9),clk,'0',temp9);
	-- reg10 : reg port map(data,write_signal_act(10),clk,'0',temp10);
	-- reg11 : reg port map(data,write_signal_act(11),clk,'0',temp11);
	-- reg12 : reg port map(data,write_signal_act(12),clk,'0',temp12);
	-- reg13 : reg port map(data,write_signal_act(13),clk,'0',temp13);
	-- reg14 : reg port map(data,write_signal_act(14),clk,'0',temp14);
	-- reg15 : reg port map(data,write_signal_act(15),clk,'0',temp15);
	-- reg16 : reg port map(data,write_signal_act(16),clk,'0',temp16);
	-- reg17 : reg port map(data,write_signal_act(17),clk,'0',temp17);
	-- reg18 : reg port map(data,write_signal_act(18),clk,'0',temp18);
	-- reg19 : reg port map(data,write_signal_act(19),clk,'0',temp19);
	-- reg20 : reg port map(data,write_signal_act(20),clk,'0',temp20);
	-- reg21 : reg port map(data,write_signal_act(21),clk,'0',temp21);
	-- reg22 : reg port map(data,write_signal_act(22),clk,'0',temp22);
	-- reg23 : reg port map(data,write_signal_act(23),clk,'0',temp23);
	-- reg24 : reg port map(data,write_signal_act(24),clk,'0',temp24);
	-- reg25 : reg port map(data,write_signal_act(25),clk,'0',temp25);
	-- reg26 : reg port map(data,write_signal_act(26),clk,'0',temp26);
	-- reg27 : reg port map(data,write_signal_act(27),clk,'0',temp27);
	-- reg28 : reg port map(data,write_signal_act(28),clk,'0',temp28);
	-- reg29 : reg port map(data,write_signal_act(29),clk,'0',temp29);
	-- reg30 : reg port map(data,write_signal_act(30),clk,'0',temp30);
	-- reg31 : reg port map(data,write_signal_act(31),clk,'0',temp31);
	
	data_mux : thirtytwobyone_data_mux port map(temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,
																temp9,temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17,
																temp18,temp19,temp20,temp21,temp22,temp23,temp24,temp25,temp26,temp27,
																temp28,temp29,temp30,temp31,mem_addr(4 downto 0),outp);

	process(clk)
		variable temp0_var:std_logic_vector(15 downto 0):=x"4054";
		variable temp1_var:std_logic_vector(15 downto 0):=x"6000";
		variable temp2_var:std_logic_vector(15 downto 0):=x"c042";
		variable temp3_var:std_logic_vector(15 downto 0):=x"0210";
		variable temp4_var:std_logic_vector(15 downto 0):=x"c4c3";
		variable temp5_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp6_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp7_var:std_logic_vector(15 downto 0):=x"13be";
		variable temp8_var:std_logic_vector(15 downto 0):=x"2128";
		variable temp9_var:std_logic_vector(15 downto 0):=x"0a32";
		variable temp10_var:std_logic_vector(15 downto 0):=x"c982";
		variable temp11_var:std_logic_vector(15 downto 0):=x"212a";
		variable temp12_var:std_logic_vector(15 downto 0):=x"3caa";
		variable temp13_var:std_logic_vector(15 downto 0):=x"5044";
		variable temp14_var:std_logic_vector(15 downto 0):=x"8202";
		variable temp15_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp16_var:std_logic_vector(15 downto 0):=x"91c0";
		variable temp17_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp18_var:std_logic_vector(15 downto 0):=x"7000";
		variable temp19_var:std_logic_vector(15 downto 0):=x"f000";
		variable temp20_var:std_logic_vector(15 downto 0):=x"0014";
		variable temp21_var:std_logic_vector(15 downto 0):=x"0002";
		variable temp22_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp23_var:std_logic_vector(15 downto 0):=x"0016";
		variable temp24_var:std_logic_vector(15 downto 0):=x"ffff";
		variable temp25_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp26_var:std_logic_vector(15 downto 0):=x"ffff";
		variable temp27_var:std_logic_vector(15 downto 0):=x"0012";
		variable temp28_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp29_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp30_var:std_logic_vector(15 downto 0):=x"0000";
		variable temp31_var:std_logic_vector(15 downto 0):=x"0000";
	begin
		if(rising_edge(clk)) then
			if(write_signal_act(0)='1') then
				temp0_var:=data;
			end if;
			if(write_signal_act(1)='1') then
				temp1_var:=data;
			end if;
			if(write_signal_act(2)='1') then
				temp2_var:=data;
			end if;
			if(write_signal_act(3)='1') then
				temp3_var:=data;
			end if;
			if(write_signal_act(4)='1') then
				temp4_var:=data;
			end if;
			if(write_signal_act(5)='1') then
				temp5_var:=data;
			end if;
			if(write_signal_act(6)='1') then
				temp6_var:=data;
			end if;
			if(write_signal_act(7)='1') then
				temp7_var:=data;
			end if;
			if(write_signal_act(8)='1') then
				temp8_var:=data;
			end if;
			if(write_signal_act(9)='1') then
				temp9_var:=data;
			end if;
			if(write_signal_act(10)='1') then
				temp10_var:=data;
			end if;
			if(write_signal_act(11)='1') then
				temp11_var:=data;
			end if;
			if(write_signal_act(12)='1') then
				temp12_var:=data;
			end if;
			if(write_signal_act(13)='1') then
				temp13_var:=data;
			end if;
			if(write_signal_act(14)='1') then
				temp14_var:=data;
			end if;
			if(write_signal_act(15)='1') then
				temp15_var:=data;
			end if;
			if(write_signal_act(16)='1') then
				temp16_var:=data;
			end if;
			if(write_signal_act(17)='1') then
				temp17_var:=data;
			end if;
			if(write_signal_act(18)='1') then
				temp18_var:=data;
			end if;
			if(write_signal_act(19)='1') then
				temp19_var:=data;
			end if;
			if(write_signal_act(20)='1') then
				temp20_var:=data;
			end if;
			if(write_signal_act(21)='1') then
				temp21_var:=data;
			end if;
			if(write_signal_act(22)='1') then
				temp22_var:=data;
			end if;
			if(write_signal_act(23)='1') then
				temp23_var:=data;
			end if;
			if(write_signal_act(24)='1') then
				temp24_var:=data;
			end if;
			if(write_signal_act(25)='1') then
				temp25_var:=data;
			end if;
			if(write_signal_act(26)='1') then
				temp26_var:=data;
			end if;
			if(write_signal_act(27)='1') then
				temp27_var:=data;
			end if;
			if(write_signal_act(28)='1') then
				temp28_var:=data;
			end if;
			if(write_signal_act(29)='1') then
				temp29_var:=data;
			end if;
			if(write_signal_act(30)='1') then
				temp30_var:=data;
			end if;
			if(write_signal_act(31)='1') then
				temp31_var:=data;
			end if;
		end if;
		temp0<=temp0_var;
		temp1<=temp1_var;
		temp2<=temp2_var;
		temp3<=temp3_var;
		temp4<=temp4_var;
		temp5<=temp5_var;
		temp6<=temp6_var;
		temp7<=temp7_var;
		temp8<=temp8_var;
		temp9<=temp9_var;
		temp10<=temp10_var;
		temp11<=temp11_var;
		temp12<=temp12_var;
		temp13<=temp13_var;
		temp14<=temp14_var;
		temp15<=temp15_var;
		temp16<=temp16_var;
		temp17<=temp17_var;
		temp18<=temp18_var;
		temp19<=temp19_var;
		temp20<=temp20_var;
		temp21<=temp21_var;
		temp22<=temp22_var;
		temp23<=temp23_var;
		temp24<=temp24_var;
		temp25<=temp25_var;
		temp26<=temp26_var;
		temp27<=temp27_var;
		temp28<=temp28_var;
		temp29<=temp29_var;
		temp30<=temp30_var;
		temp31<=temp31_var;
	end process;
	
	
	



end architecture;
