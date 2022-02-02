--32-word 8-bit synchronous RAM
--https://vasanza.blogspot.com
--https://github.com/vasanza/MSI-VHDL

--Library
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

--Entity
entity RAM is 
	generic(n: integer:=68;-- n-bits per data
	m: integer:=4); -- m-bits of addresses
	port(
		clk,wr: in std_logic; 
		addr : in std_logic_vector(3 downto 0); 
		Din : in std_logic_vector(n-1 downto 0);
		Dout : out std_logic_vector(n-1 downto 0)); 
end RAM;

--Architecture
architecture solve of RAM is
	-- Signals,Constants,Variables,Components	
	type ram_type is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0); 
	signal tmp_ram: ram_type; 
	begin
	--Process #1:
	process(clk,wr)
	--Sequential programming
		begin 
			if (clk'event and clk='1') then 
				if wr='1' then --write
					tmp_ram(conv_integer(addr)) <= Din;
					Dout <= tmp_ram(conv_integer(addr));
				elsif wr='0' then
						Dout <= tmp_ram(conv_integer(addr));--read
				end if; 
			end if;
			Dout <= tmp_ram(conv_integer(addr));--read
	end process; 
	
	--Process #n...
end solve;