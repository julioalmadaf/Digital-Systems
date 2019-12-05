library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PSV_Block IS
PORT(CLK: in std_logic;
     PSV: out std_logic;  
	  PosVer: out std_logic_vector(9 downto 0));
	  
 END PSV_Block;

architecture RTL of PSV_Block is
	signal auxPos: std_logic_vector(9 downto 0);
begin

Process(CLK)
begin
if(rising_edge(CLK)) then
	if (auxPos<"1000001101") then
		auxPos<= auxPos+'1';
	else
		 auxPos<="0000000000";
	end if;
	
	if(auxPos<"0000000010") then
		PSV<='0';
	else
		PSV<='1';
	end if;
	
	PosVer<= auxPos;
else null;
end if;

end process;       
END RTL;

