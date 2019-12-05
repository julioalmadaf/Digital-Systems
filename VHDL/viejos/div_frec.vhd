library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY div_frec IS
PORT(CLK: in std_logic;
     CLK_Prima: out std_logic);    
 END div_frec;

architecture RTL of div_frec is
	signal ciclos: std_logic_vector(4 downto 1);
	--signal ciclos: std_logic_vector(24 downto 1); 
begin

Process(CLK)
begin

if(CLK'Event and CLK = '1')then
	if(ciclos < "1001")then
	--if(ciclos < "101101110001101100000000")then	
		CLK_Prima <= '0';
		ciclos <= ciclos + '1';
	else
		CLK_Prima <= '1';
		--ciclos <= "000000000000000000000000";
		ciclos <= "0000";
	end if;
else null;	
end if;

end process;       
END RTL;

