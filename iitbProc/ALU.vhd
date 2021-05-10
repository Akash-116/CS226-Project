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

    component adder16Bit is
    port (
            in_a : in std_logic_vector (15 downto 0);
            in_b : in std_logic_vector (15 downto 0);
            sum : out std_logic_vector (16 downto 0));
    end component adder16Bit;

    component nandVec is 
        port (A ,B : in std_logic_vector(15 downto 0);
                C: out std_logic_vector(15 downto 0));
    end component nandVec;

    signal t1, t2, t3, t7 : std_logic_vector(15 downto 0); 
    signal t4, t6:std_logic ;

    begin 
        c1: adder16Bit port map (in_a => A, in_b=>B,sum(15 downto 0) => t1 ,sum(16) => t4);
        -- t1 is sum, t4 is carry_out
        c2: nandVec port map (A,B,t2);
        -- t2 is nand

        -- t3 is a vector with everyelement equaling op
        t3 <= (others => op); -- op is saved in every bit of t3 vector

        -- if op = 1, then return nand, if op = 0, return add
        t7 <= ((not t3) and t1) or (t3 and t2); -- inline mux

        -- passing the value to output port 
        C <= t7;
        
        -- Cout is set to 0 if operation is nand, other wise set to t4
        Cout <= t4 and not op;

        -- t6 is for zero flag
        t6 <= NOT(t7(0) or t7(1) or t7(2) or t7(3) or t7(4) 
            or t7(5) or t7(6) or t7(7) or t7(8) or t7(9) or 
            t7(10) or t7(11) or t7(12) or t7(13) or t7(14) or t7(15));

        -- zero flag is set equal to t6
        Z <= t6;

end arc;