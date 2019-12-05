library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_1164.all;
entity GEN is
	port ( A_g,B_g: in STD_LOGIC_vector(7 downto 0);
			CLK: in std_logic;
	       Av, Pv,Sv: out STD_LOGIC_vector(16 downto 0) 
			 );

end GEN;

architecture RTL of GEN is

COMPONENT fullad IS
	PORT(	AFA,BFA,CIFA : in STD_LOGIC;
	       SFA,COFA : out STD_LOGIC 
			);  
END COMPONENT;


signal A_comp: std_logic_vector(7 downto 0);
signal Co_1: std_logic;
signal Co_2: std_logic;
signal Co_3: std_logic;
signal Co_4: std_logic;
signal Co_5: std_logic;
signal Co_6: std_logic;
signal Co_7: std_logic;
signal Co_8: std_logic;

begin	
elemento_1: fullad port map(NOT A_g(0),'1','0', A_comp(0),Co_1);
elemento_2: fullad port map(NOT A_g(1),'0',Co_1,A_comp(1),Co_2);
elemento_3: fullad port map(NOT A_g(2),'0',Co_2,A_comp(2),Co_3);
elemento_4: fullad port map(NOT A_g(3),'0',Co_3,A_comp(3),Co_4);
elemento_5: fullad port map(NOT A_g(4),'0',Co_4,A_comp(4),Co_5);
elemento_6: fullad port map(NOT A_g(5),'0',Co_5,A_comp(5),Co_6);
elemento_7: fullad port map(NOT A_g(6),'0',Co_6,A_comp(6),Co_7);
elemento_8: fullad port map(NOT A_g(7),'0',Co_7,A_comp(7),Co_8);

	Process(CLK)
begin

if(CLK'Event and CLK = '1')then
		Av <= A_g(7 downto 0) & "000000000";
		Sv <=  A_comp(7 downto 0) & "000000000";
		Pv <= "00000000" & B_g(7 downto 0) & "0";
end if;

end process;      
end RTL;


