library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador_ITE is
port (	CLK_DE2: in std_logic;
		Z_7SEG: out std_logic_vector(7 downto 1));
end Contador_ITE;
	
architecture RTL of Contador_ITE is

component div_frec IS
PORT(CLK: in std_logic;
     CLK_Prima: out std_logic);  
END component;
 
component BCD_7_SEG IS
PORT(CLK: in std_logic;
     SAL: out std_logic_vector(3 downto 0));    
END component;

component siete_seg IS
PORT(A: in std_logic_vector(3 downto 0);
     X: out std_logic_vector(7 downto 1));  -- abcdefg   
END component;

signal CLK_cable: std_logic;
signal BCD_cable: std_logic_vector(3 downto 0);

begin

elemento_1: div_frec port map(CLK_DE2,CLK_cable);
elemento_2: BCD_7_SEG port map(CLK_cable,BCD_cable);
elemento_3: siete_seg port map(BCD_cable,Z_7SEG);

end RTL;