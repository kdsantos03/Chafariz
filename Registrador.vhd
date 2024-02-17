library IEEE;
use ieee.std_logic_1164.all; 
entity Registrador is
 port (
 entradasoma : in std_logic_vector ( 7 downto 0);
 clock, ld, clr : in std_logic;
 Q : out std_logic_vector (7 downto 0)
 );
 end Registrador;
 architecture hardware of Registrador is 
 begin 
 
 process ( clock, clr, ld) 
 begin
 if (clr = '1') then Q <= "00000000";
 elsif (clock'event and clock = '1' and ld = '1' and clr = '0' ) then
 Q <= entradasoma;
 end if;
 end process;
 end hardware;