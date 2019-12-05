library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY MULTIPLICADOR IS
	PORT (	A, B : in STD_logic_vector(7 downto 0);
				CLK: in std_LOGIC;
				S: out STD_logic_vector(15 downto 0)
			);
END MULTIPLICADOR;

	
ARCHITECTURE RTL OF MULTIPLICADOR IS

COMPONENT RESULTADO IS
	PORT (	S_o : in STD_logic_vector(16 downto 0);
				clk: in std_LOGIC;
				S_f: out STD_logic_vector(15 downto 0)
			);
END COMPONENT;

COMPONENT SUM17 IS
	PORT (	Av,Pv,Sv: in STD_logic_vector(16 downto 0);
				clk : in std_LOGIC;
				SFA, avv, svv: out STD_logic_vector(16 downto 0)
			);
END COMPONENT;

COMPONENT GEN is
	port ( A_g, B_g: in STD_LOGIC_vector(7 downto 0);
			CLK: in std_logic;
	       Av, Pv,Sv: out STD_LOGIC_vector(16 downto 0) 
			 );
			 
END COMPONENT;

-- Cables de resultado de suma 
signal SFA_0: std_LOGIC_VECTOR(16 downto 0);
signal SFA_1: std_LOGIC_VECTOR(16 downto 0);
signal SFA_2: std_logic_vector (16 downto 0);
signal SFA_3: std_LOGIC_VECTOR(16 downto 0);
signal SFA_4: std_LOGIC_VECTOR(16 downto 0);
signal SFA_5: std_LOGIC_VECTOR(16 downto 0);
signal SFA_6: std_LOGIC_VECTOR(16 downto 0);
signal SFA_7: std_LOGIC_VECTOR(16 downto 0);
signal SFA_8: std_LOGIC_VECTOR(16 downto 0);
--cables de resultado gen (LOS VECTORES GENERADOS)
signal A_v: std_LOGIC_VECTOR(16 downto 0);
signal S_v: std_LOGIC_VECTOR(16 downto 0);
signal P_v: std_LOGIC_VECTOR(16 downto 0);
--cables a y s
signal c_a1: std_LOGIC_VECTOR(16 downto 0);
signal c_a2: std_LOGIC_VECTOR(16 downto 0);
signal c_a3: std_LOGIC_VECTOR(16 downto 0);
signal c_a4: std_LOGIC_VECTOR(16 downto 0);
signal c_a5: std_LOGIC_VECTOR(16 downto 0);
signal c_a6: std_LOGIC_VECTOR(16 downto 0);
signal c_a7: std_LOGIC_VECTOR(16 downto 0);
signal c_a8: std_LOGIC_VECTOR(16 downto 0);

signal c_s1: std_LOGIC_VECTOR(16 downto 0);
signal c_s2: std_LOGIC_VECTOR(16 downto 0);
signal c_s3: std_LOGIC_VECTOR(16 downto 0);
signal c_s4: std_LOGIC_VECTOR(16 downto 0);
signal c_s5: std_LOGIC_VECTOR(16 downto 0);
signal c_s6: std_LOGIC_VECTOR(16 downto 0);
signal c_s7: std_LOGIC_VECTOR(16 downto 0);
signal c_s8: std_LOGIC_VECTOR(16 downto 0);


begin
--process(clk)
--begin
--if(CLK'Event and CLK = '1')then
--	S <= sfa_8(16 downto 1);
--else null;
--end if;
--end process;

-- genero vectores
elemento_1: GEN port map(A(7 downto 0),B(7 downto 0),CLK,A_v(16 downto 0), P_v(16 downto 0), S_v(16 downto 0));
--1a suma
elemento_2: SUM17 port map(A_v(16 downto 0), P_v(16 downto 0), S_v(16 downto 0), clk, SFA_1, c_a1, c_s1);
--2a suma
elemento_3: SUM17 port map( c_a1(16 downto 0), SFA_1(16 downto 0), c_s1(16 downto 0), clk, SFA_2,c_a2, c_s2);
--3a suma
elemento_4: SUM17 port map( c_a2(16 downto 0), SFA_2(16 downto 0), c_s2(16 downto 0),clk, SFA_3, c_a3, c_s3);
elemento_5: SUM17 port map( c_a3(16 downto 0), SFA_3(16 downto 0), c_s3(16 downto 0), clk, SFA_4, c_a4, c_s4);
elemento_6: SUM17 port map( c_a4(16 downto 0), SFA_4(16 downto 0), c_s4(16 downto 0), clk, SFA_5, c_a5, c_s5);
elemento_7: SUM17 port map( c_a5(16 downto 0), SFA_5(16 downto 0), c_s5(16 downto 0), clk, SFA_6, c_a6, c_s6);
elemento_8: SUM17 port map( c_a6(16 downto 0), SFA_6(16 downto 0), c_s6(16 downto 0), clk, SFA_7, c_a7, c_s7);
elemento_9: SUM17 port map( c_a7(16 downto 0), SFA_7(16 downto 0), c_s7(16 downto 0), clk, sfa_8, c_a8, c_s8);
elemento_10: RESUltado port map(Sfa_8, clk, S);


end RTL;


