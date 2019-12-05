library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CA IS
	PORT (	CLKIN: in std_logic;
				R: out std_logic_vector(9 downto 0);
				G: out std_logic_vector(9 downto 0);
				B: out std_logic_vector(9 downto 0);
				VGACLK: out std_logic;
				PSHLV1: out std_logic;
				PSV: out std_logic;
				BLANK: out std_logic;
				SYNC: out std_logic
			);
END CA;
	
ARCHITECTURE RTL OF CA IS

COMPONENT control_horizontal IS
	PORT (	clk: in std_logic;
				CV: in integer range 0 to 525:=0;
				PSH: out std_logic;
				R: out std_logic_vector(9 downto 0);
				G: out std_logic_vector(9 downto 0);
				B: out std_logic_vector(9 downto 0)
			);
END COMPONENT;

COMPONENT control_vertical is
	PORT ( 
		PSH: in std_logic;
		CV: out integer range 0 to 525:=0;
		PSV: out std_logic
	);
END COMPONENT;

COMPONENT div_frec is 
	PORT (	CLK: in std_logic;
				CLK_Prima: out std_logic
			);
END COMPONENT;

signal CLKLV: std_logic;
signal PSHLV2: std_logic;
signal CVLV1: integer range 0 to 525:=0;


begin

elemento_1: div_frec port map(CLKIN, CLKLV);
elemento_2: control_horizontal port map (clkLV, CVLV1, PSHLV2,R(9 downto 0),G(9 downto 0),B(9 downto 0));
elemento_3: control_vertical port map (PSHLV2, CVLV1, PSV);
PSHLV1 <= PSHLV2;
VGACLK <= CLKLV;
BLANK <= '1'; 
SYNC <= '0';


end RTL;