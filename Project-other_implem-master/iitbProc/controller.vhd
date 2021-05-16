library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity controller is 
port(

	opcode: in std_logic_vector(3 downto 0);
	ir_1_0: in std_logic_vector(1 downto 0);
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
end entity;

architecture behav of controller is

component DFlipFlop 
port(
	inp: in std_logic;
	write_signal : in std_logic;
	clk : in std_logic;
	rst : in std_logic;
	outp: out std_logic
);
end component;



begin
	process(clk)
		variable s_curr_var:std_logic_vector(4 downto 0);
		variable s_next_var:std_logic_vector(4 downto 0);
		variable t1_write_var:std_logic:= '0';
		variable t2_write_var:std_logic:= '0';
		variable t3_write_var:std_logic:= '0';
		variable ir_write_var:std_logic := '0';
		variable pc_write_var:std_logic:= '0';
		variable memory_write_var:std_logic:= '0';
		variable rf_write_var :std_logic:= '0';
		variable c_write_var:std_logic:= '0';
		variable z_write_var:std_logic:= '0';
		variable alu_control_signal_var:std_logic:= '1'; --default setting to addition!
		variable m1_var:std_logic:= '0';variable m12_var:std_logic:= '0';variable m20_var:std_logic:= '0';variable m21_var:std_logic:= '0';
		variable m30_var:std_logic:= '0';variable m31_var:std_logic:= '0';
		variable m4_var:std_logic:= '0';
		variable m50_var:std_logic:= '0';variable m51_var:std_logic := '0';
		variable m60_var:std_logic:= '0';variable m61_var :std_logic:= '0';
		variable m70_var:std_logic:= '0';variable m71_var :std_logic:= '0';
		variable m8_var :std_logic:= '0';
		variable m90_var:std_logic:= '0';variable m91_var :std_logic:= '0';
		variable m100_var:std_logic:= '0';variable m101_var :std_logic:= '0';
		variable mz_var :std_logic:='0';	
		
		begin

		
			if(rising_edge(clk)) then
				t1_write_var  := '0';
				t2_write_var  := '0';
				t3_write_var  := '0';
				ir_write_var   := '0';
				pc_write_var  := '0';
				memory_write_var  := '0';
				rf_write_var   := '0';
				c_write_var  := '0';
				z_write_var  := '0';
				alu_control_signal_var  := '1'; --default setting to addition!
				m1_var  := '0';  m12_var  := '0';  m20_var  := '0';  m21_var  := '0';
				m30_var  := '0';  m31_var  := '0';
				m4_var  := '0';
				m50_var  := '0';  m51_var   := '0';
				m60_var  := '0';  m61_var   := '0';
				m70_var  := '0';  m71_var   := '0';
				m8_var   := '0';
				m90_var  := '0';  m91_var   := '0';
				m100_var  := '0';  m101_var   := '0';
				mz_var   :='0';	

				if(rst='1') then
					s_curr_var:="00000";
					s_next_var:="00000";
				end if;
				
				if(s_curr_var="00000") then
					ir_write_var:='1';
					m21_var:='0';
					m20_var:='1';
					if(opcode="1000") then
						s_next_var := "10000";
					elsif(opcode="1001") then
						s_next_var:="10000";
					elsif(opcode="0011") then
						s_next_var := "00110";
					else
						s_next_var:="00001";
	
					end if;
	
				elsif (s_curr_var="00001") then
					t1_write_var:='1';
					t2_write_var:='1';
					t3_write_var:='1';
					m4_var:='0';
					m8_var:='0';
					m71_var:='0';
					m70_var:='1';
					m61_var:='0';
					m60_var:='1';


					if(opcode = "0001") then
						s_next_var:="00100";
					elsif(opcode(3 downto 1) = "100") then
						s_next_var := "00111";
					elsif(opcode= "1100") then
						if(t1=t2) then
							s_next_var := "10001";
						else
							s_next_var := "10100";
						end if;
					elsif(opcode = "0000") then
						if(ir_1_0="00") then
							s_next_var := "00010";
						elsif(ir_1_0 = "10") then
							if(c='0') then
								s_next_var := "10100";
							else
								s_next_var := "00010";
							end if;
						else
							if(z='0') then
								s_next_var := "10100";
							else
								s_next_var := "00010";
							end if;
						end if;
					elsif(opcode = "0010") then
						if(ir_1_0="00") then
							s_next_var := "10101";
						elsif(ir_1_0 = "10") then
							if(c='0') then
								s_next_var := "10100";
							else
								s_next_var := "10101";
							end if;
						else
							if(z='0') then
								s_next_var := "10100";
							else
								s_next_var := "10101";
							end if;
						end if;
					elsif opcode = "0110" then
						s_next_var := "01011";
					else 
						--opcode is 0111
						s_next_var := "01101";
					end if;


				elsif(s_curr_var="00010") then
					t3_write_var:='1';
					c_write_var:='1';
					z_write_var:='1';
					m101_var:='1';
					m100_var:='0';
					m91_var:='1';
					m90_var:='0';
					m61_var:='1';
					m60_var:='0';
					mz_var:='0';
					s_next_var:= "00011";
				elsif(s_curr_var="00011") then
					rf_write_var:='1';
					m51_var:='1';
					m50_var:='1';
					m31_var:='1';
					m30_var:='0';
					s_next_var:="10100";
				elsif(s_curr_var="00100") then
					t3_write_var:='1';
					c_write_var:='1';
					z_write_var:='1';
					m101_var:='1';
					m100_var:='0';
					m91_var:='0';
					m90_var:='1';
					m61_var:='1';
					m60_var:='0';
					mz_var:='0';
					s_next_var:= "00101";
				elsif(s_curr_var="00101") then
					rf_write_var:='1';
					m51_var:='1';
					m50_var:='1';
					m31_var:='0';
					m30_var:='1';
					s_next_var:="10100";
				elsif(s_curr_var="00110") then
					rf_write_var:='1';
					m51_var:='0';
					m50_var:='1';
					m31_var:='0';
					m30_var:='0';
					s_next_var:="10100";
				elsif(s_curr_var="00111") then
					t2_write_var:='1';
					m101_var:='1';
					m100_var:='1';
					m91_var:='0';
					m90_var:='1';
					m71_var:='1';
					m70_var:='0';
					if opcode = "0100" then
						s_next_var:="01000";
					else
						s_next_var:="01001";
					end if ;
				elsif(s_curr_var="01000") then
					t3_write_var:='1';
					m21_var:='0';
					m20_var:='0';
					m61_var:='0';
					m60_var:='0';
					s_next_var:="01010";
				elsif(s_curr_var="01001") then
					memory_write_var:='1';
					m21_var:='0';
					m20_var:='0';
					m12_var:='0';
					s_next_var:="10100";
				elsif(s_curr_var="01010") then
					rf_write_var:='1';
					z_write_var:='1';
					m31_var:='0';
					m30_var:='0';
					m51_var:='1';
					m50_var:='1';
					mz_var:='1';
					s_next_var:="10100";
				elsif(s_curr_var="01011") then
					t2_write_var:='1';
					m21_var:='1';
					m20_var:='1';
					m71_var:='1';
					m70_var:='1';
					s_next_var:="01100";
				elsif(s_curr_var="01100") then
					rf_write_var:='1';
					t3_write_var:='1';
					m51_var:='1';
					m50_var:='0';
					m31_var:='1';
					m30_var:='1';
					m101_var:='0';
					m100_var:='0';
					m91_var:='1';
					m90_var:='1';
					m61_var:='1';
					m60_var:='0';
					s_next_var:="10011";
				elsif(s_curr_var="01101") then
					t3_write_var:='1';
					t2_write_var:='1';
					m101_var:='0';
					m100_var:='0';
					m91_var:='1';
					m90_var:='1';
					m61_var:='1';
					m60_var:='0';
					m4_var:='1';
					m71_var:='0';
					m70_var:='0';
					s_next_var:="01110";
				elsif(s_curr_var="01110") then
					t1_write_var:='1';
					m101_var:='1';
					m100_var:='0';
					m91_var:='1';
					m90_var:='1';
					m8_var:='1';
					m21_var:='1';
					m20_var:='1';
					m12_var:='1';
					memory_write_var:='1';
					if(t3(2 downto 0) = "000") then
						s_next_var:="10100";
					else
						s_next_var:="01101";
					end if;
				elsif(s_curr_var="01111") then
					pc_write_var:='1';
					m101_var:='0';
					m100_var:='1';
					m91_var:='0';
					m90_var:='0';
					m1_var:='0';
					s_next_var:="00000";
				elsif(s_curr_var="10000") then
					rf_write_var:='1';
					t2_write_var:='1';
					m31_var:='0';
					m30_var:='0';
					m51_var:='0';
					m50_var:='0';
					m71_var:='0';
					m70_var:='1';
					if opcode = "1000" then
						s_next_var:="01111";
					else
						s_next_var:="10010";
					end if ;
				elsif(s_curr_var="10001") then
					pc_write_var:='1';
					m101_var:='0';
					m100_var:='1';
					m91_var:='0';
					m90_var:='1';
					m1_var:='0';
					s_next_var:="00000";
				elsif(s_curr_var="10010") then
					pc_write_var:='1';
					m1_var:='1';
					s_next_var:="00000";
				elsif(s_curr_var="10011") then
					t1_write_var:='1';
					m101_var:='1';
					m100_var:='0';
					m91_var:='1';
					m90_var:='1';
					m8_var:='1';
					if(t3(2 downto 0)="111") then
						s_next_var:="10100";
					else
						s_next_var:="01011";
					end if;
				elsif(s_curr_var="10100") then
					pc_write_var:='1';
					m101_var:='0';
					m100_var:='1';
					m91_var:='1';
					m90_var:='1';
					m1_var:='0';
					s_next_var:="00000";
				else
					--here s_curr_var is "10101"=21 only
					t3_write_var:='1';
					alu_control_signal_var:='0'; --meaning go do nand now!
					z_write_var:='1';
					m101_var:='1';
					m100_var:='0';
					m91_var:='1';
					m90_var:='0';
					m61_var:='1';
					m60_var:='0';
					mz_var:='0';
					s_next_var:="00011";

				end if;
				
				s_curr_var:=s_next_var;
				t1_write  <= t1_write_var;
				t2_write  <= t2_write_var;
				t3_write   <= t3_write_var;
				ir_write    <= ir_write_var;
				pc_write   <= pc_write_var;
				memory_write   <= memory_write_var;
				rf_write    <= rf_write_var;
				c_write   <= c_write_var;
				z_write   <= z_write_var;
				alu_control_signal   <= alu_control_signal_var; 
				m1   <= m1_var;  m12   <= m12_var;  m20   <= m20_var;  m21   <= m21_var;
				m30   <= m30_var;  m31   <= m31_var;
				m4   <= m4_var;
				m50   <= m50_var;  m51    <= m51_var;
				m60   <= m60_var;  m61    <= m61_var;
				m70   <= m70_var;  m71    <= m71_var;
				m8    <= m8_var;
				m90   <= m90_var;  m91    <= m91_var;
				m100   <= m100_var;  m101    <= m101_var;
				mz    <=mz_var;

		end if;
	end process;
end architecture;