library ieee;
use ieee.std_logic_1164.all;

entity BCD_dec is

	port
	(
		carry	 : in	std_logic;
		carrys : out std_logic;
		decenas	 : out std_logic_vector(3 downto 0)	
	);

end entity;

architecture rtl of BCD_dec is
	type state_type is (s0, s1, s2, s3, s4, s5);
	
	signal state : state_type;

begin

	process (carry)
	begin
		if (rising_edge(carry)) then
			case state is
				when s0=>
						state <= s1;
						carrys <='0';
					
				when s1=>
						state <= s2;
					
				when s2=>
						state <= s3;
					
				when s3=>
						state <= s4;
					
				when s4=>
						state <= s5;
				
				when s5=>
						state <= s0;
						carrys <= '1';
	
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
				end case;
				
	end process;

end rtl;
