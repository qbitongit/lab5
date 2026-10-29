--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blipper is
port (
clk: in std_logic;
reset: in std_logic;
button	: in std_logic;
blip	: out std_logic := '0'
 );  
end blipper;  

architecture beh of blipper is

constant max = unsigned(1 downto 0) := 3;
signal count = unsigned(1 downto 0):= 0;

begin

go_hi : process(button, reset)
begin

if reset = 1 then 
	blip = '0';
elsif falling_edge(button) then

blip <= '1';

end if;
	
end process;
