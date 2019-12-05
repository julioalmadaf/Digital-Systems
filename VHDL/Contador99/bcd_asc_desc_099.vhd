library ieee;
use ieee.std_logic_1164.all;

entity BCD_asc_desc_099 is

	port
	(
		sentido	 : in	std_logic;
		carry	 : in	std_logic;
		decenas	 : out std_logic_vector(3 downto 0)	
	);

end entity;

architecture rtl of BCD_asc_desc_099 is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
	
	signal state : state_type;

begin

	process (carry, sentido)
	begin
		if (rising_edge(carry)) then
			case state is
				when s0=>
					if sentido = '0' then
						state <= s1;
					else 
						state <= s9;
					end if;
					
				when s1=>
					if sentido = '0' then
						state <= s2;
					else 
						state <= s0;
					end if;
					
				when s2=>
					if sentido = '0' then
						state <= s3;
					else 
						state <= s1;
					end if;
				
				when s3=>
					if sentido = '0' then
						state <= s4;
					else
						state <= s2;
					end if;
					
				when s4=>
					if sentido = '0' then
						state <= s5;
					else
						state <= s3;
					end if;
					
				when s5=>
					if sentido = '0' then
						state <= s6;
					else
						state <= s4;
					end if;
					
				when s6=>
					if sentido = '0' then
						state <= s7;
					else
						state <= s5;
					end if;
				
				when s7=>
					if sentido = '0' then
						state <= s8;
					else
						state <= s6;
					end if;
					
				when s8=>
					if sentido = '0' then
						state <= s9;
					else
						state <= s7;
					end if;
				
				when s9=>
					if sentido = '0' then
						state <= s0;
					else
						state <= s8;
					end if;
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
				when s3=>
						decenas <= "0011";
				when s4=>
						decenas <= "0100";
				when s5=>
						decenas <= "0101";
				when s6=>
						decenas <= "0110";
				when s7=>
						decenas <= "0111";
				when s8=>
						decenas <= "1000";
				when s9=>
						decenas <= "1001";
				end case;
				
	end process;

end rtl;
