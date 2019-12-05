library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY tc IS
	PORT ( D :in std_logic_vector(7 downto 0);
				--CLK: in std_logic;
				D2: out std_logic_vector(7 downto 0)
				);
end tc;

architecture rtl of tc is
signal d_d : std_logic_vector(7 downto 0);
signal d_2: std_logic_vector(7 downto 0);
begin
process(D)
begin
if(D(7) ='1') then
--if(D(7)='1') then
	d_d <= NOT D(7) & NOT D(6)& NOT D(5) & NOT D(4) & NOT D(3) & NOT D(2) & NOT D(1) & NOT D(0);
	D2 <= d_d + "00000001";
else
	D2 <= D;
end if;
end process;
end rtl;