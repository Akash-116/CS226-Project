library work;
use work.MuxReg.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity iitb_proc is 
	port (clk, reset : in std_logic;
			Out_proc : out std_logic_vector(15 downto 0);
			Done : out std_logic);
end entity;

architecture Form of iitb_proc is 

	component RegFile is 
		port (	RF_A1, RF_A2, RF_A3: in std_logic_vector(2 downto 0); --3 bits used to address 8 values
				RF_D3: in std_logic_vector(15 downto 0); 
				wr, clk: in std_logic;
				RF_D1, RF_D2: out std_logic_vector(15 downto 0));
	end component;
	component ALU is 
			port (A,B :in std_logic_vector(15 downto 0) ;
					op : in std_logic;
					C : out std_logic_vector(15 downto 0);
					Z, Cout: out std_logic);
	end component;
	component Memory is
			port (ain, datain: in std_logic_vector(15 downto 0); 
					clk, wr: in std_logic;
					dataout: out std_logic_vector(15 downto 0));	
	end component;
	component FSM is 
			port (instruction,T1,T2,T3,mem: in std_logic_vector(15 downto 0); r, clk,init_carry,init_zero: in std_logic;
			 	 w1,w2,w3,w4,w5,w6,w7,
			   	 m1,m20,m21,m30,m31,m4,m50,m51,m60,m61,m70,m71,m8,m90,m91,m100,m101,mz,
				 wc, wz,done,ALUcont,m12 : out std_logic);
	end component;
	
	signal tm4out, tm3out: std_logic_vector(2 downto 0);
	
	signal tm1out, tpcout, tt2out, tALUc, tt1out, tm2out,tmemout, tirout, tt3out,
			Imm9e16, tm5out, tD1out, tD2out, tm8out, tm7out, tm12out, tm6out, seImm9, seImm6,
			tALUb, tALUa: std_logic_vector(15 downto 0);

	signal tw1, tw2, tw3, tw4, tw7, tw6, tw5, tm1, tm21, tm20, tm4, tm30, tm31, tm50, tm51, tm8, tm70, tm71,
			tm61, tm60, tm91, tm90, tm100, tm101, tm12, tZout, tCout, twc, tCrout, 
			tt3zero, tmz, tmzout, twz,tZrout, tALUcon: std_logic;

	signal temp1: std_logic_vector(9 downto 0);

	signal temp2: std_logic_vector(6 downto 0);
	-- zero 16bit
	constant Zero16 :  std_logic_vector(15 downto 0) := (others => '0');
	-- one 16bit
	constant One16 : std_logic_vector(15 downto 0) := (0 => '1', others => '0');

	begin

		-- PC instantiation
		m1 : Mux16_2_1 port map(A => tALUc, B => tt2out, S0 => tm1, y => tm1out);

		PC : Reg16 port map(Reg_datain => tm1out, clk => clk, wr => tw1, Reg_dataout => tpcout);
		-----------------------------------------------------------------------------------------------
		-- Memory instantiation
		m12 : Mux16_2_1 port map(A => tt1out, B => tt2out, S0 => tm12, y => tm12out);

		m2 : Mux16_4_1 port map(A => tt2out, B => tpcout, C => tALUc, D => tt1out, S1 => tm21, S0 => tm20, y => tm2out);

		Mem1 : Memory 
		port map(ain => tm2out, datain => tm12out, dataout => tmemout, clk => clk, wr => tw2);
		-----------------------------------------------------------------------------------------------
		-- Instruction Register instantiation
		IR : Reg16 port map(Reg_datain => tmemout, clk => clk, wr => tw3, Reg_dataout => tirout);
		-----------------------------------------------------------------------------------------------
		-- Register file instantiation
		m3 : Mux3_4_1 port map(A => tirout(11 downto 9), B => tirout(8 downto 6), C => tirout(5 downto 3), 
					D => tt3out(2 downto 0),S1 => tm31, S0 => tm30, y => tm3out);

		m4 : Mux3_2_1 port map(A => tirout(11 downto 9), B => tt3out(2 downto 0), S0 => tm4, y => tm4out);

		--  -- preparing for m5
		Imm9e16 <= tirout(8 downto 0) & "0000000"; -- for LHI command

		temp1 <= (others => tirout(5));
		seImm6 <= temp1 & tirout(5 downto 0); -- Sign Extension

		temp2 <= (others => tirout(8));
		seImm9 <= temp2 & tirout(8 downto 0); -- Sign Extension
		
		m5 : Mux16_4_1 port map(A => tpcout, B => Imm9e16, C => tt2out, D => tt3out,
		S1 => tm51, S0 => tm50,y => tm5out);

		Rf : RegFile 
		port map(RF_A1 => tm4out, RF_A2 => tirout(8 downto 6), RF_A3 => tm3out,
				RF_D3 => tm5out, clk => clk, wr => tw4, RF_D1 => tD1out, RF_D2 => tD2out);

		------------------------------------------------------------------------------------------------
		-- Temporary Registers Instantiation
		m6 : Mux16_4_1 port map(A => tmemout, B => Zero16, C => tALUc, D => Zero16, S1 => tm61, S0 => tm60, y => tm6out);
		T3 : Reg16 port map(Reg_datain => tm6out, clk => clk, wr => tw5, Reg_dataout => tt3out);
		
		m7 : Mux16_4_1 port map(A => tD1out, B => tD2out, C => tALUc, D => tmemout, S0 => tm70, S1 => tm71, y => tm7out);
		T2 : Reg16 port map(Reg_datain => tm7out, clk => clk, wr => tw6, Reg_dataout => tt2out); 
		
		m8 : Mux16_2_1 port map(A => tD1out, B => tALUc, S0 => tm8, y => tm8out);
		T1 : Reg16 port map(Reg_datain => tm8out, clk => clk, wr => tw7, Reg_dataout => tt1out);
		---------------------------------------------------------------------------------------------------
		-- ALU Instantiation
		m9 : Mux16_4_1 port map(A =>seImm9 , B => seImm6, C => tt2out, D => One16, S1 => tm91, S0 => tm90, y => tALUb);
		m10: Mux16_4_1 port map(A => tt3out, B => tpcout, C => tt1out, D => tt2out, S1 => tm101, S0 => tm100, y => tALUa);

		ALU1 : ALU port map(A => tALUa, B => tALUb, C => tALUc, op => tALUcon, Z => tZout, Cout => tCout);
		-------------------------------------------------------------------------------------------------------
		-- Resigter to store C
		C : Reg1 port map(Reg_datain => tCout, clk => clk, wr => twc, Reg_dataout => tCrout);
		----------------------------------------------------------------------------------------------------
		-- Register to store Z

		-- -- preparing for Z
		tt3zero <= not(tt3out(0) or tt3out(1) or tt3out(2) or tt3out(3) or tt3out(4) or tt3out(5) or tt3out(6) or tt3out(7) or tt3out(8)
					or tt3out(9) or tt3out(10) or tt3out(11) or tt3out(12) or tt3out(13) or tt3out(14) or tt3out(15));

		-- -- Z stores output of ALU or T1. Hence the mux
		mz : Mux1_2_1 port map(A => tZout, B => tt3zero, S0 => tmz, y => tmzout);
							
		Z : Reg1 port map(Reg_datain => tmzout, clk => clk, wr => twz, Reg_dataout => tZrout);
		------------------------------------------------------------------------------------------------------
		-- Finally instantiating the Controller
		fsm1 : FSM 
		port map(instruction => tirout, T1 => tt1out, T2 => tt2out, T3 => tt3out, r => reset, clk => clk, -- small discrepancy in ttiout and tmiout
				init_carry => tCrout, init_zero => tZrout, --Cr is register for C, Zr is register for Z
				w1 => tw1, w2 => tw2, w3 => tw3, w4 => tw4, w5 => tw5, w6 => tw6, w7 => tw7,
				m1 => tm1, m20 => tm20, m21 => tm21, m30 => tm30, m31 => tm31, m4 => tm4, m50 => tm50,
				m51 => tm51,
				m8 => tm8, m70 => tm70, m71 => tm71, m61 => tm61, m60 => tm60, m91 => tm91, m90 => tm90, 
				m100 => tm100, m101 => tm101, mz => tmz, wc => twc,
				wz => twz, done => Done, ALUcont =>  tALUcon, mem => tmemout, m12 => tm12);								


		Out_proc <= tmemout;

	
end Form;