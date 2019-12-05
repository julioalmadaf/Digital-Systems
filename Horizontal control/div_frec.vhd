library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY div_frec IS
PORT(CLK: in std_logic;
     CLK_Prima: out std_logic);    
 END div_frec;

architecture RTL of div_frec is
	signal ciclos: std_logic;
begin

Process(CLK)
begin
if(rising_edge(CLK)) then 

	if(ciclos < '1')then
		CLK_Prima <= '0';
		ciclos <= '1';
	else
		CLK_Prima <= '1';
		ciclos <= '0';
	end if;
else null;	
end if;

end process;       
END RTL;

