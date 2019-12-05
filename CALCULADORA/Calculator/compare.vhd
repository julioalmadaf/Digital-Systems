library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY compare IS
	PORT ( A_c, B_c: in std_logic_vector(7 downto 0);
				--CLK: in std_logic;
				B_c1: out std_logic_vector(7 downto 0);
				R_c: out std_logic
				);
end compare;

architecture rtl of compare is
signal Rc1: std_logic_vector(7 downto 0);
signal Rc2: std_logic_vector(7 downto 0);
signal c1: std_logic;
signal c2: std_logic;

component RESTA IS
	PORT (	Ar,Br: in STD_logic_vector(7 downto 0);
				Rr : out STD_logic_vector(7 downto 0);
				Co : out STD_LOGIC
			);
END component;

begin
Process(a_c)
begin
if (A_c(7 downto 0) > "00000000") then  -- (CLK'Event and CLK='1')
if ( A_c(7 downto 0) > B_c(7 downto 0) ) then
		R_c <= '0';
		B_c1(7 downto 0) <= Rc2(7 downto 0);
	elsif ((A_c(7 downto 0)= B_c(7 downto 0)) or  (A_c(7 downto 0) < B_c(7 downto 0))) then
		R_c <= '1';
		B_c1(7 downto 0) <= Rc1(7 downto 0);
	end if;		
else null;
end if;
end process;

elemento_1: resta port map(B_c(7 downto 0),A_c, Rc1, c1);
elemento_2: resta port map(B_c(7 downto 0),"00000000", Rc2, c2);

end rtl;
