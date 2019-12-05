library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_unSIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY CONTROL IS
	PORT (	A_v, P_v, S_v : in STD_logic_vector(16 downto 0);
			CLK: in std_LOGIC;
				B_v, a_vv,s_vv, p_vv : out STD_logic_vector(16 downto 0)
			);
END CONTROL;
	
ARCHITECTURE RTL OF CONTROL IS
BEGIN
PROCESS(CLK)-- (P_v)
begin
if  (CLK'Event and CLK = '1') then--(P_v(16 downto 0)>"00000000000000000")
		a_vv <= A_v;
		s_vv <= s_v;
		p_vv<= p_v;
		if (P_v(1 downto 0)="01") then		
		B_v(16 downto 0)<= A_v(16 downto 0);
		end if;
	if (P_v(1 downto 0)="10") then
		B_v(16 downto 0)<= S_v(16 downto 0);
		end if;
	if(P_v(1 downto 0)="00") then
		B_v(16 downto 0)<= "00000000000000000";
		end if;
	if(P_v(1 downto 0)="11")then
		B_v(16 downto 0)<= "00000000000000000";
		end if;
	else null;
	end if;
end process;
end rtl;