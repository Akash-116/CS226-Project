library ieee;
use ieee.std_logic_1164.all;

package Gates is
  component NotGate is
   port (A: in std_logic; B: out std_logic);
  end component NotGate;

  component AndGate is
   port (A, B: in std_logic; C: out std_logic);
  end component AndGate;

  component NandGate is
   port (A, B: in std_logic; C: out std_logic);
  end component NandGate;

  component OrGate is
   port (A, B: in std_logic; C: out std_logic);
  end component OrGate;

  component NorGate is
   port (A, B: in std_logic; C: out std_logic);
  end component NorGate;

  component XorGate is
   port (A, B: in std_logic; C: out std_logic);
  end component XorGate;

  component HalfAdder is
   port (A, B: in std_logic; S, C: out std_logic);
  end component HalfAdder;

end package Gates;

-- ----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity NotGate is
   port (A: in std_logic; B: out std_logic);
end entity NotGate;

architecture arc of NotGate is
begin
   B <= not A;
end arc;
  
-- ----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity AndGate is
   port (A, B: in std_logic; C: out std_logic);
end entity AndGate;

architecture arc of AndGate is
begin
   C <= A and B;
end arc;
  -- ----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity NandGate is
   port (A, B: in std_logic; C: out std_logic);
end entity NandGate;

architecture arc of NandGate is
begin
   C <= not (A and B);
end arc;
  -- ----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity OrGate is
   port (A, B: in std_logic; C: out std_logic);
end entity OrGate;

architecture arc of OrGate is
begin
   C <= A or B;
end arc;
  -- ----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity NorGate is
   port (A, B: in std_logic; C: out std_logic);
end entity NorGate;

architecture arc of NorGate is
begin
   C <= not (A or B);
end arc;
  
-- ----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity XorGate is
   port (A, B: in std_logic; C: out std_logic);
end entity XorGate;

architecture arc of XorGate is
begin
   C <= A xor B;
end arc;
  -- ----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity HalfAdder is
   port (A, B: in std_logic; S, C: out std_logic);
end entity HalfAdder;

architecture arc of HalfAdder is
begin
   S <= (A xor B);
   C <= (A and B);
end arc;
  
-- ----------------------------------------------------------------------------------
