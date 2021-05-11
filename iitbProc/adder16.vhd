library work;
use work.Gates.all;

library ieee;
use ieee.std_logic_1164.all;

--Ripplecarry adder! Could have cascaded 2 koggestone adders too! But gone ahead with this
entity adder16 is 
	port (a : in std_logic_vector (15 downto 0);
			b : in std_logic_vector (15 downto 0);	
			sum : out std_logic_vector (16 downto 0)); -- 17bit !
end adder16;

architecture arc of adder16 is
	component FullAdder is 
		port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component FullAdder;

	signal tSum: std_logic_vector(16 downto 0);
    
	begin
		tSum(0)<='0'; --input carry is 0

		add : for i in 15 downto 0 generate
			ax: FullAdder 
			port map(A => a(i), B => b(i), Cin => tSum(i), S => sum(i), Cout => tSum(i+1));
		end generate add;

		sum(16) <= tSum(16);

end arc;
-- =================================================================

library work;
use work.Gates.all; -- importing entities from this file

library ieee;
use ieee.std_logic_1164.all;

entity FullAdder  is
	port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end FullAdder;

architecture arc of FullAdder is
    signal tC, tS, U, V: std_logic;

	begin
		-- component instances
		ha: HalfAdder port map (A => A, B => B, S => tS, C => tC);

		-- propagate carry.
		a1: AndGate port map (A => tS, B => Cin, C => V);
		o1: OrGate  port map (A => V, B => tC, C => Cout);

		-- final sum.
		x1: XorGate port map (A => tS, B => Cin, C => S);
end arc;
-- =================================================================
