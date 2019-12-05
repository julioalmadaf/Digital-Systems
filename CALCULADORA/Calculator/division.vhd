library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY division IS
	PORT ( divisor, dividendo: in std_logic_vector(7 downto 0);
				CLK: in std_logic;
				Resultado_final: out std_logic_vector(7 downto 0)
				);
end division;

architecture rtl of division is
component compare IS
	PORT ( A_c, B_c: in std_logic_vector(7 downto 0);
			-- CLK: in std_logic;
				B_c1: out std_logic_vector(7 downto 0);
				R_c: out std_logic
				);
end component;

component resultadodiv IS
	PORT ( D_1, d_2, res1 :in std_logic_vector(7 downto 0);
				--CLK: in std_logic;
				res_final: out std_logic_vector(7 downto 0)
				);
end component;

component tc IS
	PORT ( D :in std_logic_vector(7 downto 0);
				--CLK: in std_logic;
				D2: out std_logic_vector(7 downto 0)
				);
end component;
signal Bc1:  std_logic_vector(7 downto 0);
signal bc2:  std_logic_vector(7 downto 0);
signal bc3:  std_logic_vector(7 downto 0);
signal bc4:  std_logic_vector(7 downto 0);
signal bc5:  std_logic_vector(7 downto 0);
signal bc6:  std_logic_vector(7 downto 0);
signal bc7:  std_logic_vector(7 downto 0);
signal bc8:  std_logic_vector(7 downto 0);
signal dividendo_d: std_logic_vector(7 downto 0);
signal divisor_d:  std_logic_vector(7 downto 0);
signal res:  std_logic_vector(7 downto 0);

begin

elemento_9: tc port map(dividendo, dividendo_d);
elemento_10: tc port map(divisor, divisor_d);

elemento_1: compare port map(divisor_d, "0000000" & dividendo_d(7), bc1, res(7));
elemento_2: compare port map(divisor_d, "000000" & bc1(0) & dividendo_d(6) ,bc2, res(6));
elemento_3: compare port map(divisor_d, bc2(6 downto 0) & dividendo_d(5), bc3, res(5));
elemento_4: compare port map(divisor_d, bc3(6 downto 0) & dividendo_d(4), bc4, res(4));
elemento_5: compare port map(divisor_d, bc4(6 downto 0) & dividendo_d(3),bc5, res(3));
elemento_6: compare port map(divisor_d, bc5(6 downto 0) & dividendo_d(2), bc6, res(2));
elemento_7: compare port map(divisor_d, bc6(6 downto 0) & dividendo_d(1), bc7, res(1));
elemento_8: compare port map(divisor_d,  bc7(6 downto 0) & dividendo_d(0), bc8, res(0));

elemento_11: resultadodiv port map(divisor, dividendo, res, resultado_final);
end rtl;

