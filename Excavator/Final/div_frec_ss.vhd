library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY div_frec_ss IS
PORT(CLK,SW1: in std_logic;
     CLK_Prima: out std_logic);    
 END div_frec_ss;
architecture RTL of div_frec_ss is
	signal ciclos: std_logic_vector(19 downto 0); 
	--signal extra: std_logic_vector(19 downto 0):="00000101011111100100"; 50mhz
	signal extra, delay, delay2: std_logic_vector(19 downto 0):="00000011100001011110";		--28mhz

begin
Process(CLK)
begin

if(CLK'Event and CLK = '1')then
	if (SW1 = '0') then				--el boton funciona al reves
	
	if(extra>"00000000000000000000") then
		if(delay2<"00000000101110111000") then 
			delay2<= delay2 +'1';
		else
				delay2<="00000000000000000000";
				if(extra > "00000011100001011110")then --- 2/20M 57720 - 180 	
			extra<=extra-'1';
		end if;
		end if;
		if(ciclos < extra)then --- 0.45M/20 : "0000100111000100000"
			CLK_Prima <= '1';
			ciclos <= ciclos + '1';
		
		--elsif (ciclos <= "11110100001001000000")then --  1 M
		elsif (ciclos <= "10001100111010110000")then --  577200
			CLK_Prima <= '0';
			ciclos <= ciclos + '1';
		else 
			CLK_Prima <= '0';
			ciclos <= "00000000000000000000";
		end if;
 
		else -----switch arriba 
			if(ciclos < extra)then --- 0.45M/20 : "0000100111000100000"
			CLK_Prima <= '1';
			ciclos <= ciclos + '1';
		
		--elsif (ciclos <= "11110100001001000000")then --  1 M
		  elsif (ciclos <= "10001100111010110000")then --  577200
			CLK_Prima <= '0';
			ciclos <= ciclos + '1';
		else 
			CLK_Prima <= '0';
			ciclos <= "00000000000000000000";
		end if;
	end if;	
-----------------------------------------------------------	
	else -- boton presionado
		--if(extra < "00011000011010100000")then --- 2/20 M - 180
		if(delay<"00000000101110111000") then 
			delay<= delay +'1';
		else
				delay<= "00000000000000000000";
			if(extra < "00001000110011101011")then --- 90	
				extra<=extra+'1';
			end if;	
			end if;
			
		
		if(ciclos < extra)then --- 0.45M/20 : "0000100111000100000"
			CLK_Prima <= '1';
			ciclos <= ciclos + '1';
		
		--elsif (ciclos <= "11110100001001000000")then --  1 M
		elsif (ciclos <= "10001100111010110000")then --  577200
			CLK_Prima <= '0';
			ciclos <= ciclos + '1';
		else 
			CLK_Prima <= '0';
			ciclos <= "00000000000000000000";
		end if;
	end if; 

else null; 
end if;

end process;       
END RTL;