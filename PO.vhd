library IEEE; -- Biblioteca padrão 
 use IEEE.std_logic_1164.all;
 use ieee.numeric_std.all;
 library work;

 entity PO is 
 port (
 
    a, s : in std_logic_vector ( 7 downto 0);
 
 tot_ld, tot_clr, clk : in std_logic;
 tot_lt_s : out std_logic
 );
end PO;
architecture hardware of PO is 

--signal s : std_logic_vector ( 7 downto 0) := "01100100";
signal saida_somador : std_logic_vector ( 7 downto 0);
signal saida_rg : std_logic_vector ( 7 downto 0);
 component Registrador is
 port ( entradasoma : in std_logic_vector ( 7 downto 0);
 clock, ld, clr : in std_logic;
 Q : out std_logic_vector (7 downto 0)
 );
 end component Registrador;
 component Somador is 
 port (
 x, y : in std_logic_vector ( 7 downto 0);
 saidasomador : out std_logic_vector ( 7 downto 0)
 );
 
 end component Somador ;
 
 component Comparador is 
 port (
 custo : in std_logic_vector ( 7 downto 0);
 valor_tot_rg : in std_logic_vector ( 7 downto 0);
 rescomparacao : out std_logic
 );
 
 end component Comparador ;
 
 
 begin 
 
 reg : Registrador port map (ld => tot_ld, clr => tot_clr, entradasoma => saida_somador, Q => saida_rg, clock => clk);
 som : Somador port map ( x => saida_rg, y => a, saidasomador => saida_somador);
 com : Comparador port map (custo => s, valor_tot_rg => saida_rg, rescomparacao=> tot_lt_s);
 
 end hardware;