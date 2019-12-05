library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY RESULTADO IS
	PORT (	S_o : in STD_logic_vector(16 downto 0);
				clk: in std_logic;
				S_f: out STD_logic_vector(15 downto 0)
			);
END RESULTADO;
	
ARCHITECTURE RTL OF RESULTADO IS
begin
process(CLK)
begin
if (CLK' Event and Clk='1') then
S_f <= S_o(16 downto 1);
else null;
end if;
end process;
end rtl;
