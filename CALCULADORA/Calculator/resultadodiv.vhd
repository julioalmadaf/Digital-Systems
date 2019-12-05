library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY resultadodiv IS
	PORT ( D_1, d_2, res1 :in std_logic_vector(7 downto 0);
				--CLK: in std_logic;
				res_final: out std_logic_vector(7 downto 0)
				);
end resultadodiv;

architecture rtl of resultadodiv is
signal d_d2 : std_logic_vector(7 downto 0);
begin
process(D_1)
begin
--if (d_1 = "00000000") then
	--res_final <= "00000000";
	--else null;
	--end if;
if(D_1(7) ='1' Xor D_2(7) ='1' ) then
	d_d2 <= NOT res1(7) & NOT res1(6)& NOT res1(5) & NOT res1(4) & NOT res1(3) & NOT res1(2) & NOT res1(1) & NOT res1(0);
	res_final <= d_d2 + "00000001";
else
	res_final <= res1;
end if;
end process;
end rtl;