--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blipper is
port (
clk : in std_logic;
reset : in std_logic;
button	: in std_logic;
blip	: out std_logic := '0'
 );  
end blipper;  

architecture beh of blipper is

signal out_sig : std_logic := '0';

begin

process(button, clk, reset)

begin

if reset = '1' then
out_sig <= '0';

elsif rising_edge(clk) then

if button = '0' then
out_sig <= '1';
else
out_sig <= '0';
end if;

end if;
	
end process;

blip <= out_sig;

end beh;
