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
signal is_counting : boolean := false;

begin


process(clk, reset, button)
begin

if is_counting then

if reset = '1' then
out_sig <= '0';

elsif rising_edge(clk) then

if count = max_count then
count <= (others => '0');
is_counting <= false;
out_sig <= '0';
else
count <= count + 1;
end if;

end if; --clock

elsif falling_edge(button) then

is_counting <= true;
out_sig <= '1';

end if; --is counting

end process;

blip <= out_sig;

end beh;
