library IEEE;
use IEEE.std_logic_1164.all;

entity FULLAD is
	port ( AFA,BFA,CIFA: in STD_LOGIC;
	       SFA,COFA: out STD_LOGIC );

end FULLAD;

architecture RTL of FULLAD is
begin
	SFA <= AFA XOR BFA XOR CIFA;
	COFA <= (AFA AND BFA) OR (AFA AND CIFA) OR (BFA AND CIFA);
end RTL;


