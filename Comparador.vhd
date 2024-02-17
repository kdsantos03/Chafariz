library IEEE; 
 use IEEE.std_logic_1164.all;
 use ieee.numeric_std.all;
 
 entity Comparador is 
 port (
 custo : in std_logic_vector ( 7 downto 0);
 valor_tot_rg : in std_logic_vector ( 7 downto 0);
 rescomparacao : out std_logic
 );
 
 end Comparador;
 
 architecture operacao of Comparador is
 begin 
 rescomparacao <= '1' when valor_tot_rg >= custo else '0';
 end operacao;
