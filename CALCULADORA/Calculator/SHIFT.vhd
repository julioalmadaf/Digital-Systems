library IEEE;
use IEEE.std_logic_1164.all;
entity SHIFT is
	port ( A: in STD_LOGIC_VECTOR(16 downto 0);
			clk: in std_logic;
	       S: out STD_LOGIC_VECTOR(16 downto 0));
end SHIFT;
architecture RTL of SHIFT is
begin
PROCESS(CLK)
begin
if(CLK'Event and CLK = '1') then
	S <= A(16)& A(16 downto 1);
	else null;
	end if;
end process;
	end RTL;