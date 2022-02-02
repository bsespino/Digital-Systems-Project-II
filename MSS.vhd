--Synchronous Sequential Machine

--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity MSS is
	port(
		clock,Start,Ordenar,resetn,Presentar : 																IN STD_LOGIC; --Entradas externas
		Contador_llenado_lleno,Contador_fijo_lleno,Contador_interactivo_lleno,AmenorB_cambio : IN STD_LOGIC; --Condicionales
		resetn_cnt_llenado,en_cnt_llenado,ld_cnt_llenado : 												OUT STD_LOGIC;--Contador de llenado
		Sel_llenado,en_llenado : 																					OUT STD_LOGIC;
		wr_RAM : 																										OUT STD_LOGIC;
		resetn_cont_fijo,en_cont_fijo,ld_cont_fijo : 														OUT STD_LOGIC;
		resetn_cont_interactivo,en_cont_interactivo,ld_cont_interactivo : 							OUT STD_LOGIC;
		resetn_Reg_fijo,en_Reg_fijo : 																			OUT STD_LOGIC;
		resetn_Reg_interactivo,en_Reg_interactivo : 															OUT STD_LOGIC;
		resetn_RegD_fijo,en_RegD_fijo : 																			OUT STD_LOGIC;
		resetn_RegD_interactivo,en_RegD_interactivo : 														OUT STD_LOGIC;
		Sel,en_mux_cambio : 																							OUT STD_LOGIC;
		en_decos_comparar : 																							OUT STD_LOGIC);
end MSS;

