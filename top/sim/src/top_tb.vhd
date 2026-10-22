
library ieee;
use ieee.std_logic_1164.all;   
use ieee.numeric_std.all;
   

entity top_tb is 
end top_tb;

architecture arch of top_tb is

	component calc is
	  port (
		clock : in std_logic;
		rst : in std_logic;
		A_async             : in std_logic_vector(2 downto 0);
		B_async             : in std_logic_vector(2 downto 0);
		add_button	  : in std_logic;
		sub_button 	  : in std_logic;
		hex0   : out std_logic_vector(6 downto 0);
		hex1   : out std_logic_vector(6 downto 0);
		hex2   : out std_logic_vector(6 downto 0)
	  );  
	end component; 
	
	signal clock_tb : std_logic := '0';
	signal rst_tb : std_logic;
	signal 	A_tb : std_logic_vector(2 downto 0):= "000";
	signal B_tb  : std_logic_vector(2 downto 0):= "000";
	signal add_tb : std_logic := '1';
	signal sub_tb : std_logic := '0';	
	
	begin
	
		iterate : process
			 begin
				wait for 80ns;
				for i in 0 to 7 loop
					A_tb <= std_logic_vector(unsigned(A_tb)+1);
					for j in 0 to 7 loop
						B_tb <= std_logic_vector(unsigned(B_tb)+1);
						wait for 40ns;
					end loop;
				end loop;
				
			end process;
			
		operation : process
			begin
				wait for 4560 ns;
				add_tb <= not add_tb;
				sub_tb <= not sub_tb;
		end process;
				

		clock: process
		  begin
			clock_tb <= not clock_tb;
			wait for 10ns;
		end process; 
		
		reset: process
			begin
				rst_tb <= '0';
				wait for 80 ns;
				rst_tb <= '1';
		end process;
		
		uut : calc
		port map(
			clock => clock_tb,
			rst => rst_tb,
			A_async => A_tb,
			B_async => B_tb,
			add_button => add_tb,
			sub_button => sub_tb
		);

end arch; 