library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY RESTA IS
	PORT (	Ar,Br: in STD_logic_vector(7 downto 0);
				Rr : out STD_logic_vector(7 downto 0);
				Co : out STD_LOGIC
			);
END RESTA;
	
ARCHITECTURE RTL OF RESTA IS

COMPONENT fullad IS
	PORT(	AFA,BFA,CIFA : in STD_LOGIC;
	       SFA,COFA : out STD_LOGIC 
			);  
END COMPONENT;


signal Co_1: std_logic;
signal Co_2: std_logic;
signal Co_3: std_logic;
signal Co_4: std_logic;
signal Co_5: std_logic;
signal Co_6: std_logic;
signal Co_7: std_logic;
signal Bb_1: std_logic;
signal Bb_2: std_logic;
signal Bb_3: std_logic;
signal Bb_4: std_logic;
signal Bb_5: std_logic;
signal Bb_6: std_logic;
signal Bb_7: std_logic;
signal Bb_8: std_logic;



begin


elemento_1: fullad port map(Ar(0),NOT Br(0),'1',Rr(0),Co_1);
elemento_2: fullad port map(Ar(1),NOT Br(1),Co_1,Rr(1),Co_2);
elemento_3: fullad port map(Ar(2),NOT Br(2),Co_2,Rr(2),Co_3);
elemento_4: fullad port map(Ar(3),NOT Br(3),Co_3,Rr(3),Co_4);
elemento_5: fullad port map(Ar(4),NOT Br(4),Co_4,Rr(4),Co_5);
elemento_6: fullad port map(Ar(5),NOT Br(5),Co_5,Rr(5),Co_6);
elemento_7: fullad port map(Ar(6),NOT Br(6),Co_6,Rr(6),Co_7);
elemento_8: fullad port map(Ar(7),NOT Br(7),Co_7,Rr(7),Co);




end RTL;

