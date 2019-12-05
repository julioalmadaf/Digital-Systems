library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Reloj is
port (	CLK_DE2: in std_logic;
			SW: in std_logic;
			butt1: in std_logic;
			butt2: in std_logic;

		Z_7SEG1: out std_logic_vector(6 downto 0);
		Z_7SEG2: out std_logic_vector(6 downto 0);
		
		Z_7SEG3: out std_logic_vector(6 downto 0);
		Z_7SEG4: out std_logic_vector(6 downto 0);
		
		Z_7SEG5: out std_logic_vector(6 downto 0);
		Z_7SEG6: out std_logic_vector(6 downto 0)
		
		);
end Reloj;
	
architecture RTL of Reloj is
component div_frec IS
PORT(CLK: in std_logic;
		SW: in std_logic;
     CLK_Prima: out std_logic
	  );  
END component;
 
component BCD_uni IS
PORT(clk: in std_logic;
		unidades: out std_logic_vector(3 downto 0);
		carry: out std_logic
		);
END component;

component BCD_dec IS
PORT(carry: in std_logic;
		carrys: out std_logic;
		decenas: out std_logic_vector(3 downto 0)
		);    
END component;

component siete_seg IS
PORT(A: in std_logic_vector(3 downto 0);
     X: out std_logic_vector(6 downto 0));  -- abcdefg   
END component;

component BCD_uni_hora IS
PORT(
		clk		 : in	std_logic;
		unidades	 : out	std_logic_vector(3 downto 0);
		carry		 : out	std_logic
		);
END component;

component BCD_dec_horas IS
PORT(
		clk		 : in	std_logic;
		decenas	 : out	std_logic_vector(3 downto 0)
		);
END component;



signal CLK_cable: std_logic;

signal carry_cable_seg: std_logic;
signal carrys_cable_seg: std_logic;
signal unidades_cable: std_logic_vector(3 downto 0);
signal decenas_cable: std_logic_vector(3 downto 0);

signal carry_cable_min: std_logic;
signal carrys_cable_min: std_logic;
signal unidades_cable_min: std_logic_vector(3 downto 0);
signal decenas_cable_min: std_logic_vector(3 downto 0);

signal carry_cable_hora: std_logic;
signal unidades_cable_hora: std_logic_vector(3 downto 0);
signal decenas_cable_hora: std_logic_vector(3 downto 0);

begin

elemento_1: div_frec port map(CLK_DE2,SW,CLK_cable);

elemento_2: BCD_uni port map(CLK_cable, unidades_cable, carry_cable_seg);
elemento_3: siete_seg port map(unidades_cable,Z_7SEG1);
elemento_4: BCD_dec port map(carry_cable_seg,carrys_cable_seg, decenas_cable);
elemento_5: siete_seg port map(decenas_cable,Z_7SEG2);

elemento_6: BCD_uni port map(carrys_cable_seg xnor butt1, unidades_cable_min, carry_cable_min);
elemento_7: siete_seg port map(unidades_cable_min,Z_7SEG3);
elemento_8: BCD_dec port map(carry_cable_min, carrys_cable_min,decenas_cable_min);
elemento_9: siete_seg port map(decenas_cable_min,Z_7SEG4);


elemento_10: BCD_uni_hora port map(carrys_cable_min xnor butt2, unidades_cable_hora, carry_cable_hora);
elemento_11: siete_seg port map(unidades_cable_hora,Z_7SEG5);
elemento_12: BCD_dec_horas port map(carry_cable_hora, decenas_cable_hora);
elemento_13: siete_seg port map(decenas_cable_hora,Z_7SEG6);

end RTL;

