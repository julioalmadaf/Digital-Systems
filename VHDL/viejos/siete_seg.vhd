library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY siete_seg IS
PORT(A: in std_logic_vector(3 downto 0);
     X: out std_logic_vector(7 downto 1));  -- abcdefg   
 END siete_seg;

architecture RTL of siete_seg is

begin

Process(A)
begin

case (A) is

when "0000"	=>	X <= "0000001";
when "0001"	=>	X <= "1001111";
when "0010"	=>	X <= "0010010";
when "0011" =>	X <= "0000110";
when "0100" =>	X <= "1001100";
when "0101"	=>	X <= "0100100";
when "0110" =>	X <= "0100000";
when "0111" =>	X <= "0001111";
when "1000" =>  X <= "0000000";
when "1001" =>  X <= "0000100";
when others =>  X <= "1111110";

end case;

end process;       
END RTL;

