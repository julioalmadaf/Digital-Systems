library ieee;
use ieee.std_logic_1164.all;

entity BCD_asc_desc_09 is

	port
	(
		clk		 : in	std_logic;
		sentido	 : in	std_logic;
		unidades	 : out	std_logic_vector(3 downto 0);
		carry		 : out	std_logic
	);

end entity;

architecture rtl of BCD_asc_desc_09 is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
	
	signal state : state_type;

begin

	process (clk, sentido)
	begin
		if (rising_edge(clk)) then
			case state is
				when s0=>
					if sentido = '0' then
						state <= s1;
						carry <= '0';
					else 
						carry <= '1';
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
						carry <= '1';
					else
						state <= s8;
						carry <= '0';
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

end rtl;
