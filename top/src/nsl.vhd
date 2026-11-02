library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nsl is
port(
reset : in std_logic;
in_state : in std_logic_vector(3 downto 0);
flag : in std_logic;
out_state : out std_logic_vector(3 downto 0)
);
end nsl;

architecture beh of nsl is
begin

next_state : process (flag)
begin

if reset = '1' then
out_state <= "0001";
elsif flag = '0' then
out_state <= (in_state(2 downto 0) & in_state(3));
else
out_state <= in_state;
end if;


end process;

end beh;