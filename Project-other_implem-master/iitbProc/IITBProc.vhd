library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity IITBProc is
port(
	clk:in std_logic;
	rst : in std_logic
);

end entity;

architecture behav of IITBProc is

component controller 
port(

	opcode_ir: in std_logic_vector(3 downto 0);
	opcode_mem: in std_logic_vector(3 downto 0);
	ir_1_0_ir: in std_logic_vector(1 downto 0);
	ir_1_0_mem: in std_logic_vector(1 downto 0);
	c: in std_logic;
	z: in std_logic;
	t1: in std_logic_vector(15 downto 0);
	t2: in std_logic_vector(15 downto 0);
	t3: in std_logic_vector(15 downto 0);
	clk : in std_logic;
	rst: in std_logic;

	--	many many control signals are outputted!
	t1_write: out std_logic;
	t2_write: out std_logic;
	t3_write: out std_logic;
	ir_write : out std_logic;
	pc_write: out std_logic;
	memory_write: out std_logic;
	rf_write : out std_logic;
	c_write: out std_logic;
	z_write: out std_logic;
	alu_control_signal: out std_logic;
	m1,m12,m20,m21: out std_logic;
	m30,m31: out std_logic;
	m4: out std_logic;
	m50,m51 : out std_logic;
	m60,m61 : out std_logic;
	m70,m71 : out std_logic;
	m8 : out std_logic;
	m90,m91 : out std_logic;
	m100,m101 : out std_logic;
	mz: out std_logic
);
end component;

component datapath 
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
	
	opcode_ir: out std_logic_vector(3 downto 0);
	opcode_mem: out std_logic_vector(3 downto 0);
	ir_1_0_ir: out std_logic_vector(1 downto 0);
	ir_1_0_mem: out std_logic_vector(1 downto 0);
	c: out std_logic;
	z: out std_logic;
	t1: out std_logic_vector(15 downto 0);
	t2: out std_logic_vector(15 downto 0);
	t3: out std_logic_vector(15 downto 0)
);
end component;

signal t1_write,t2_write,t3_write,ir_write,pc_write,memory_write,rf_write  : std_logic;
signal c_write,
	z_write,
	alu_control_signal,
	m1,m12,m20,m21,
	m30,m31,
	m4,
	m50,m51,
	m60,m61,
	m70,m71,
	m8,
	m90,m91,
	m100,m101,
	mz:std_logic;
	
signal	opcode_ir:std_logic_vector(3 downto 0);
signal	ir_1_0_ir:std_logic_vector(1 downto 0);
signal	opcode_mem:std_logic_vector(3 downto 0);
signal	ir_1_0_mem:std_logic_vector(1 downto 0);
signal	c:std_logic;
signal	z:std_logic;
signal	t1:std_logic_vector(15 downto 0);
signal	t2:std_logic_vector(15 downto 0);
signal	t3:std_logic_vector(15 downto 0);



begin

control_unit: controller port map(

	opcode_ir,
	opcode_mem,
	ir_1_0_ir,
	ir_1_0_mem,
	c,
	z,
	t1,
	t2,
	t3,
	clk,
	rst,
	t1_write,
	t2_write,
	t3_write,
	ir_write,
	pc_write,
	memory_write,
	rf_write,
	c_write,
	z_write,
	alu_control_signal,
	m1,m12,m20,m21,
	m30,m31,
	m4,
	m50,m51,
	m60,m61,
	m70,m71,
	m8,
	m90,m91,
	m100,m101,
	mz
);

datapath_unit:datapath port map(

	t1_write,
	t2_write,
	t3_write,
	ir_write,
	pc_write,
	memory_write,
	rf_write,
	c_write,
	z_write,
	alu_control_signal,
	m1,m12,m20,m21,
	m30,m31,
	m4,
	m50,m51,
	m60,m61,
	m70,m71,
	m8,
	m90,m91,
	m100,m101,
	mz,
	clk,
	rst,
	
	opcode_ir,
	opcode_mem,
	ir_1_0_ir,
	ir_1_0_mem,
	c,
	z,
	t1,
	t2,
	t3

); 

end architecture;


