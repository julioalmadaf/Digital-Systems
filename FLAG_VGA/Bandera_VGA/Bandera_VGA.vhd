library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Bandera_VGA is
port (CLK_DE2: in std_logic;
		PSH: out std_logic;
		PSV: out std_logic;
		Blank: out std_logic;
		Sync: out std_logic;
		Clock_VGA: out std_logic;
		R: out std_logic_vector(9 downto 0);
		G: out std_logic_vector(9 downto 0);
		B: out std_logic_vector(9 downto 0));
end Bandera_VGA;
	
architecture RTL of Bandera_VGA is

component div_frec is
PORT(CLK: in std_logic;
     CLK_Prima: out std_logic);  
END component;
 
component PSH_Block is
PORT(CLK: in std_logic;
     PSH: out std_logic;  
	  PosHor: out std_logic_vector(9 downto 0));
END component;

component PSV_Block is
PORT(CLK: in std_logic;
     PSV: out std_logic;  
	  PosVer: out std_logic_vector(9 downto 0));
END component;

component Bandera is
PORT(CLK: in std_logic;
	  CLK2: in std_logic;
	  PosHor: in std_logic_vector(9 downto 0);  
	  PosVer: in std_logic_vector(9 downto 0);
	  R:out std_logic_vector(9 downto 0);
	  G:out std_logic_vector(9 downto 0);
	  B:out std_logic_vector(9 downto 0));
END component;


signal CLK_cable: std_logic;
signal PosHor_cable: std_logic_vector(9 downto 0);
signal PosVer_cable: std_logic_vector(9 downto 0);
signal PSH_cable: std_logic;

begin
PSH<=PSH_cable;
Blank<='1';
Sync<='0';
Clock_VGA<=CLK_cable;

elemento_1: div_frec port map(CLK_DE2,CLK_cable);
elemento_2: PSH_Block port map(CLK_cable,PSH_cable,PosHor_cable);
elemento_3: PSV_Block port map(PSH_cable,PSV,PosVer_cable );
elemento_4: Bandera port map(CLK_cable,PSH_cable,PosHor_cable,PosVer_Cable,R,G,B);



end RTL;