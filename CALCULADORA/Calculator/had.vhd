library IEEE;
use IEEE.std_logic_1164.all;

entity HAD is
	port ( AHA,BHA: in STD_LOGIC;
	       SHA,COHA: out STD_LOGIC );

end HAD;

architecture RTL of HAD is
begin
	SHA <= AHA XOR BHA;
	COHA <= AHA AND BHA;
end RTL;



