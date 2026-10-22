-------------------------------------------------------------------------------
-- Dr. Kaputa
-- double_dabble demo
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blipper is
port (
button	: in std_logic;
blip	: out std_logic := '0'
 );  
end blipper;  

architecture beh of blipper is
begin

process(button)
begin

if(button = '0') then

blip <= '1';
wait 80 ns;
blip <= '0';

end if;	
	
end process;
	
end beh;