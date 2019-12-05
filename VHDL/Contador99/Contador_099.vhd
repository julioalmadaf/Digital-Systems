library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador_099 is
port (	CLK_DE2: in std_logic;
			sentido: in std_logic;
		Z_7SEG1: out std_logic_vector(6 downto 0);
		Z_7SEG2: out std_logic_vector(6 downto 0)
		);
end Contador_099;
	
architecture RTL of Contador_099 is
component div_frec IS
PORT(CLK: in std_logic;
     CLK_Prima: out std_logic);  
END component;
 
component BCD_asc_desc_09 IS
PORT(clk: in std_logic;
		sentido: in std_logic;
     carry: out std_logic; 
		unidades: out std_logic_vector(3 downto 0)
		);
END component;

component BCD_asc_desc_099 IS
PORT(carry: in std_logic;
		sentido: in std_logic;
		decenas: out std_logic_vector(3 downto 0)
		);    
END component;

component siete_seg IS
PORT(A: in std_logic_vector(3 downto 0);
     X: out std_logic_vector(6 downto 0));  -- abcdefg   
END component;



signal CLK_cable: std_logic;
signal carry_cable: std_logic;
signal unidades_cable: std_logic_vector(3 downto 0);
signal decenas_cable: std_logic_vector(3 downto 0);

begin

elemento_1: div_frec port map(CLK_DE2,CLK_cable);
elemento_2: BCD_asc_desc_09 port map(CLK_cable, sentido, carry_cable, unidades_cable);
elemento_3: siete_seg port map(unidades_cable,Z_7SEG1);
elemento_4: BCD_asc_desc_099 port map(carry_cable, sentido, decenas_cable);
elemento_5: siete_seg port map(decenas_cable,Z_7SEG2);
end RTL;

