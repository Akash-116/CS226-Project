library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;
 
entity ALU is 
port (A,B :in std_logic_vector(15 downto 0) ;
		op : in std_logic;
		C : out std_logic_vector(15 downto 0);
		Z, Cout: out std_logic);
end ALU;


architecture arc of ALU is 

    component adder16 is
    port (  a : in std_logic_vector (15 downto 0);
            b : in std_logic_vector (15 downto 0);
            sum : out std_logic_vector (16 downto 0));
    end component adder16;

    component nandVec is 
        port (A ,B : in std_logic_vector(15 downto 0);
				C: out std_logic_vector(15 downto 0));
    end component nandVec;

    signal t1, t2, t3, t4 : std_logic_vector(15 downto 0); 
    signal t5, t6 : std_logic ;

    begin 
		-- t1 is sum, t5 is carry_out
        c1: adder16 port map (a => A, b => B, sum(15 downto 0) => t1, sum(16) => t5);

        -- t2 is nand
        c2: nandVec port map (A,B,t2);

        -- t3 is a vector with every element equaling op
        t3 <= (others => op); -- op is saved in every bit of t3 vector

        -- if op = 1, then return nand, if op = 0, return add
        t4 <= ((not t3) and t1) or (t3 and t2); -- inline mux

        -- passing the value to output port 
        C <= t4;
        
        -- Cout is set to 0 if operation is nand, other wise set to t5
        Cout <= t5 and not op;

        -- t6 is for zero flag
        t6 <= NOT(t4(0) or t4(1) or t4(2) or t4(3) or t4(4) 
            or t4(5) or t4(6) or t4(7) or t4(8) or t4(9) or 
            t4(10) or t4(11) or t4(12) or t4(13) or t4(14) or t4(15));

        -- zero flag is set equal to t6
        Z <= t6;

end arc;