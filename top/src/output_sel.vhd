library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity output_sel is
port(
clk : in std_logic;
reset : in std_logic;
state : in std_logic_vector(3 downto 0);
num : in std_logic_vector(8 downto 0);
r : in std_logic_vector(11 downto 0);
to_disp : out std_logic_vector(11 downto 0)
);
end output_sel;

architecture beh of output_sel is

signal n : std_logic_vector(11 downto 0) := "000" & num;

begin

process(clk, reset)
begin

if reset = '1' then
to_disp <= (others => '0');

elsif rising_edge(clk) then

case state is
when "0001" => to_disp <= n;
when "0010" => to_disp <= n;
when "0100" => to_disp <= r;
when "1000" => to_disp <= r;
end case;

end if;

end process;