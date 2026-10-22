library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ABset is
port(
clk : in std_logic;
reset : in std:logic;
num : in std_logic_vector(9 downto 0);
state : in std_logic_vector(3 downto 0);
A_out : out std_logic_vector(9 downto 0);
B_out : out std_logic_vector(9 downto 0)
);
end ABset


architecture beh of ABset is
	
process (clk, reset)
begin
		
if reset = '1' then
A_out <= "0000";
B_out <= "0000";

elsif rising_edge(clk) then

case state is
when "0001" => A_out <= num;
when "0010" => B_out <= num;
when others => null;
end case;

end if;