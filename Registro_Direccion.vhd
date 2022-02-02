
--Registro de Datos

--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Registro_Direccion is
	generic ( n: integer:=4);
	port(
		Clk,resetn,en_Reg: in std_logic;
		In_reg: in bit_vector(n-1 downto 0);
		Out_reg: out bit_vector(n-1 downto 0));
end Registro_Direccion ;

--Architecture
architecture solve of Registro_Direccion  is
	-- Signals,Constants,Variables,Components
	signal d,q: bit_vector(n-1 downto 0);
	begin
	--Process #1
	d<=In_reg;
	process(resetn,clk)
	--Sequential programming
		begin
			if resetn='1' then
				q<=(others=>'0');
			elsif clk='1' and en_Reg='1' then
				q<=d;
			end if;
	end process;
	--Process #n...
	Out_reg<=q;
end solve;