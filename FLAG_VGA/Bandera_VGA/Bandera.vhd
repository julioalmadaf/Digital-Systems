library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Bandera IS
PORT(CLK: in std_logic;
	  CLK2: in std_logic;
	  PosHor: in std_logic_vector(9 downto 0);  
	  PosVer: in std_logic_vector(9 downto 0);
	  R:out std_logic_vector(9 downto 0);
	  G:out std_logic_vector(9 downto 0);
	  B:out std_logic_vector(9 downto 0));
	  
 END Bandera;

architecture RTL of Bandera is
	
	signal a1i,a1f,a2i,a2f: std_logic_vector(9 downto 0);
	signal r1i,r1f,r2i,r2f: std_logic_vector(9 downto 0);
	signal count: std_logic_vector(9 downto 0);

begin
Process(CLK)
begin
if (rising_edge(CLK)) then
	--Area Visible	
	if(posHor>"0010001111" and posHor<"1100001010" and posVer>"0000100011" and posVer<"1000000011")then
	--Azul
	if((posHor>"0010001111" and posHor<"1100001010" and posVer>"0000100011" and posVer<"0100101100" and PosHor<a2f)
	or (posHor>"0010001111" and posHor<"1100001010" and posVer>"0011001000" and posVer<"1000000011" and PosHor<a2i)) then
					R<="0000000000";
					G<="0000000000";
					B<="1111111111";
	else
					R<="1111111111";
					G<="1111111111";
					B<="1111111111";
			
	end if;	
	else
	
		R<="0000000000";
		G<="0000000000";
		B<="0000000000";
	end if;
	

else null;
end if;
end process;   

process(CLK2)
begin
if (rising_edge(CLK2))then
if(posVer>"0000100011" and posVer<"1000000011")then
				a1f<=a1f+"00000001";
				a2f<=a1f+"0010001111";

else 
a1f<="0000000000"; 
end if; 
else null;
end if;
end process;


 
END RTL;
