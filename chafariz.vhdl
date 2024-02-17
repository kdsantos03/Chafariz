library IEEE;
library work;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity chafariz is
    port ( 
        a , s : in std_logic_vector (7 downto 0);
        c, clk, reset: in std_logic;
        d : out std_logic
        
    );
end entity chafariz;

architecture rtl of chafariz is
    
component PO is 
    port ( 
        a , s : in std_logic_vector (7 downto 0);
        tot_clr, clk, tot_ld: in std_logic;
        tot_lt_s : out std_logic
        
    );
end component;

component PC is 
    port ( 
        tot_lt_s, c, clk, reset : in std_logic;
        tot_clr, d, tot_ld: out std_logic
        
    );
end component;

signal tot_ld, tot_lt_s, tot_clr: std_logic;

begin
    Bloco_operacional : PO port map (s => s, a => a, tot_clr => tot_clr, tot_ld => tot_ld, tot_lt_s => tot_lt_s, clk => clk);
    Bloco_controle : PC port map (c => c, d => d, reset => reset, tot_clr => tot_clr, tot_ld => tot_ld, tot_lt_s => tot_lt_s, clk => clk);
    
end architecture rtl;

