library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity datapath is 
port(

	--	many many control signals are inputs!
	t1_write: in std_logic;
	t2_write: in std_logic;
	t3_write: in std_logic;
	ir_write : in std_logic;
	pc_write: in std_logic;
	memory_write: in std_logic;
	rf_write : in std_logic;
	c_write: in std_logic;
	z_write: in std_logic;
	alu_control_signal: in std_logic;
	m1,m12,m20,m21: in std_logic;
	m30,m31: in std_logic;
	m4: in std_logic;
	m50,m51 : in std_logic;
	m60,m61 : in std_logic;
	m70,m71 : in std_logic;
	m8 : in std_logic;
	m90,m91 : in std_logic;
	m100,m101 : in std_logic;
	mz: in std_logic;
	
	clk : in std_logic;
	rst: in std_logic;
	
	opcode: out std_logic_vector(3 downto 0);
	ir_1_0: out std_logic_vector(1 downto 0);
	c: out std_logic;
	z: out std_logic;
	t1: out std_logic_vector(15 downto 0);
	t2: out std_logic_vector(15 downto 0);
	t3: out std_logic_vector(15 downto 0)
);



end entity;

architecture behav of datapath is
component alu
port(
	inp1: in std_logic_vector(15 downto 0);
	inp2: in std_logic_vector(15 downto 0);
	control : in std_logic;
	outp: out std_logic_vector(15 downto 0);
	cout: out std_logic;
	zout : out std_logic
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

component rf
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
end component;

component memory
port(
	mem_addr:in std_logic_vector(15 downto 0);
	data: in std_logic_vector(15 downto 0);
	write_signal:in std_logic;
	clk:in std_logic;
	rst: in std_logic;
	outp:out std_logic_vector(15 downto 0)
);
end component;

component signextender6
port(
	inp: in std_logic_vector(5 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end component;

component signextender9
port(
	inp: in std_logic_vector(8 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end component;

component twobyone_data_mux
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

component twobyone_mux_3bit
port(
	inp0:in std_logic_vector(2 downto 0);
	inp1:in std_logic_vector(2 downto 0);
	sel:in std_logic;
	outp: out std_logic_vector(2 downto 0)
);
end component;

component fourbyone_mux_3bit
port(
	inp0:in std_logic_vector(2 downto 0);
	inp1:in std_logic_vector(2 downto 0);
	inp2:in std_logic_vector(2 downto 0);
	inp3:in std_logic_vector(2 downto 0);
	sel:in std_logic_vector(1 downto 0);
	outp: out std_logic_vector(2 downto 0)
);
end component;

component twobyone_mux
port(
	inp0:in std_logic;
	inp1:in std_logic;
	sel:in std_logic;
	outp: out std_logic
);

end component;



component DFlipFlop 
port(
	inp: in std_logic;
	write_signal : in std_logic;
	clk : in std_logic;
	rst : in std_logic;
	outp: out std_logic
);
end component;

component bitpadder9
port(
	inp: in std_logic_vector(8 downto 0);
	outp: out std_logic_vector(15 downto 0)
);
end component;

component zero_check
port(
	inp:in std_logic_vector(15 downto 0);
	outp: out std_logic
);
end component;

signal pc_outp_signal: std_logic_vector(15 downto 0);
signal pc_inp_signal:std_logic_vector(15 downto 0);


signal memory_outp_signal:std_logic_vector(15 downto 0);
signal memory_address_inp:std_logic_vector(15 downto 0);
signal memory_data_inp:std_logic_vector(15 downto 0);


signal ir_signal:std_logic_vector(15 downto 0);

signal alu_inp_a:std_logic_vector(15 downto 0);
signal alu_inp_b:std_logic_vector(15 downto 0);
signal alu_res_signal:std_logic_vector(15 downto 0);
signal alu_carry_signal:std_logic;
signal alu_zero_signal:std_logic; 



signal z_inp_signal : std_logic;


signal rf_a1_inp,rf_a2_inp,rf_a3_inp:std_logic_vector(2 downto 0);
signal rf_data_inp:std_logic_vector(15 downto 0);
signal rf_outp1,rf_outp2 : std_logic_vector(15 downto 0);

signal t1_inp_signal,t1_outp_signal:std_logic_vector(15 downto 0);
signal t2_inp_signal,t2_outp_signal:std_logic_vector(15 downto 0);
signal t3_inp_signal,t3_outp_signal:std_logic_vector(15 downto 0);
signal t3_is_zero:std_logic;

signal temp_ir_8_0: std_logic_vector(15 downto 0);
signal temp_ir_5_0: std_logic_vector(15 downto 0);
signal temp_ir_8_0_padd:std_logic_vector(15 downto 0); --this is for the lmm thing

--signal t1_signal: std_logic_vector(15 downto 0);
--signal t2_signal: std_logic_vector(15 downto 0);
--signal t3_signal: std_logic_vector(15 downto 0);
--signal ir_signal: std_logic_vector(15 downto 0);
--signal c_inp:std_logic;
--signal z_inp:std_logic;
signal m2:std_logic_vector(1 downto 0);
signal m10:std_logic_vector(1 downto 0);
signal m9:std_logic_vector(1 downto 0);
signal m5,m6,m7:std_logic_vector(1 downto 0);
signal m3:std_logic_vector(1 downto 0);

begin
	pc_reg: reg port map(pc_inp_signal,pc_write,clk,rst,pc_outp_signal);
	memory_file: memory port map(memory_address_inp,memory_data_inp,memory_write,clk,rst,memory_outp_signal);
	ir_reg: reg port map(memory_outp_signal,ir_write,clk,rst,ir_signal);
	alu_unit : alu port map(alu_inp_a,alu_inp_b,alu_control_signal,alu_res_signal,alu_carry_signal,alu_zero_signal);
	c_reg: DFlipFlop port map(alu_carry_signal,c_write,clk,rst,c);
	z_reg: DFlipFlop port map(z_inp_signal,z_write,clk,rst,z);
	rf_file:rf port map(rf_a1_inp,rf_a2_inp,rf_a3_inp,rf_data_inp,rf_write,clk,rst,rf_outp1,rf_outp2);
	
	zero_checker : zero_check port map(t3_outp_signal,t3_is_zero);
	mux_z_inp: twobyone_mux port map(alu_zero_signal,t3_is_zero,mz,z_inp_signal);
	
	t1_reg: reg port map(t1_inp_signal,t1_write,clk,rst,t1_outp_signal);
	t2_reg: reg port map(t2_inp_signal,t2_write,clk,rst,t2_outp_signal);
	t3_reg: reg port map(t3_inp_signal,t3_write,clk,rst,t3_outp_signal);
	t1<=t1_outp_signal;
	t2<=t2_outp_signal;
	t3<=t3_outp_signal;
	
	Mux_PC:twobyone_data_mux port map(alu_res_signal,t2_outp_signal,m1,pc_inp_signal);
	Mux_Mem_data_inp: twobyone_data_mux port map(t1_outp_signal,t2_outp_signal,m12,memory_data_inp);
	
	m2(0)<=m20;
	m2(1)<=m21;
	Mux_Mem_addr: fourbyone_data_mux port map(t2_outp_signal,pc_outp_signal,alu_res_signal,t1_outp_signal,m2,memory_address_inp);
	
	
	m10(0)<=m100;
	m10(1)<=m101;
	Mux_alu_a : fourbyone_data_mux port map(t3_outp_signal,pc_outp_signal,t1_outp_signal,t2_outp_signal,m10,alu_inp_a);
	
	
	m9(0)<=m90;
	m9(1)<=m91;
	se6: signextender6 port map(ir_signal(5 downto 0),temp_ir_5_0);
	se9: signextender9 port map(ir_signal(8 downto 0),temp_ir_8_0);
	Mux_alu_b: fourbyone_data_mux port map(temp_ir_8_0,temp_ir_5_0,t2_outp_signal,"0000000000000001",m9,alu_inp_b);
	
	Mux_t1: twobyone_data_mux port map(rf_outp1,alu_res_signal,m8,t1_inp_signal);
	
	
	m7(0)<=m70;
	m7(1)<=m71;
	Mux_t2: fourbyone_data_mux port map(rf_outp1,rf_outp2,alu_res_signal,memory_outp_signal,m7,t2_inp_signal);

	m6(0)<=m60;
	m6(1)<=m61;
	Mux_t3: fourbyone_data_mux port map(memory_outp_signal,"0000000000000000",alu_res_signal,"0000000000000000",m6,t3_inp_signal);
	
	
	m5(0)<=m50;
	m5(1)<=m51;
	bitpadder: bitpadder9 port map(ir_signal(8 downto 0),temp_ir_8_0_padd);
	Mux_rf_data_inp: fourbyone_data_mux port map(pc_outp_signal,temp_ir_8_0_padd,t2_outp_signal,t3_outp_signal,m5,rf_data_inp);
	
	Mux_rf_a1_inp : twobyone_mux_3bit port map(ir_signal(11 downto 9),t3_outp_signal(2 downto 0),m4,rf_a1_inp);
	
	rf_a2_inp<= ir_signal(8 downto 6);
	
	m3(0) <= m30;
	m3(1) <= m31;
	Mux_rf_a3_inp : fourbyone_mux_3bit port map(ir_signal(11 downto 9),ir_signal(8 downto 6),ir_signal(5 downto 3),t3_outp_signal(2 downto 0),m3,rf_a3_inp);

	opcode<=ir_signal(15 downto 12);
	ir_1_0 <= ir_signal(1 downto 0);
	

end architecture;