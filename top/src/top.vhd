
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity top is
port(

clock : in std_logic;
rst : in std_logic;
butt_async : in std_logic;
num_async : in std_logic_vector(8 downto 0);
state_leds : out std_logic_vector(3 downto 0);
hex1s : out std_logic_vector(6 downto 0);
hex10s : out std_logic_vector(6 downto 0);
hex100s : out std_logic_vector(6 downto 0)

);
end top;



architecture arch of top is

component seven_seg is
  port (
    bcd             : in std_logic_vector(3 downto 0);
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

component double_dabble is
port(
clk : in std_logic;
reset : in std_logic;
result_padded : in STD_LOGIC_VECTOR(11 downto 0);
ones : out STD_LOGIC_VECTOR(3 downto 0);
tens : out STD_LOGIC_VECTOR(3 downto 0);
hundreds : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

component output_sel is
port(
clk : in std_logic;
reset : in std_logic;
state : in std_logic_vector(3 downto 0);
num : in std_logic_vector(8 downto 0);
r : in std_logic_vector(11 downto 0);
to_disp : out std_logic_vector(11 downto 0)
);
end component;

component add_sub is
port (
reset : in std_logic;
clk : in std_logic;
A : in std_logic_vector(8 downto 0);
B : in std_logic_vector(8 downto 0);
state : in std_logic_vector(3 downto 0);
R  : out std_logic_vector(11 downto 0)
);
end component; 

component ABset is
port(
clk : in std_logic;
reset : in std_logic;
num : in std_logic_vector(8 downto 0);
state : in std_logic_vector(3 downto 0);
A_out : out std_logic_vector(8 downto 0);
B_out : out std_logic_vector(8 downto 0)
);
end component;

component synchronizer_9bit is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    async_in          : in std_logic_vector(8 downto 0);
    sync_out          : out std_logic_vector(8 downto 0)
  );
end component;

component nsl is
port(
in_state : in std_logic_vector(3 downto 0);
flag : in std_logic;
out_state : out std_logic_vector(3 downto 0)
);
end component;

component blipper is
port (
button	: in std_logic;
blip	: out std_logic := '0'
 );  
end component;  

component synchronizer_1bit is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    async_in          : in std_logic;
    sync_out          : out std_logic
  );
end component;


signal butt_sync : std_logic := '1';
signal state_trig : std_logic := '0';
signal this_state : std_logic_vector(3 downto 0);
signal next_state : std_logic_vector(3 downto 0);
signal in2disp : std_logic_vector(11 downto 0);
signal result : std_logic_vector(11 downto 0);
signal A_sig : std_logic_vector(8 downto 0);
signal B_sig : std_logic_vector(8 downto 0);
signal num_sync : std_logic_vector(8 downto 0);
signal ones2hex : std_logic_vector(3 downto 0);
signal tens2hex : std_logic_vector(3 downto 0);
signal hund2hex : std_logic_vector(3 downto 0);


begin

button_sync : synchronizer_1bit
port map(
clk => clock,
reset => rst,
async_in => butt_async,
sync_out => butt_sync
);

blipper1 : blipper
port map(
button => butt_sync,
blip => state_trig
);

nsl1 : nsl
port map(
in_state => this_state,
flag => state_trig,
out_state => next_state
);

number_sync : synchronizer_9bit
port map(
clk => clock,
reset => rst,
async_in => num_async,
sync_out => num_sync
);

ABset1 : ABset
port map(
clk => clock,
reset => rst,
num => num_sync,
state => this_state,
A_out => A_sig,
B_out => B_sig
);

addsub1 : add_sub
port map(
clk => clock,
reset => rst,
A => A_sig,
B => B_sig,
state => this_state,
R => result
);

output_sel1 : output_sel
port map(
clk => clock,
reset => rst,
state => this_state,
num => num_sync,
r => result,
to_disp => in2disp
);

dd1 : double_dabble
port map(
clk => clock,
reset => rst,
result_padded => result,
ones => ones2hex,
tens => tens2hex,
hundreds => hund2hex
);

hex2 : seven_seg
port map(
bcd => ones2hex,
seven_seg_out => hex1s
);

hex1 : seven_seg
port map(
bcd => tens2hex,
seven_seg_out => hex10s
);

hex0 : seven_seg
port map(
bcd => hund2hex,
seven_seg_out => hex100s
);


state : process(clock, rst)
begin

if rst = '1' then
this_state <= "0001";

elsif rising_edge(clock) then
this_state <= next_state;
	
end if;

end process;

end arch;