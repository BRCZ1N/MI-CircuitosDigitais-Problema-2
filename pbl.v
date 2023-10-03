module pbl(hh1,hh2,hh3,button_confirmation_input, button_count_input, clk,out_7seg,out_7seg_ac,m_col,m_line, rgb_output);

	input [1:0] hh1,hh2;
	input button_confirmation_input, button_count_input, hh3, clk;
	
	output [1:0] rgb_output;
	output [7:0] out_7seg;
	output [3:0] out_7seg_ac;
	output [4:0] m_col;
	output [6:0] m_line;
	
	wire [3:0] coord_at_linha, coord_at_coluna, status_wire, out_mux_7seg_decod,Nsel_state,sel_state,sel_matriz;
	wire [1:0] count_2_bits_mux_7seg_sel,Nstatus_wire;
	wire [34:0] m_po_in, m_at_in, m_po_out, m_at_out,m_at_clks;
	wire [6:0] m_po_line, m_at_line, sel_dmx_8_input,wire_gate_clock;
	wire [2:0] count_3_bits_mux_matriz_leds_sel, Ncount_3_bits_mux_matriz_leds_sel,sel_dmx_8_input_sel;
	wire clr_1,clr_2, clr_0, rgb_in_cod, button_confirmation, button_count;
	wire [19:0] clk_div;
	wire [5:0] at_in;
	wire [7:0] m_col_wire;
	wire [7:0] wire_map_1,wire_map_2,wire_map_3,wire_map_4,wire_map_5,wire_map_6,wire_map_7;
	wire [7:0] wire_map_8,wire_map_9,wire_map_10,wire_map_11,wire_map_12,wire_map_13,wire_map_14;
	wire MDL_andor_MDC;
	wire rgb_po_out, rgb_at_out;
	wire sel_mode_matriz;

	not(Nsel_state[3], sel_state[3]);
	not(Nsel_state[2], sel_state[2]);
	not(Nsel_state[1], sel_state[1]);
	not(Nsel_state[0], sel_state[0]);
		
	not(Nstatus_wire[1],status_wire[1]);
	not(Nstatus_wire[0],status_wire[0]);
	
	not(Ncount_3_bits_mux_matriz_leds_sel[2],count_3_bits_mux_matriz_leds_sel[2]);
	not(Ncount_3_bits_mux_matriz_leds_sel[1],count_3_bits_mux_matriz_leds_sel[1]);
	not(Ncount_3_bits_mux_matriz_leds_sel[0],count_3_bits_mux_matriz_leds_sel[0]);
	
	
	//Modulo para dividir a frequência
	
	modulo_divisor_frequencia div_1(.clr(1'b0),.q(clk_div),.clk(clk));
	
	
	// ===================================================================
	
	//Modulos de deboucing do circuito
	
	
	modulo_deboucing deboucing_1_confirmation (.push_button(button_confirmation_input),.clr(1'b1),.clk_div(clk_div[0]),.signal_bouncing(button_confirmation));
	modulo_deboucing deboucing_1_count (.push_button(button_count_input),.clr(1'b1),.clk_div(clk_div[0]),.signal_bouncing(button_count));
	
	
	// ===================================================================

	
	//Contador de 6 bits para linha e coluna
	
	modulo_contador_sync_6_bits count_6_bits_1(.clr(clr_0),.clk(button_count),.q(at_in),);
	and_gate_4_inputs gate_0_reset(.A(Nsel_state[1]),.B(at_in[2]),.C(at_in[1]),.D(at_in[0]),.S(MDL_andor_MDC),);
	or_gate_2_inputs gate_1_reset(.A(MDL_andor_MDC),.B(at_in[5]),.S(clr_0),);
	
	
	// ===================================================================
	
	
	
	// Módulos referentes a escolha do status, coluna e linha da matriz
	

	modulo_status mod_sta(.std0(hh1),.stdig0(status_wire),);
	modulo_coord_coluna mod_coord_col_1(.mdc(at_in[5:3]),.cdc(coord_at_coluna),);
	modulo_coord_linha mod_coord_linha_1(.mdl(at_in[2:0]),.cdl(coord_at_linha),);
	
	
	// ===================================================================
	
	
	// Circuito dos 7 Segmentos - Concluido 
	
	modulo_contador_sync_2_bits count_2_bits_1(.clr(clr_1),.clk(clk_div[0]),.q(count_2_bits_mux_7seg_sel),);
	or_gate_3_inputs gate_1(.A(count_2_bits_mux_7seg_sel[1]),.B(Nstatus_wire[1]),.C(status_wire[0]),.S(clr_1),);
	
	modulo_mux4_1 mux_1(.A(status_wire[3]),.B(coord_at_coluna[3]),.C(coord_at_linha[3]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[3]));
	modulo_mux4_1 mux_2(.A(status_wire[2]),.B(coord_at_coluna[2]),.C(coord_at_linha[2]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[2]));
	modulo_mux4_1 mux_3(.A(status_wire[1]),.B(coord_at_coluna[1]),.C(coord_at_linha[1]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[1]));
	modulo_mux4_1 mux_4(.A(status_wire[0]),.B(coord_at_coluna[0]),.C(coord_at_linha[0]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[0]));
	
	modulo_decodificador_bcd_ex_7seg decodificador_bcd_ex_1(.D7SEG(out_mux_7seg_decod), .OUT_SEGS(out_7seg),);
	modulo_decodificador_bcd_ex_7seg_ac decodificador_bcd_ex_ac_1(.STAC(hh1), .AC(out_7seg_ac),);
	
	// ===================================================================
	
	//Demux do botão de confirmação linkado ao status - Concluido
	
	modulo_demux1_4 demux_button_confirmation(.A(button_confirmation),.input_sel(hh1),.out(sel_state),);
	
	// ===================================================================
	
	//Contador e demultiplexador que iteram sobre a coluna da matriz - Concluido
	
	modulo_contador_sync_3_bits count_3_bits_1(.clr(clr_2),.clk(clk_div[0]),.q(count_3_bits_mux_matriz_leds_sel),);
	and_gate_2_inputs gate_2(.A(count_3_bits_mux_matriz_leds_sel[2]),.B(1'b1),.S(clr_2),);
	
	
	modulo_demux1_8 demux_col(.A(1'b1),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_col_wire),);
	and_gate_2_inputs gate_1_col(.A(m_col_wire[7]),.B(1'b1),.S(m_col[4]),);
	and_gate_2_inputs gate_2_col(.A(m_col_wire[6]),.B(1'b1),.S(m_col[3]),);
	and_gate_2_inputs gate_3_col(.A(m_col_wire[5]),.B(1'b1),.S(m_col[2]),);
	and_gate_2_inputs gate_4_col(.A(m_col_wire[4]),.B(1'b1),.S(m_col[1]),);
	and_gate_2_inputs gate_5_col(.A(m_col_wire[3]),.B(1'b1),.S(m_col[0]),);
	
	// ===================================================================
	
	//Matriz de armazenamento de posicionamento - Concluido
	
	modulo_preset_linha_1 preset_1(.HH(hh2),.cl1(m_po_in[34:30]));
	modulo_preset_linha_2 preset_2(.HH(hh2),.cl2(m_po_in[29:25]));
	modulo_preset_linha_3 preset_3(.HH(hh2),.cl3(m_po_in[24:20]));
	modulo_preset_linha_4 preset_4(.HH(hh2),.cl4(m_po_in[19:15]));
	modulo_preset_linha_5 preset_5(.HH(hh2),.cl5(m_po_in[14:10]));
	modulo_preset_linha_6 preset_6(.HH(hh2),.cl6(m_po_in[9:5]));
	modulo_preset_linha_7 preset_7(.HH(hh2),.cl7(m_po_in[4:0]));
	
	modulo_matriz_reg_po reg_matriz_po_1(.m_in(m_po_in),.clk(Nsel_state[2]),.clr(hh3),.m_out(m_po_out),);
	
	modulo_mux8_1 mux_5(.A(m_po_out[34]),.B(m_po_out[33]),.C(m_po_out[32]),.D(m_po_out[31]),.E(m_po_out[30]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_po_line[6]));
	modulo_mux8_1 mux_6(.A(m_po_out[29]),.B(m_po_out[28]),.C(m_po_out[27]),.D(m_po_out[26]),.E(m_po_out[25]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_po_line[5]));
	modulo_mux8_1 mux_7(.A(m_po_out[24]),.B(m_po_out[23]),.C(m_po_out[22]),.D(m_po_out[21]),.E(m_po_out[20]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_po_line[4]));
	modulo_mux8_1 mux_8(.A(m_po_out[19]),.B(m_po_out[18]),.C(m_po_out[17]),.D(m_po_out[16]),.E(m_po_out[15]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_po_line[3]));
	modulo_mux8_1 mux_9(.A(m_po_out[14]),.B(m_po_out[13]),.C(m_po_out[12]),.D(m_po_out[11]),.E(m_po_out[10]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_po_line[2]));
	modulo_mux8_1 mux_10(.A(m_po_out[9]),.B(m_po_out[8]),.C(m_po_out[7]),.D(m_po_out[6]),.E(m_po_out[5]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_po_line[1]));
	modulo_mux8_1 mux_11(.A(m_po_out[4]),.B(m_po_out[3]),.C(m_po_out[2]),.D(m_po_out[1]),.E(m_po_out[0]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_po_line[0]));
	modulo_mux8_1 mux_12(.A(m_po_out[6]),.B(m_po_out[5]),.C(m_po_out[4]),.D(m_po_out[3]),.E(m_po_out[2]),.F(m_po_out[1]),.G(m_po_out[0]),.H(),.input_sel(sel_dmx_8_input_sel),.out(rgb_po_out));
	
	// ===================================================================
	
	//Matriz de armazenamento de Ataque - Incompleto 02/10/2023
	
	modulo_seletor_1_8_at mod_sel_input(.mdc(at_in[5:3]),.mdl(at_in[2:0]),.dmx8_sel(sel_dmx_8_input));
	modulo_sel_1_8_demux mod_input(.mdc(at_in[5:3]),.mdl(at_in[2:0]),.dmx8_input(sel_dmx_8_input_sel));
	
	modulo_demux1_8_n_out demux_1(.A(sel_dmx_8_input[6]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_1),);
	modulo_demux1_8_n_out demux_2(.A(sel_dmx_8_input[5]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_2),);
	modulo_demux1_8_n_out demux_3(.A(sel_dmx_8_input[4]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_3),);
	modulo_demux1_8_n_out demux_4(.A(sel_dmx_8_input[3]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_4),);
	modulo_demux1_8_n_out demux_5(.A(sel_dmx_8_input[2]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_5),);
	modulo_demux1_8_n_out demux_6(.A(sel_dmx_8_input[1]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_6),);
	modulo_demux1_8_n_out demux_7(.A(sel_dmx_8_input[0]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_7),);
	
	modulo_mapeamento_mux8_1 map_1(.e(wire_map_1),.out_mapeado(m_at_in[34:30]));
	modulo_mapeamento_mux8_1 map_2(.e(wire_map_2),.out_mapeado(m_at_in[29:25]));
	modulo_mapeamento_mux8_1 map_3(.e(wire_map_3),.out_mapeado(m_at_in[24:20]));
	modulo_mapeamento_mux8_1 map_4(.e(wire_map_4),.out_mapeado(m_at_in[19:15]));
	modulo_mapeamento_mux8_1 map_5(.e(wire_map_5),.out_mapeado(m_at_in[14:10]));
	modulo_mapeamento_mux8_1 map_6(.e(wire_map_6),.out_mapeado(m_at_in[9:5]));
	modulo_mapeamento_mux8_1 map_7(.e(wire_map_7),.out_mapeado(m_at_in[4:0]));
	
	sel_clock(.sel_state(sel_dmx_8_input[6]),.bt(Nsel_state[1]),.clock_sel(wire_gate_clock[6]));
	sel_clock(.sel_state(sel_dmx_8_input[5]),.bt(Nsel_state[1]),.clock_sel(wire_gate_clock[5]));
	sel_clock(.sel_state(sel_dmx_8_input[4]),.bt(Nsel_state[1]),.clock_sel(wire_gate_clock[4]));
	sel_clock(.sel_state(sel_dmx_8_input[3]),.bt(Nsel_state[1]),.clock_sel(wire_gate_clock[3]));
	sel_clock(.sel_state(sel_dmx_8_input[2]),.bt(Nsel_state[1]),.clock_sel(wire_gate_clock[2]));
	sel_clock(.sel_state(sel_dmx_8_input[1]),.bt(Nsel_state[1]),.clock_sel(wire_gate_clock[1]));
	sel_clock(.sel_state(sel_dmx_8_input[0]),.bt(Nsel_state[1]),.clock_sel(wire_gate_clock[0]));
	
	modulo_demux1_8_n_out demux_8(.A(wire_gate_clock[6]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_8),);
	modulo_demux1_8_n_out demux_9(.A(wire_gate_clock[5]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_9),);
	modulo_demux1_8_n_out demux_10(.A(wire_gate_clock[4]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_10),);
	modulo_demux1_8_n_out demux_11(.A(wire_gate_clock[3]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_11),);
	modulo_demux1_8_n_out demux_12(.A(wire_gate_clock[2]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_12),);
	modulo_demux1_8_n_out demux_13(.A(wire_gate_clock[1]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_13),);
	modulo_demux1_8_n_out demux_14(.A(wire_gate_clock[0]),.input_sel(sel_dmx_8_input_sel),.Nout(wire_map_14),);
	
	modulo_mapeamento_mux8_1 map_8(.e(wire_map_8),.out_mapeado(m_at_clks[34:30]));
	modulo_mapeamento_mux8_1 map_9(.e(wire_map_9),.out_mapeado(m_at_clks[29:25]));
	modulo_mapeamento_mux8_1 map_10(.e(wire_map_10),.out_mapeado(m_at_clks[24:20]));
	modulo_mapeamento_mux8_1 map_11(.e(wire_map_11),.out_mapeado(m_at_clks[19:15]));
	modulo_mapeamento_mux8_1 map_12(.e(wire_map_12),.out_mapeado(m_at_clks[14:10]));
	modulo_mapeamento_mux8_1 map_13(.e(wire_map_13),.out_mapeado(m_at_clks[9:5]));
	modulo_mapeamento_mux8_1 map_14(.e(wire_map_14),.out_mapeado(m_at_clks[4:0]));
	
	modulo_matriz_reg_at reg_matriz_at_1(.m_in(m_at_in),.clk(m_at_clks),.clr(hh3),.m_out(m_at_out),);
	
	modulo_mux8_1 mux_13(.A(m_at_out[34]),.B(m_at_out[33]),.C(m_at_out[32]),.D(m_at_out[31]),.E(m_at_out[30]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_at_line[6]));
	modulo_mux8_1 mux_14(.A(m_at_out[29]),.B(m_at_out[28]),.C(m_at_out[27]),.D(m_at_out[26]),.E(m_at_out[25]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_at_line[5]));
	modulo_mux8_1 mux_15(.A(m_at_out[24]),.B(m_at_out[23]),.C(m_at_out[22]),.D(m_at_out[21]),.E(m_at_out[20]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_at_line[4]));
	modulo_mux8_1 mux_16(.A(m_at_out[19]),.B(m_at_out[18]),.C(m_at_out[17]),.D(m_at_out[16]),.E(m_at_out[15]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_at_line[3]));
	modulo_mux8_1 mux_17(.A(m_at_out[14]),.B(m_at_out[13]),.C(m_at_out[12]),.D(m_at_out[11]),.E(m_at_out[10]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_at_line[2]));
	modulo_mux8_1 mux_18(.A(m_at_out[9]),.B(m_at_out[8]),.C(m_at_out[7]),.D(m_at_out[6]),.E(m_at_out[5]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_at_line[1]));
	modulo_mux8_1 mux_19(.A(m_at_out[4]),.B(m_at_out[3]),.C(m_at_out[2]),.D(m_at_out[1]),.E(m_at_out[0]),.F(),.G(),.H(),.input_sel(sel_matriz),.out(m_at_line[0]));
	modulo_mux8_1 mux_20(.A(m_at_line[6]),.B(m_at_line[5]),.C(m_at_line[4]),.D(m_at_line[3]),.E(m_at_line[2]),.F(m_at_line[1]),.G(m_at_line[0]),.H(),.input_sel(sel_dmx_8_input_sel),.out(rgb_at_out));
	
	// ===================================================================
	
	modulo_rgb_sel_out rgb_input(.std(hh1),.bt(Nsel_state[1]),.po(rgb_po_out),.at(rgb_at_out),.out_rgb(rgb_output));
	
	modulo_sel_matriz sel_mode_matriz_mod(.std(hh1),.out_sel(sel_mode_matriz));
	modulo_mux2_1 mux_28(.A(count_3_bits_mux_matriz_leds_sel[2]),.B(sel_dmx_8_input_sel[2]),.SEL(sel_mode_matriz),.OUT(sel_matriz[2]));
	modulo_mux2_1 mux_29(.A(count_3_bits_mux_matriz_leds_sel[1]),.B(sel_dmx_8_input_sel[1]),.SEL(sel_mode_matriz),.OUT(sel_matriz[1]));
	modulo_mux2_1 mux_30(.A(count_3_bits_mux_matriz_leds_sel[0]),.B(sel_dmx_8_input_sel[0]),.SEL(sel_mode_matriz),.OUT(sel_matriz[0]));

	//Multiplexadores da saídas da matriz finais;
	
	modulo_mux4_1 mux_21(.A(1'b1),.B(m_po_line[6]),.C(m_at_line[6]),.D(m_po_line[6]),.input_sel(hh1),.out(m_line[6]),);
	modulo_mux4_1 mux_22(.A(1'b1),.B(m_po_line[5]),.C(m_at_line[5]),.D(m_po_line[5]),.input_sel(hh1),.out(m_line[5]),);
	modulo_mux4_1 mux_23(.A(1'b1),.B(m_po_line[4]),.C(m_at_line[4]),.D(m_po_line[4]),.input_sel(hh1),.out(m_line[4]),);
	modulo_mux4_1 mux_24(.A(1'b1),.B(m_po_line[3]),.C(m_at_line[3]),.D(m_po_line[3]),.input_sel(hh1),.out(m_line[3]),);
	modulo_mux4_1 mux_25(.A(1'b1),.B(m_po_line[2]),.C(m_at_line[2]),.D(m_po_line[2]),.input_sel(hh1),.out(m_line[2]),);
	modulo_mux4_1 mux_26(.A(1'b1),.B(m_po_line[1]),.C(m_at_line[1]),.D(m_po_line[1]),.input_sel(hh1),.out(m_line[1]),);
	modulo_mux4_1 mux_27(.A(1'b1),.B(m_po_line[0]),.C(m_at_line[0]),.D(m_po_line[0]),.input_sel(hh1),.out(m_line[0]),);
	
	//=================================================================

endmodule 