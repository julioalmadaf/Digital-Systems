library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_unSIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY CONTROL IS
	PORT (	Av, Pv, Sv : in STD_logic_vector(16 downto 0);
				CLK: in std_LOGIC;
				B_v: out STD_logic_vector(16 downto 0)
			);
END CONTROL;
	
ARCHITECTURE RTL OF CONTROL IS
BEGIN
PROCESS(CLK)
begin
if(CLK'Event and CLK = '1') then
	if (Pv(1 downto 0)="01") then		--1a seleccion
		B_v(16 downto 0)<= Av(16 downto 0);
		elsif (Pv(1 downto 0)="10") then
		B_v(16 downto 0)<= Sv(16 downto 0);
		else 
		B_v(16 downto 0)<= "00000000000000000";
		end if;
	else null;
	end if;
end process;
end rtl;