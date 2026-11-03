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
signal count : unsigned(7 downto 0) := (others => '0');
constant max_count : unsigned(7 downto 0) := (others => '1');
signal is_counting boolean;

begin


button_pressed : process(button)

begin

if falling_edge(button) then

if button = '0' then
is_counting <= true;
else
is_counting <= false;
end if;

end if;
	
end process;

waiter : process(clk, reset)


blip <= out_sig;

end beh;
