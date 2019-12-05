library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PSH_Block IS
PORT(CLK: in std_logic;
     PSH: out std_logic;  
	  PosHor: out std_logic_vector(9 downto 0));
	  
 END PSH_Block;

architecture RTL of PSH_Block is
	signal auxPos: std_logic_vector(9 downto 0);
begin

Process(CLK)
begin
if(rising_edge(CLK)) then
		
	if (auxPos<"1100011001") then
		auxPos<= auxPos+'1';
	else
		 auxPos<="0000000000";
	end if;
	
	if(auxPos<"0001011111") then
		PSH<='0';
	else
		PSH<='1';
	end if;
	
	PosHor<=auxPos;
else null;
end if;

end process;       
END RTL;

