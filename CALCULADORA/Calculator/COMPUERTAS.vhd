library IEEE;
use IEEE.std_logic_1164.all;

entity COMPUERTAS is
	port ( A1,B1: in std_logic_vector(7 downto 0);
				SR: in std_logic_vector(3 downto 0);
				CLK: in std_logic; 
	       ResC: out std_logic_vector(7 downto 0));

end COMPUERTAS;

architecture RTL of COMPUERTAS is
begin
Process (Clk)
begin 
	if (Clk'Event and Clk = '1') then 
	
		if (SR = "0100") then 
			ResC <= A1 or B1;
		end if;
		if (SR = "0101") then 
			ResC <= A1 and B1;
		end if;
		if (SR = "0110") then 
			ResC <= A1 nand B1;
		end if;
		if (SR = "0111") then 
			ResC <= A1 nor B1; 
		end if;
		if (SR = "1000")then 
			ResC <= A1 xor B1; 
		end if;
		if (SR = "1001") then 
			ResC <= A1 XNOR B1; 
		end if;
	else null;
	end if; 
end process;	 
end RTL;


