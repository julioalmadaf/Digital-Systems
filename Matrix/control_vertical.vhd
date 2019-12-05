library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_vertical is
port(PSH: in std_logic;
	  CV: out integer range 0 to 525:=0;
	  PSV: out std_logic);
end control_vertical;

architecture RTL of control_vertical is
signal cuenta_vertical: integer range 0 to 525:= 0;

begin
process(PSH)
begin
if(rising_edge(PSH))then 
	if((cuenta_vertical<525)or(cuenta_vertical=525)) then
		cuenta_vertical<=cuenta_vertical+1;
	else
		cuenta_vertical<=0;
	end if;
	if (cuenta_vertical<2) then
		PSV<='0';	
	else
		PSV<='1';
	end if;
	CV<=cuenta_vertical;
else null;
end if;
end process;


end RTL;