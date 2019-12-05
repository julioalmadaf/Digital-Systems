library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_horizontal is
port(	  clk: in std_logic;
	  CV: in integer range 0 to 525:=0;
	  PSH: out std_logic;
	  R,G,B: out std_logic_vector(9 downto 0));
end control_horizontal;

architecture RTL of control_horizontal is
signal cuenta_horizontal: integer range 0 to 793:=0;

begin
process(clk)
begin
if(rising_edge(clk))then 
	if(cuenta_horizontal<793) then
		cuenta_horizontal<=cuenta_horizontal+1;
	else
		cuenta_horizontal<=0;
	end if;
	if (cuenta_horizontal<95) then
		PSH<='0';
	else
		PSH<='1';
	end if;
else null;
end if;
end process;

process(cuenta_horizontal)
begin
if((CV>35) and (CV<515) and(cuenta_horizontal>143)and (cuenta_horizontal<778)) then --seccion no  visible
	
if((cuenta_horizontal MOD 20 = 0) or (CV MOD 20=0)) then
			R<="1111111111";																			--cuadro rojo
			G<="0000000000";
			B<="0000000000";
			else
			R<="1111111111";																			--cuadro rojo
			G<="1111111111";
			B<="1111111111";
			
	end if;
	
else																--seccion no visible
			R<="0000000000";
			G<="0000000000";
			B<="0000000000";
end if;
end process;
end RTL;

		