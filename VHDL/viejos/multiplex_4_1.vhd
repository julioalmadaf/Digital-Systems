library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY multiplex_4_1 IS
PORT(A: in std_logic_vector(4 downto 1); -- mas significativo el de hasta la izquierda
     SEL: in std_logic_vector(2 downto 1);
     Z: out std_logic);    
 END multiplex_4_1;

architecture RTL of multiplex_4_1 is

begin

Process(SEL)
begin

case (SEL) is

when "00"		=>	Z <= A(1);

when "01"		=>	Z <= A(2);

when "10"		=>	Z <= A(3);

when "11"		=>	Z <= A(4);

when others 	=> null;

end case;

end process;       
END RTL;

