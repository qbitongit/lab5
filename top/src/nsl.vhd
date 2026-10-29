library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nsl is
port(
in_state : in std_logic_vector(3 downto 0);
flag : in std_logic;
out_state : out std_logic_vector(3 downto 0)
);
end nsl;

architecture beh of nsl is
begin

next_state : process (flag)
begin

if(rising_edge(flag)) then
out_state <= (in_state(2 downto 0) & in_state(3));
end if;


end process;

end beh;