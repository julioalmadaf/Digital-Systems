library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY sum8 IS
	PORT (	AFA,BFA : in STD_logic_vector(7 downto 0);
				Con : in STD_LOGIC;
				SFA : out STD_logic_vector(7 downto 0);
				COFA : out STD_LOGIC
			);
END sum8;
	
ARCHITECTURE RTL OF sum8 IS

COMPONENT fullad IS
	PORT(	AFA,BFA,CIFA : in STD_LOGIC;
	       SFA,COFA : out STD_LOGIC 
			);  
END COMPONENT;

COMPONENT NEG IS
	PORT(BFA, CON: in STD_LOGIC;
	       BB: out STD_LOGIC
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


elemento_1: fullad port map(AFA(0),Bb_1,Con,SFA(0),Co_1);
elemento_2: fullad port map(AFA(1),Bb_2,Co_1,SFA(1),Co_2);
elemento_3: fullad port map(AFA(2),Bb_3,Co_2,SFA(2),Co_3);
elemento_4: fullad port map(AFA(3),Bb_4,Co_3,SFA(3),Co_4);
elemento_5: fullad port map(AFA(4),Bb_5,Co_4,SFA(4),Co_5);
elemento_6: fullad port map(AFA(5),Bb_6,Co_5,SFA(5),Co_6);
elemento_7: fullad port map(AFA(6),Bb_7,Co_6,SFA(6),Co_7);
elemento_8: fullad port map(AFA(7),Bb_8,Co_7,SFA(7),COFA);
elemento_9: NEG port map (BFA(0), Con, Bb_1);
elemento_10: NEG port map (BFA(1), Con, Bb_2);
elemento_11: NEG port map (BFA(2), Con, Bb_3);
elemento_12: NEG port map (BFA(3), Con, Bb_4);
elemento_13: NEG port map (BFA(4), Con, Bb_5);
elemento_14: NEG port map (BFA(5), Con, Bb_6);
elemento_15: NEG port map (BFA(6), Con, Bb_7);
elemento_16: NEG port map (BFA(7), Con, Bb_8);


end RTL;

