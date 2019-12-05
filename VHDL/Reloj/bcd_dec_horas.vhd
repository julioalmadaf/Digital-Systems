
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity BCD_dec_horas is

	port
	(
		clk		 : in	std_logic;
		decenas	 : out	std_logic_vector(3 downto 0)
	
	);

end entity;

architecture RTL of BCD_dec_horas is
	type state_type is (s0, s1, s2);
	signal state : state_type;

begin

	process (clk)
	begin
		if (rising_edge(clk)) then
			case state is
				when s0=>
						state <= s1;
					
				when s1=>
						state <= s2;
					
				when s2=>
						state <= s0;
						
			end case;

		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state)
	begin
			case state is
				when s0=>
						decenas <= "0000";
				when s1=>
						decenas <= "0001";
				when s2=>
						decenas <= "0010";
				end case;
				
	end process;

end RTL;
