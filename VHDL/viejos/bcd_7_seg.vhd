library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BCD_7_SEG IS
PORT(CLK: in std_logic;
     SAL: out std_logic_vector(3 downto 0));    
 END BCD_7_SEG;

architecture RTL of BCD_7_SEG is
	signal BCD: std_logic_vector(3 downto 0); 
begin

Process(CLK)
begin

if(CLK'Event and CLK = '1')then
	if(BCD < "1001")then
		BCD <= BCD + '1';
	else
		BCD <= "0000";
	end if;
	SAL <= BCD;
else null;	
end if;

end process;       
END RTL;

