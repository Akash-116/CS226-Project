library work;
use work.Gates.all;

library ieee;
use ieee.std_logic_1164.all;

entity nandVec is 
    port (A ,B : in std_logic_vector(15 downto 0);
          C: out std_logic_vector(15 downto 0));
end entity;

architecture Struct of nandVec is 

    begin 
        tnandvec : for i in 0 to 15 generate
            C(i) <= NOT((A(i) and B(i)));
        end generate tnandvec;
        
end Struct;