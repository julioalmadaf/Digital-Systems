
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity BCD_uni_hora is

	port
	(
		clk		 : in	std_logic;
		unidades	 : out	std_logic_vector(3 downto 0);
		carry		 : out	std_logic
	);

end entity;

architecture RTL of BCD_uni_hora is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
	signal counter: std_logic_vector (1 downto 0);
	signal state : state_type;

begin

	process (clk)
	begin
		if (rising_edge(clk)) then
			case state is
				when s0=>
						state <= s1;
						carry <= '0';
					
				when s1=>
						state <= s2;
					
				when s2=>
						state <= s3;
					
				when s3=>
						if counter = "10" then 
						state <= s0; 
						counter <= "00";
						carry <='1';
					else
						state <= s4;
					end if; 
					
				when s4=>
					state <=s5;
					
				when s5=>
						state <= s6;
						
				when s6=>
						state <= s7;
						
				when s7=>
						state <= s8;
					
				when s8=>
						state <= s9;
					
				when s9=>
						state <= s0;
						carry <= '1';
						counter <= counter + '1';
					
			end case;

		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state)
	begin
			case state is
				when s0=>
						unidades <= "0000";
				when s1=>
						unidades <= "0001";
				when s2=>
						unidades <= "0010";
				when s3=>
						unidades <= "0011";
				when s4=>
						unidades <= "0100";
				when s5=>
						unidades <= "0101";
				when s6=>
						unidades <= "0110";
				when s7=>
						unidades <= "0111";
				when s8=>
						unidades <= "1000";
				when s9=>
						unidades <= "1001";
				end case;
				
	end process;

end RTL;
