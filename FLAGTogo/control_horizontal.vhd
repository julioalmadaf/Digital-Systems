library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_horizontal is
port(	  clk: in std_logic;
	  CV: in integer range 0 to 525:=0;
	  PSH: out std_logic;
	  R,G,B: out std_logic_vector(9 downto 0));
end control_horizontal;

architecture RTL of control_horizontal is

signal cuenta_horizontal: integer range 0 to 793:=0;


begin
process(clk)
begin
if(rising_edge(clk))then 
	if(cuenta_horizontal<793) then
		cuenta_horizontal<=cuenta_horizontal+1;
	else
		cuenta_horizontal<=0;
	end if;
	if (cuenta_horizontal<95) then
		PSH<='0';
	else
		PSH<='1';
	end if;
else null;
end if;
end process;


process(cuenta_horizontal)
begin
if((CV>35) and (CV<515) and(cuenta_horizontal>143)and (cuenta_horizontal<778)) then --seccion no  visible
	
	if(35<CV and CV<321 and cuenta_horizontal>143 and cuenta_horizontal< 431) then
			R<="1111111111";																			--cuadro rojo
			G<="0000010000";
			B<="0000110100";	
			
			if(68<CV and CV<73 and 285<cuenta_horizontal and cuenta_horizontal<288) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(72<CV and CV<77 and 284<cuenta_horizontal and cuenta_horizontal<289) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(76<CV and CV<81 and 283<cuenta_horizontal and cuenta_horizontal<290) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(80<CV and CV<85 and 282<cuenta_horizontal and cuenta_horizontal<291) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(84<CV and CV<89 and 281<cuenta_horizontal and cuenta_horizontal<292) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(88<CV and CV<93 and 280<cuenta_horizontal and cuenta_horizontal<293) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(92<CV and CV<97 and 279<cuenta_horizontal and cuenta_horizontal<294) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(96<CV and CV<101 and 278<cuenta_horizontal and cuenta_horizontal<295) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(100<CV and CV<105 and 277<cuenta_horizontal and cuenta_horizontal<296) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(104<CV and CV<109 and 276<cuenta_horizontal and cuenta_horizontal<297) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(108<CV and CV<113 and 275<cuenta_horizontal and cuenta_horizontal<298) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(112<CV and CV<117 and 274<cuenta_horizontal and cuenta_horizontal<299) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(116<CV and CV<121 and 273<cuenta_horizontal and cuenta_horizontal<300) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(120<CV and CV<125 and 272<cuenta_horizontal and cuenta_horizontal<301) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(124<CV and CV<129 and 271<cuenta_horizontal and cuenta_horizontal<302) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(128<CV and CV<133 and 270<cuenta_horizontal and cuenta_horizontal<303) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(132<CV and CV<137 and 269<cuenta_horizontal and cuenta_horizontal<304) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(136<CV and CV<141 and 268<cuenta_horizontal and cuenta_horizontal<305) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(140<CV and CV<143 and 267<cuenta_horizontal and cuenta_horizontal<306) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(142<CV and CV<145 and 208<cuenta_horizontal and cuenta_horizontal<368) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(144<CV and CV<147 and 211<cuenta_horizontal and cuenta_horizontal<365) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;			
			if(146<CV and CV<149 and 214<cuenta_horizontal and cuenta_horizontal<362) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(148<CV and CV<151 and 217<cuenta_horizontal and cuenta_horizontal<359) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(150<CV and CV<153 and 220<cuenta_horizontal and cuenta_horizontal<356) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(152<CV and CV<155 and 223<cuenta_horizontal and cuenta_horizontal<353) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(154<CV and CV<157 and 226<cuenta_horizontal and cuenta_horizontal<350) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(156<CV and CV<159 and 229<cuenta_horizontal and cuenta_horizontal<347) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(158<CV and CV<161 and 232<cuenta_horizontal and cuenta_horizontal<344) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(160<CV and CV<163 and 235<cuenta_horizontal and cuenta_horizontal<341) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(162<CV and CV<165 and 238<cuenta_horizontal and cuenta_horizontal<338) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(164<CV and CV<167 and 241<cuenta_horizontal and cuenta_horizontal<335) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(166<CV and CV<169 and 244<cuenta_horizontal and cuenta_horizontal<332) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(168<CV and CV<171 and 247<cuenta_horizontal and cuenta_horizontal<329) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;			
			if(170<CV and CV<173 and 250<cuenta_horizontal and cuenta_horizontal<326) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(172<CV and CV<175 and 253<cuenta_horizontal and cuenta_horizontal<323) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(174<CV and CV<177 and 256<cuenta_horizontal and cuenta_horizontal<320) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(176<CV and CV<179 and 259<cuenta_horizontal and cuenta_horizontal<317) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(178<CV and CV<182 and 258<cuenta_horizontal and cuenta_horizontal<318) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;

			
			if(181<CV and CV<185 and 257<cuenta_horizontal and cuenta_horizontal<319) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(184<CV and CV<188 and 256<cuenta_horizontal and cuenta_horizontal<320) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(187<CV and CV<191 and 255<cuenta_horizontal and cuenta_horizontal<321) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(190<CV and CV<194 and 254<cuenta_horizontal and cuenta_horizontal<322) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(193<CV and CV<197 and 253<cuenta_horizontal and cuenta_horizontal<323) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(196<CV and CV<200 and 252<cuenta_horizontal and cuenta_horizontal<324) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(199<CV and CV<203 and 251<cuenta_horizontal and cuenta_horizontal<325) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(202<CV and CV<206 and 250<cuenta_horizontal and cuenta_horizontal<326) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(205<CV and CV<209 and 249<cuenta_horizontal and cuenta_horizontal<327) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(208<CV and CV<212 and 248<cuenta_horizontal and cuenta_horizontal<328) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(211<CV and CV<215 and ((247<cuenta_horizontal and cuenta_horizontal<287) or (289<cuenta_horizontal and cuenta_horizontal<329))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(214<CV and CV<218 and ((246<cuenta_horizontal and cuenta_horizontal<284) or (292<cuenta_horizontal and cuenta_horizontal<330))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(217<CV and CV<221 and ((245<cuenta_horizontal and cuenta_horizontal<281) or (295<cuenta_horizontal and cuenta_horizontal<331))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(220<CV and CV<224 and ((244<cuenta_horizontal and cuenta_horizontal<278) or (298<cuenta_horizontal and cuenta_horizontal<332))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(223<CV and CV<227 and ((243<cuenta_horizontal and cuenta_horizontal<275) or (301<cuenta_horizontal and cuenta_horizontal<333))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(226<CV and CV<230 and ((242<cuenta_horizontal and cuenta_horizontal<272) or (304<cuenta_horizontal and cuenta_horizontal<334))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(229<CV and CV<233 and ((241<cuenta_horizontal and cuenta_horizontal<269)  or (307<cuenta_horizontal and cuenta_horizontal<335))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(232<CV and CV<236 and ((240<cuenta_horizontal and cuenta_horizontal<266)  or (310<cuenta_horizontal and cuenta_horizontal<336))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(235<CV and CV<239 and ((239<cuenta_horizontal and cuenta_horizontal<263)  or (313<cuenta_horizontal and cuenta_horizontal<337))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(238<CV and CV<242 and ((238<cuenta_horizontal and cuenta_horizontal<260)  or (316<cuenta_horizontal and cuenta_horizontal<338))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(241<CV and CV<245 and ((237<cuenta_horizontal and cuenta_horizontal<257)  or (319<cuenta_horizontal and cuenta_horizontal<339))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(244<CV and CV<248 and ((236<cuenta_horizontal and cuenta_horizontal<254)  or (322<cuenta_horizontal and cuenta_horizontal<340))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(247<CV and CV<251 and ((235<cuenta_horizontal and cuenta_horizontal<251)  or (325<cuenta_horizontal and cuenta_horizontal<341))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(250<CV and CV<254 and ((234<cuenta_horizontal and cuenta_horizontal<248)  or (328<cuenta_horizontal and cuenta_horizontal<342))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(253<CV and CV<257 and ((233<cuenta_horizontal and cuenta_horizontal<245)  or (331<cuenta_horizontal and cuenta_horizontal<343))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(256<CV and CV<260 and ((232<cuenta_horizontal and cuenta_horizontal<242)  or (334<cuenta_horizontal and cuenta_horizontal<344))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(259<CV and CV<263 and ((231<cuenta_horizontal and cuenta_horizontal<239)  or (337<cuenta_horizontal and cuenta_horizontal<345))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(262<CV and CV<266 and ((230<cuenta_horizontal and cuenta_horizontal<236)  or (340<cuenta_horizontal and cuenta_horizontal<346))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			if(265<CV and CV<269 and ((229<cuenta_horizontal and cuenta_horizontal<233)  or (343<cuenta_horizontal and cuenta_horizontal<347))) then
						R<="1111111111";																			
						G<="1111111111";
						B<="1111111111";
			end if;
			
			
else

	if(( 35<CV and CV<129) or (CV>225 and CV<321) or (CV>417 and CV<515)) then --VERDE
			R<="0000000000";
			G<="0001101010";
			B<="0001001110";
	else
			R<="1111111111";									--Amarillo
			G<="0111111111";
			B<="0000000000";
	end if;
end if;
	
	
else																--seccion no visible
			R<="0000000000";
			G<="0000000000";
			B<="0000000000";
end if;
end process;

end RTL;

		