--Architecture
architecture solve of MSS is
	-- Signals,Constants,Variables,Components
	type estado is (T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17,T18,T19,T20,T21,T22,T23,T24,T25,T26,T27,T28);--,T28,T29,T30,T31,T32,T33,T34,T35,T36,T37,T38,T39,T40,T41,T42);
	signal y: estado;
	begin
	--Process #1: Next state decoder and state memory
	process(resetn,clock)
	--Sequential programming
		begin
			if resetn = '1' then y<= T0;
			elsif (clock'event and clock = '1' and resetn='0') then
				case y is
					when T0 =>	if start='0' then y<=T0;
									else y<=T1;
									end if;
					when T1 =>	if start='1' then y<=T1;
									else y<=T2;
									end if;
					when T2 =>	y<=T3;
					when T3 =>	y<=T4;
					when T4 =>	if Contador_llenado_lleno='0' then y<=T2;
									elsif Contador_llenado_lleno='1' then y<=T5;
									end if;
					when T5 => 	if Ordenar='1' then y<=T6;
									else y<=T5;
									end if;
					when T6 => 	if Ordenar='0' then y<=T7;
									else y<=T6;
									end if;
					when T7 =>	y<=T8;
					when T8=>	y<=T9;
					when T9=>	y<=T10;
					when T10=>	y<=T11;
					when T11=>	y<=T12;
					when T12=>	if AmenorB_cambio='1' then y<=T13;
									elsif AmenorB_cambio='0' and Contador_interactivo_lleno='1' then y<=T19;
									elsif Contador_interactivo_lleno='0' and Contador_fijo_lleno='1' then y<=T20;
									elsif AmenorB_cambio='0' and Contador_interactivo_lleno='0' and Contador_fijo_lleno='0' then y<=T22;
									end if;
					when T13 => y<=T14;
					when T14 => y<=T15;
					when T15 => y<=T16;
					when T16 => y<=T17;
					when T17 => y<=T18;
					when T18 => y<=T8;
					when T19 => y<=T8;
					when T20 => y<=T21;
					when T21 => y<=T8;
					when T22 => if Presentar='0' then y<=T22;
									elsif Presentar='1' then y<=T23;
									end if;
					when T23 => if Presentar='0' then y<=T28;
									elsif Presentar='1' then y<=T23;
									end if;
					when T28 => y<=T24;				
					when T24 => y<=T25;
					when T25 => y<=T26;
					when T26 => if Contador_llenado_lleno='0' then y<=T24;
									elsif Contador_llenado_lleno='1' then y<=T27;
									end if;
					when T27 => y<=T0;
					--when others => y<=T0;
				end case;
			end if;
	end process;
	--Process #2: Output decoder
	process(y)-- mealy ->(y,d,n)
	--Sequential programming
		begin
			resetn_cnt_llenado<='0';en_cnt_llenado<='0';ld_cnt_llenado<='0';
			Sel_llenado<='X';en_llenado<='0';
			wr_RAM<='0';
			resetn_cont_fijo<='0';en_cont_fijo<='0';ld_cont_fijo<='0';
			resetn_cont_interactivo<='0';en_cont_interactivo<='0';ld_cont_interactivo<='0';
			resetn_Reg_fijo<='0';en_Reg_fijo<='0';																			
			resetn_Reg_interactivo<='0';en_Reg_interactivo<='0';
			resetn_RegD_fijo<='0';en_RegD_fijo<='0';
			resetn_RegD_interactivo<='0';en_RegD_interactivo<='0';
			Sel<='X';en_mux_cambio<='0';
			en_decos_comparar<='0';
			case y is
				when T0 =>	
				when T1 =>	
				when T2 =>	wr_RAM<='1';Sel_llenado<='1';en_llenado<='0';
				when T3 =>	en_cnt_llenado<='1';Sel_llenado<='1';en_llenado<='1';wr_RAM<='1';
				when T4 =>	Sel_llenado<='1';en_llenado<='0';wr_RAM<='0';
				when T5 => 	
				when T6 => 	resetn_cont_fijo<='1';
				when T7 =>	resetn_Reg_fijo<='1';en_cont_interactivo<='1';ld_cont_interactivo<='1';
								resetn_Reg_interactivo<='1';resetn_RegD_fijo<='1';resetn_RegD_interactivo<='1';
				when T8 =>	en_RegD_fijo<='1';en_RegD_interactivo<='1';
				when T9 => 	Sel<='1';en_mux_cambio<='1';Sel_llenado<='0';en_llenado<='1';wr_RAM<='0';
								en_Reg_fijo<='1';--FIJO
				when T10 =>	
				when T11 =>	Sel<='0';en_mux_cambio<='1';Sel_llenado<='0';en_llenado<='1';wr_RAM<='0';
								en_Reg_interactivo<='1';--INTERATIVO				
				when T12 =>	en_decos_comparar<='1';
				when T13 =>	Sel<='1';en_mux_cambio<='1';Sel_llenado<='0';en_llenado<='0';wr_RAM<='1';
				when T14 =>	Sel<='1';en_mux_cambio<='1';Sel_llenado<='0';en_llenado<='1';wr_RAM<='1';
				when T15 =>	en_mux_cambio<='0';en_llenado<='0';wr_RAM<='0';
				when T16 =>	Sel<='0';en_mux_cambio<='1';Sel_llenado<='0';en_llenado<='0';wr_RAM<='1';
				when T17 =>	Sel<='0';en_mux_cambio<='1';Sel_llenado<='0';en_llenado<='1';wr_RAM<='1';
				when T18 =>	en_mux_cambio<='0';en_llenado<='0';wr_RAM<='0';
				when T19	=>	en_cont_interactivo<='1';
				when T20	=> en_cont_fijo<='1';
				when T21	=> en_cont_interactivo<='1';ld_cont_interactivo<='1';
				when T22	=> 
				when T23	=> 
				when T28	=> resetn_cnt_llenado<='1';
				when T24 => wr_RAM<='0';Sel_llenado<='1';en_llenado<='0';
				when T25 => en_cnt_llenado<='1';Sel_llenado<='1';en_llenado<='1';wr_RAM<='0';
				when T26 => Sel_llenado<='1';en_llenado<='0';wr_RAM<='0';
				when T27 => 
			end case;
	end process;
	--Process #n... 
end solve;
