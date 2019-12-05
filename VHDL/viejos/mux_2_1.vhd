library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_2_1 IS
PORT(A,B, SEL: in std_logic;
     Z: OUT STD_LOGIC);    
 END MUX_2_1;

architecture RTL of MUX_2_1 is

begin

process(SEL)				-- Se ejecuta cuando SEL cambia de estado
begin

	if (SEL = '0')then
		Z <= A; 			-- Z toma el valor de A
	elsif (SEL = '1')then
		Z <= B;				-- Z toma el valor de B
	else
		NULL;				-- NOP
	end if;
	
END PROCESS;
                   
END RTL;


