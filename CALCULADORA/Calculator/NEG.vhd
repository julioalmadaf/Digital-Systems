library IEEE;
use IEEE.std_logic_1164.all;

entity NEG is
	port ( BFA, CON: in STD_LOGIC;
	       BB: out STD_LOGIC );
end NEG;

architecture RTL of NEG is
begin
process(CON)
begin
	if (CON = '1') then 
		BB <= NOT BFA;
	else 
		BB <= BFA;
	end if;
	end process;
end RTL;


