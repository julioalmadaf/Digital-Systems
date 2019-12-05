library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
------------------------------
ENTITY excavadora IS
	PORT (	CLKIN, b_right, b_left, b_up, b_down,sw: in std_logic;
				frec_servo1, frec_servo2, frec_servo3: out std_logic
			);
END excavadora;
	
ARCHITECTURE RTL OF excavadora IS

COMPONENT div_frec IS
PORT(CLK,SW1,SW2: in std_logic;
     CLK_Prima: out std_logic);
END COMPONENT;

COMPONENT div_frec_ss IS
PORT(
		CLK,SW1: in std_logic;
     CLK_Prima: out std_logic);
END COMPONENT;


begin

elemento_1: div_frec port map(CLKIN, b_right, b_left, frec_servo1);
elemento_2: div_frec port map(CLKIN, b_up, b_down, frec_servo2);
elemento_3: div_frec_ss port map(CLKIN, sw, frec_servo3);

end RTL;