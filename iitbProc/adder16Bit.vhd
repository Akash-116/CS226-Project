library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all; -- importing entities from this file

entity Full_Adder  is
  port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end Full_Adder;

architecture arc of Full_Adder is
    signal tC, tS, U, V: std_logic;

    begin
    -- component instances
    ha: Half_Adder port map (A => A, B => B, S => tS, C => tC);

    -- propagate carry.
    a1: AND_2 port map (A => tS, B => Cin, Y => V);
    o1: OR_2  port map (A => V, B => tC, Y => Cout);

    -- final sum.
    x1: XOR_2 port map (A => tS, B => Cin, Y => S);
end arc;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity adder16Bit is --Ripplecarry adder! Could have cascaded 2 koggestone adders too!
  port (
		in_a : in std_logic_vector (15 downto 0);
		in_b : in std_logic_vector (15 downto 0);
		sum : out std_logic_vector (16 downto 0)); -- 17bit !
end adder16Bit;

architecture arc of adder16Bit is

    signal tC: std_logic_vector(16 downto 0);
    
	component Full_Adder is 
		port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component Full_Adder;

    begin
		tC(0)<='0'; --input carry is 0

		add : for i in 15 downto 0 generate
			ax: full_Adder 
            port map(A => in_a(i), B => in_b(i), Cin => tC(i), S => sum(i), Cout => tC(i+1));
		end generate add;

		sum(16) <= tC(16);

end arc;