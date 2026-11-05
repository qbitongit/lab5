library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ABset is
port(
clk : in std_logic;
reset : in std_logic;
num : in std_logic_vector(8 downto 0);
state : in std_logic_vector(3 downto 0);
A_out : out std_logic_vector(8 downto 0);
B_out : out std_logic_vector(8 downto 0)
);
end ABset;


architecture beh of ABset is

signal A_sig : std_logic_vector(8 downto 0) := (others => '0');
signal B_sig : std_logic_vector(8 downto 0) := (others => '0');

begin

process (clk, reset)
begin
		
if reset = '1' then
A_sig <= (others => '0');
B_sig <= (others => '0');

elsif rising_edge(clk) then

case state is
when "0001" => A_sig <= num;
when "0010" => B_sig <= num;
when others => null;
end case;

end if;

end process;

A_out <= A_sig;
B_out <= B_sig;

end beh;