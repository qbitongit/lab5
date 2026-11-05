------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;


entity add_sub is
port (
reset : in std_logic;
clk : in std_logic;
A : in std_logic_vector(8 downto 0);
B : in std_logic_vector(8 downto 0);
state : in std_logic_vector(3 downto 0);
R  : out std_logic_vector(11 downto 0)
);
end entity; 


architecture beh of add_sub is

constant MAX_COUNT : unsigned(11 downto 0) := to_unsigned(999, 12);
signal unsA : unsigned(11 downto 0) := (others => '0');
signal unsB : unsigned(11 downto 0) := (others => '0');
signal unsR : unsigned(11 downto 0) := (others => '0');

begin

unsA <= unsigned("000" & A);
unsB <= unsigned("000" & B);

process(clk, reset) 
begin

if reset = '1' then
unsR <= (others => '0');

elsif rising_edge(clk) then
case state is

when "0100" => 
if (unsA + unsB) > MAX_COUNT then
unsR <= max_count;
else
unsR <= unsA + unsB;
end if;

when "1000" => 
if unsB > unsA then
unsR <= (others => '0');
else
unsR <= unsA - unsB;
end if;

when others => unsR <= (others => '0');
end case;

end if;

end process;

R <= std_logic_vector(unsR);

end beh;