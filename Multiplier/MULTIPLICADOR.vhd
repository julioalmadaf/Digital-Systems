library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;
ENTITY MULTIPLICADOR IS
	PORT (	A, B : in STD_logic_vector(7 downto 0);
				CLK: in std_LOGIC;
				S: out STD_logic_vector(16 downto 0)
			);
END MULTIPLICADOR;
	
ARCHITECTURE RTL OF MULTIPLICADOR IS

COMPONENT SUM17 IS
	PORT(	AFA,BFA : in STD_LOGIC_VECTOR(16 DOWNTO 0);
	       SFA: out STD_LOGIC_vector(16 downto 0) 
			);  
END COMPONENT;

COMPONENT CONTROL IS
	PORT(	Av, Pv, Sv : in STD_logic_vector(16 downto 0);
				CLK: in std_LOGIC;
				B_v: out STD_logic_vector(16 downto 0)
			);
END COMPONENT;


COMPONENT SHIFT IS
	PORT(	A : in STD_LOGIC_VECTOR (16 downto 0);
	      S: out STD_LOGIC_VECTOR (16 downto 0)
			);  
END COMPONENT;

COMPONENT GEN is
	port ( A,B: in STD_LOGIC_vector(7 downto 0);
			CLK: in std_logic;
	       Av, Pv,Sv: out STD_LOGIC_vector(16 downto 0) 
			 );
END COMPONENT;

-- Cables de resultado de suma 
signal S_0: std_LOGIC_VECTOR(16 downto 0);
signal S_1: std_LOGIC_VECTOR(16 downto 0);
signal S_2: std_logic_vector (16 downto 0);
signal S_3: std_LOGIC_VECTOR(16 downto 0);
signal S_4: std_LOGIC_VECTOR(16 downto 0);
signal S_5: std_LOGIC_VECTOR(16 downto 0);
signal S_6: std_LOGIC_VECTOR(16 downto 0);
signal S_7: std_LOGIC_VECTOR(16 downto 0);
signal S_8: std_LOGIC_VECTOR(16 downto 0);
signal S_9: std_LOGIC_VECTOR(16 downto 0);
signal S_10: std_LOGIC_VECTOR(16 downto 0);
signal S_11: std_LOGIC_VECTOR(16 downto 0);
signal S_12: std_LOGIC_VECTOR(16 downto 0);
signal S_13: std_LOGIC_VECTOR(16 downto 0);
signal S_14: std_LOGIC_VECTOR(16 downto 0);

--cables de resultado gen (LOS VECTORES GENERADOS)
signal A_v: std_LOGIC_VECTOR(16 downto 0);
signal S_v: std_LOGIC_VECTOR(16 downto 0);
signal P_v: std_LOGIC_VECTOR(16 downto 0);
-- es una variable que ocupara el lugar de la entrada de B al sum17 
signal B_0: std_LOGIC_VECTOR(16 downto 0);
signal B_1: std_LOGIC_VECTOR(16 downto 0);
signal B_2: std_LOGIC_VECTOR(16 downto 0);
signal B_3: std_LOGIC_VECTOR(16 downto 0);
signal B_4: std_LOGIC_VECTOR(16 downto 0);
signal B_5: std_LOGIC_VECTOR(16 downto 0);
signal B_6: std_LOGIC_VECTOR(16 downto 0);
signal B_7: std_LOGIC_VECTOR(16 downto 0);

begin
-- genero vectores
elemento_1: GEN port map(A(7 downto 0),B(7 downto 0),CLK,A_v(16 downto 0), P_v(16 downto 0), S_v(16 downto 0));
--1a suma
elemento_2: CONTROL port map(A_v(16 downto 0), P_v(16 downto 0), S_v(16 downto 0), CLK, B_0(16 downto 0));
elemento_3: SUM17 port map(P_v(16 downto 0), B_0(16 downto 0), S_0(16 downto 0));
elemento_4: SHIFT port map(S_0(16 downto 0), S_1(16 downto 0)); --1a iteracion
--2a suma

elemento_5: CONTROL port map(A_v(16 downto 0), S_1(16 downto 0), S_v(16 downto 0), CLK, B_1(16 downto 0));
elemento_6: SUM17 port map( S_1(16 downto 0), B_1(16 downto 0), S_2(16 downto 0));
elemento_7: SHIFT port map(S_2(16 downto 0), S_3(16 downto 0)); --2a iteracion
--3a suma
elemento_8: CONTROL port map(A_v(16 downto 0), S_3(16 downto 0), S_v(16 downto 0), CLK, B_2(16 downto 0));
elemento_9: SUM17 port map( S_3(16 downto 0), B_2(16 downto 0), S_4(16 downto 0));
elemento_10: SHIFT port map(S_4(16 downto 0), S_5(16 downto 0)); --3a iteracion
--4a suma
elemento_11: CONTROL port map(A_v(16 downto 0), S_5(16 downto 0), S_v(16 downto 0), CLK, B_3(16 downto 0));
elemento_12: SUM17 port map( S_5(16 downto 0), B_3(16 downto 0), S_6(16 downto 0));
elemento_13: SHIFT port map(S_6(16 downto 0), S_7(16 downto 0)); --4a iteracion
--5a suma
elemento_14: CONTROL port map(A_v(16 downto 0), S_7(16 downto 0), S_v(16 downto 0), CLK, B_4(16 downto 0));
elemento_15: SUM17 port map( S_7(16 downto 0), B_4(16 downto 0), S_8(16 downto 0));
elemento_16: SHIFT port map(S_8(16 downto 0), S_9(16 downto 0)); --5a iteracion
--6a suma
elemento_17: CONTROL port map(A_v(16 downto 0), S_9(16 downto 0), S_v(16 downto 0), CLK, B_5(16 downto 0));
elemento_18: SUM17 port map( S_9(16 downto 0), B_5(16 downto 0), S_10(16 downto 0));
elemento_19: SHIFT port map(S_10(16 downto 0), S_11(16 downto 0)); --6a iteracion
--7a suma
elemento_20: CONTROL port map(A_v(16 downto 0), S_11(16 downto 0), S_v(16 downto 0), CLK, B_6(16 downto 0));
elemento_21: SUM17 port map( S_11(16 downto 0), B_6(16 downto 0), S_12(16 downto 0));
elemento_22: SHIFT port map(S_12(16 downto 0), S_13(16 downto 0)); --7a iteracion
--8a suma
elemento_23: CONTROL port map(A_v(16 downto 0), S_13(16 downto 0), S_v(16 downto 0), CLK, B_7(16 downto 0));
elemento_24: SUM17 port map( S_13(16 downto 0), B_7(16 downto 0), S_14(16 downto 0));
elemento_25: SHIFT port map(S_14(16 downto 0), S(16 downto 0)); --8a iteracion cortar bit


end RTL;

