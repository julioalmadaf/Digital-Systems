library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_horizontal is
port(clk: in std_logic;
	  CV: in integer range 0 to 525:=0;
	  PSH: out std_logic;
	  R,G,B: out std_logic_vector(9 downto 0));
end control_horizontal;

architecture RTL of control_horizontal is
signal cuenta_horizontal: integer range 0 to 793:=0;

begin
process(clk)
begin
if(rising_edge(clk))then 
	if((cuenta_horizontal<793)or(cuenta_horizontal=793)) then
		cuenta_horizontal<=cuenta_horizontal+1;
	else
		cuenta_horizontal<=0;
	end if;
else null;
end if;
end process;


process(cuenta_horizontal)

begin
if (cuenta_horizontal<95) then
	PSH<='0';
else
	PSH<='1';
end if;
end process;


process(CV)
begin
if((CV>35)or(CV<515))then
	--if ((cuenta_horizontal<143) OR (cuenta_horizontal>778)) then  --A, B y D
		--R<="0000000000";
		--G<="0000000000";
		--B<="0000000000";
	--else
		if((cuenta_horizontal>451) and (cuenta_horizontal<471)) then --C
			R<="0000000000";
			G<="1111111111";
			B<="0000000000";
		else 
			R<="0000000000";
			G<="0000000000";
			B<="0000000000";
	--end if;
	end if;
else
		R<="0000000000";
		G<="0000000000";
		B<="0000000000";
end if;
end process;
end RTL;

		