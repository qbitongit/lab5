
library ieee;
use ieee.std_logic_1164.all;      
use ieee.numeric_std.all;

entity top is
port map(

clock : in std_logic;
rst : in std_logic;
butt_async : in std_logic;
num_async : in std_logic;

state_leds : out std_logic_vector(3 downto 0);
hex1s : out std_logic_vector(6 downto 0);
hex10s : out std_logic_vector(6 downto 0);
hex100s : out std_logic_vector(6 downto 0)

);
end top;

architecture arch of top is

component seven_seg is
  port map (
    bcd             : in std_logic_vector(3 downto 0);
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

component double_dabble is
port map(
result_padded : in STD_LOGIC_VECTOR(11 downto 0);
ones : out STD_LOGIC_VECTOR(3 downto 0);
tens : out STD_LOGIC_VECTOR(3 downto 0);
hundreds : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

component output_sel is
port map(
clk : in std_logic;
reset : in std_logic;
state : in std_logic_vector(3 downto 0);
num : in std_logic_vector(9 downto 0);
r : in std_logic_vector(11 downto 0);
to_disp : out std_logic_vector(11 downto 0)
);
end component;

component add_sub is
port map (
reset : in std_logic;
clk : in std_logic;
A : in std_logic_vector(9 downto 0);
B : in std_logic_vector(9 downto 0);
state : in std_logic_vector(3 downto 0);
R  : out std_logic_vector(11 downto 0)
);
end component; 

component ABset is
port map(
clk : in std_logic;
reset : in std:logic;
num : in std_logic_vector(9 downto 0);
state : in std_logic_vector(3 downto 0);
A_out : out std_logic_vector(9 downto 0);
B_out : out std_logic_vector(9 downto 0)
);
end component;

component synchronizer_10bit is 
  port map (
    clk               : in std_logic;
    reset             : in std_logic;
    async_in          : in std_logic_vector(9 downto 0);
    sync_out          : out std_logic_vector(9 downto 0)
  );
end component;

component nsl is
port map(
in_state : in std_logic_vector(3 downto 0);
flag : in std_logic;
out_state : out std_logic_vector(3 downto 0)
);
end component;

component blipper is
port map (
button	: in std_logic;
blip	: out std_logic := '0'
 );  
end component;  

component synchronizer_1bit is 
  port map (
    clk               : in std_logic;
    reset             : in std_logic;
    async_in          : in std_logic;
    sync_out          : out std_logic
  );
end component;


signal butt_sync : std_logic := '1';
signal next_state : std_logic := '0';
