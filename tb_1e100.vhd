LIBRARY ieee;
USE ieee.std_logic_1164.all; 

entity tb_1e100 is
end tb_1e100;

architecture tb of tb_1e100 is

	component chafariz
		PORT
			(
				clk :  IN  STD_LOGIC;
				c :  IN  STD_LOGIC;
				reset :  IN  STD_LOGIC;
				a, s :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
				d :  OUT  STD_LOGIC
			);
	end component;
	
	signal clk, c, d, reset :	std_logic;
	signal a                  :   std_logic_vector (7 downto 0);
	signal s                  :   std_logic_vector (7 downto 0):= "01100100";
	
begin 

	chaf:		chafariz port map(a => a, d => d, reset => reset, c => c, clk => clk, s => s);
	
	process begin
		for i in 1 to 50 loop
            clk <= '1';
				wait for 1 ns;
				clk <= '0';
				wait for 1 ns;
        end loop;
        wait;
	end process;
	
	process begin
	
     	 	  reset <= '1';
		  c <= '0';
		  a <= "01100100";
		  s <= s;
		  wait for 20 ns;

	     	  reset <= '0';
		  c <= '0';
		  a <= "01100100";
		  s <= s;
		  wait for 20 ns;
		  
		  reset <= '0';
		  c <= '1';
		  a <= "01100100";
		  s <= s;
		  wait for 20 ns;
		  
		  reset <= '0';
		  c <= '0';
		  a <= "01100100";
		  s <= s;
		  wait for 60 ns;

        wait;
	end process;
end tb;
