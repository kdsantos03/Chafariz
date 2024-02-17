library IEEE;
 use IEEE.std_logic_1164.all;
 use ieee.numeric_std.all;
 
 entity PC is 
 port ( 
 c, clk, reset, tot_lt_s : in std_logic;
 d, tot_clr, tot_ld : out std_logic
 );
end PC;

 architecture maquinaestado of PC is 

type tipo_estado is ( inicio, esperar, somar, fornecer);
signal estado : tipo_estado;
begin 
process ( clk, reset)
begin
if (reset = '1') then
 
estado <= inicio;
 d <= '0';
elsif (clk' event and clk = '1') then
case estado is
when inicio =>
d <= '0';
 estado <= esperar;

    when esperar =>

    if ( c = '0' and tot_lt_s = '0')then 
        estado <= esperar;
        else
        if (c' event and c = '1') then 
            estado <= somar; 
            elsif (tot_lt_s = '1' and c = '0' ) then 
            estado <= fornecer;
 
        end if; 
        
    end if;

    when somar =>
 estado <= esperar;
    when fornecer =>
 d <= '1';
estado <= inicio;
end case;
end if;
end process;
tot_clr <= '1' when estado = inicio else '0';
tot_ld <= '1' when estado = somar else '0';
end maquinaestado;
