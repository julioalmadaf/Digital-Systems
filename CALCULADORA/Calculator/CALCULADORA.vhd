library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_bit.ALL;

ENTITY CALCULADORA IS
	PORT (	A, B : in STD_logic_vector(7 downto 0);
				CTRL: in STD_logic_vector (3 downto 0);
				CLK: in std_LOGIC;
				R16: out STD_logic_vector(15 downto 0);
				R8: out STD_logic_vector (7 downto 0)
				
			);
END CALCULADORA;
	
ARCHITECTURE RTL OF CALCULADORA IS

COMPONENT division IS
	PORT ( divisor, dividendo: in std_logic_vector(7 downto 0);
				CLK: in std_logic;
				Resultado_final: out std_logic_vector(7 downto 0)
				);
END COMPONENT;

COMPONENT MULTIPLICADOR IS
	PORT (	A, B : in STD_logic_vector(7 downto 0);
				CLK: in std_LOGIC;
				S: out STD_logic_vector(15 downto 0)
			);
END COMPONENT;

COMPONENT COMPUERTAS is
	PORT ( A1,B1: in std_logic_vector(7 downto 0);
				SR: in std_logic_vector(3 downto 0);
				CLK: in std_logic; 
	       ResC: out std_logic_vector(7 downto 0));

END COMPONENT;

COMPONENT sum8 is 
	PORT (	AFA,BFA : in STD_logic_vector(7 downto 0);
				Con : in STD_LOGIC;
				SFA : out STD_logic_vector(7 downto 0);
				COFA : out STD_LOGIC
			);
END COMPONENT;



-- RESULTADOS 

-- Multiplicación
signal res_multi: std_logic_vector (15 downto 0);
-- División
signal res_div: std_logic_vector (7 downto 0);
-- Compuertas 
signal res_comp: std_logic_vector (7 downto 0);
-- Sumador 
signal res_sum8: std_logic_vector (7 downto 0);
signal cout_sum8: std_logic;


begin
process(clk)
begin
if(CLK'Event and CLK = '1')then
	if (CTRL = "0000" or CTRL = "0001") then 
		R8 <= res_sum8(7 downto 0); 
		R16 <= "0000000000000000";
	elsif (CTRL = "0010") then 
		R16 <= res_multi(15 downto 0);
		R8 <= "00000000";
	elsif(CTRL = "0011") then 
		R8 <= res_div(7 downto 0);
		R16 <= "0000000000000000";
	elsif(CTRL = "0100" or CTRL = "0101" or CTRL = "0110" or CTRL = "0111" or CTRL = "1000" or CTRL = "1001") then 
		R8 <= res_comp(7 downto 0);
		R16 <= "0000000000000000";
	else null;
	end if;
	else null; 
	end if;
end process;

elemento_1: MULTIPLICADOR port map(A(7 downto 0), B(7 downto 0),CLK, res_multi(15 downto 0));
elemento_2: division port map (B(7 downto 0), A(7 downto 0), CLK, res_div (7 downto 0));
elemento_3: COMPUERTAS port map (A(7 downto 0), B (7 downto 0), CTRL (3 downto 0), CLK, res_comp(7 downto 0));
elemento_4: sum8 port map (A (7 downto 0), B (7 downto 0), CTRL (0), res_sum8(7 downto 0), cout_sum8);




end RTL;

