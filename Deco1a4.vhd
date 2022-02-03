--Digital Systems 2
--Names: Chanalata Charlotte, Leones Daniel y Espinosa Bryan
--This block takes a vector of n bits and divides it into the desired vectors in order to encode a signal from a binary stored database.

--Library
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;

--Entity
entity Deco1a4 is
	--generic ( n: integer:=68; m: integer:=36; l: integer:=12; k: integer:=12; j: integer:=8); 
	--It can be enabled for vectors of the bits to be encoded. 
	port(	A: in bit_vector(67 downto 0);
			en: in std_logic;
			CE: out bit_vector(35 downto 0);
			ED: out bit_vector(7 downto 0);
			PE: out bit_vector(11 downto 0);
			AL: out bit_vector(11 downto 0));
end Deco1a4;

--Architecture
architecture solve of Deco1a4 is
	-- Signals,Constants,Variables,Components
	signal f: bit_vector(67 downto 0);
	begin
		
		 f<= A; --when en='1' else (others=>'0');
		 CE<= f(67 downto 32) when en='1'; 
		 ED<= f(7 downto 0) when en='1';   
		 PE<= f(31 downto 20) when en='1'; 	 
		 AL<= f(19 downto 8) when en='1'; 

		 --It can be enabled for vectors of the bits to be encoded. 
		 --f<= A; --when en='1' else (others=>'0');
		 --CE<= f(n-1 downto l+k+j) when en='1'; 
		 --ED<= f(j-1 downto 0) when en='1';   
		 --PE<= f(l+k+j-1 downto k+j) when en='1'; 	 
		 --AL<= f(k+j-1 downto j) when en='1';
end solve;

