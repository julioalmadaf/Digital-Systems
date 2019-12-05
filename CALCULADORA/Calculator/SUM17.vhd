library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY SUM17 IS
	PORT (	Av,Pv,Sv: in STD_logic_vector(16 downto 0);
				CLK: in std_LOGIC;
				SFA, avv, svv : out STD_logic_vector(16 downto 0)
			);
END SUM17;
	
ARCHITECTURE RTL OF SUM17 IS

COMPONENT fullad IS
	PORT(	AFA,BFA,CIFA : in STD_LOGIC;
	       SFA,COFA : out STD_LOGIC 
			);  
END COMPONENT;

COMPONENT CONTROL IS 
	PORT (A_v, P_v, S_v : in STD_logic_vector(16 downto 0);
			CLK: in std_LOGIC;
			B_v,a_vv,s_vv, p_vv: out STD_logic_vector(16 downto 0));
END COMPONENT;


signal Co_1: std_logic;
signal Co_2: std_logic;
signal Co_3: std_logic;
signal Co_4: std_logic;
signal Co_5: std_logic;
signal Co_6: std_logic;
signal Co_7: std_logic;
signal Co_8: std_logic;
signal Co_9: std_logic;
signal Co_10: std_logic;
signal Co_11: std_logic;
signal Co_12: std_logic;
signal Co_13: std_logic;
signal Co_14: std_logic;
signal Co_15: std_logic;
signal Co_16: std_logic;
signal Co_17: std_logic;
-- Cables de resultado de suma 
signal S: std_logic_vector (16 downto 0);

--Cable de control 
signal BFA:std_logic_vector (16 downto 0);
signal cable_A:std_logic_vector (16 downto 0);
signal cable_s:std_logic_vector (16 downto 0);
signal cable_p:std_logic_vector (16 downto 0);

begin

process(clk)
begin
if(CLK'Event and CLK = '1')then
	SFA <= S(16) & s(16 downto 1);
	avv <= cable_a;
	svv<= cable_s;
else null;
end if;
end process;

elemento_19: CONTROL port map(Av(16 downto 0), Pv(16 downto 0), Sv(16 downto 0), clk, BFA(16 downto 0), cable_a, cable_S, cable_p);
-- FULL ADDER
elemento_1: fullad port map(cable_p(0),BFA(0),'0',S(0),Co_1);
elemento_2: fullad port map(cable_p(1),BFA(1),Co_1,S(1),Co_2);
elemento_3: fullad port map(cable_p(2),BFA(2),Co_2,S(2),Co_3);
elemento_4: fullad port map(cable_p(3),BFA(3),Co_3,S(3),Co_4);
elemento_5: fullad port map(cable_p(4),BFA(4),Co_4,S(4),Co_5);
elemento_6: fullad port map(cable_p(5),BFA(5),Co_5,S(5),Co_6);
elemento_7: fullad port map(cable_p(6),BFA(6),Co_6,S(6),Co_7);
elemento_8: fullad port map(cable_p(7),BFA(7),Co_7,S(7),Co_8);
elemento_9: fullad port map(cable_p(8),BFA(8),Co_8,S(8),Co_9);
elemento_10: fullad port map(cable_p(9),BFA(9),Co_9,S(9),Co_10);
elemento_11: fullad port map(cable_p(10),BFA(10),Co_10,S(10),Co_11);
elemento_12: fullad port map(cable_p(11),BFA(11),Co_11,S(11),Co_12);
elemento_13: fullad port map(cable_p(12),BFA(12),Co_12,S(12),Co_13);
elemento_14: fullad port map(cable_p(13),BFA(13),Co_13,S(13),Co_14);
elemento_15: fullad port map(cable_p(14),BFA(14),Co_14,S(14),Co_15);
elemento_16: fullad port map(cable_p(15),BFA(15),Co_15,S(15),Co_16);
elemento_17: fullad port map(cable_p(16),BFA(16),Co_16,S(16),Co_17);

end RTL;