library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Somador is 
port (
 x, y : in std_logic_vector ( 7 downto 0);
saidasomador : out std_logic_vector ( 7 downto 0)
 
 );
 
 end Somador;
 
 architecture operacao of Somador is 
 begin
saidasomador <= std_logic_vector(unsigned(x) + unsigned(y));
 end operacao;