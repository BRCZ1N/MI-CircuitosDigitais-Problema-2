module pbl(hh1,hh2,at_in,button_confirmation, clk,out_7seg,out_7seg_ac,m_col,m_line, rgb_output);

	input [1:0] hh1,hh2;
	input button_confirmation, clk;
	input [5:0] at_in;
	
	output [1:0] rgb_output;
	output [7:0] out_7seg;
	output [3:0] out_7seg_ac;
	output [4:0] m_col;
	output [6:0] m_line;
	
	wire [3:0] coord_at_linha, coord_at_coluna, status_wire, out_mux_7seg_decod,sel_state,Nsel_state;
	wire [1:0] count_2_bits_mux_7seg_sel,Nstatus_wire;
	wire [34:0] m_po_in, N_m_at_in,m_po_out, m_at_out;
	wire [34:0] m_at_in_aux;
	wire [6:0] m_po_line, m_at_line;
	wire [2:0] count_3_bits_mux_matriz_leds_sel, Ncount_3_bits_mux_matriz_leds_sel;
	wire clr_1,clr_2,clk_div,Nbutton_confirmation,rgb_po_out;
	wire [7:0] m_col_wire;
	wire [5:0] sel_dmx_mx_35_1;

	not (Nbutton_confirmation, button_confirmation);
	
	not(Nstatus_wire[1],status_wire[1]);
	not(Nstatus_wire[0],status_wire[0]);
	
	not(Nsel_state[3],sel_state[3]);
	not(Nsel_state[2],sel_state[2]);
	not(Nsel_state[1],sel_state[1]);
	not(Nsel_state[0],sel_state[0]);
	
	
	not(Ncount_3_bits_mux_matriz_leds_sel[2],count_3_bits_mux_matriz_leds_sel[2]);
	not(Ncount_3_bits_mux_matriz_leds_sel[1],count_3_bits_mux_matriz_leds_sel[1]);
	not(Ncount_3_bits_mux_matriz_leds_sel[0],count_3_bits_mux_matriz_leds_sel[0]);
	
	
	//Modulo para dividir a frequência
	
	modulo_divisor_frequencia div_1(.clr(1'b0),.clk_div(clk_div),.clk(clk));
	
	
	// ===================================================================
	
	
	// Módulos referentes a escolha do status, coluna e linha da matriz
	

	modulo_status mod_sta(.std0(hh1),.stdig0(status_wire),);
	modulo_coord_coluna mod_coord_col_1(.mdc(at_in[2:0]),.cdc(coord_at_coluna),);
	modulo_coord_linha mod_coord_linha_1(.mdl(at_in[5:3]),.cdl(coord_at_linha),);
	
	
	// ===================================================================
	
	
	// Circuito dos 7 Segmentos - Concluido 
	
	modulo_contador_sync_2_bits count_2_bits_1(.clr(clr_1),.clk(clk_div),.q(count_2_bits_mux_7seg_sel),);
	
	modulo_mux4_1 mux_1(.A(status_wire[3]),.B(coord_at_linha[3]),.C(coord_at_coluna[3]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[3]));
	modulo_mux4_1 mux_2(.A(status_wire[2]),.B(coord_at_linha[2]),.C(coord_at_coluna[2]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[2]));
	modulo_mux4_1 mux_3(.A(status_wire[1]),.B(coord_at_linha[1]),.C(coord_at_coluna[1]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[1]));
	modulo_mux4_1 mux_4(.A(status_wire[0]),.B(coord_at_linha[0]),.C(coord_at_coluna[0]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[0]));
	
	modulo_decodificador_bcd_ex_7seg decodificador_bcd_ex_1(.D7SEG(out_mux_7seg_decod), .OUT_SEGS(out_7seg),);
	modulo_clear_and_reset_AC decodificador_ac_and_reset_count(.STA(hh1),.Q(count_2_bits_mux_7seg_sel),.CLR_RESET(clr_1),.AC(out_7seg_ac));
	
	// ===================================================================
	
	//Demux do botão de confirmação linkado ao status - Concluido
	
	modulo_demux1_4 demux_button_confirmation(.A(Nbutton_confirmation),.input_sel(hh1),.out(sel_state),);
	
	// ===================================================================
	
	//Contador e demultiplexador que iteram sobre a coluna da matriz - Concluido
	
	modulo_contador_sync_3_bits count_3_bits_1(.clr(clr_2),.clk(clk_div),.q(count_3_bits_mux_matriz_leds_sel),);
	and_gate_2_inputs gate_2(.A(count_3_bits_mux_matriz_leds_sel[2]),.B(1'b1),.S(clr_2),);
	
	modulo_demux1_8 demux_col(.A(1'b1),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_col_wire),);
	and_gate_2_inputs gate_1_col(.A(m_col_wire[7]),.B(1'b1),.S(m_col[4]),);
	and_gate_2_inputs gate_2_col(.A(m_col_wire[6]),.B(1'b1),.S(m_col[3]),);
	and_gate_2_inputs gate_3_col(.A(m_col_wire[5]),.B(1'b1),.S(m_col[2]),);
	and_gate_2_inputs gate_4_col(.A(m_col_wire[4]),.B(1'b1),.S(m_col[1]),);
	and_gate_2_inputs gate_5_col(.A(m_col_wire[3]),.B(1'b1),.S(m_col[0]),);
	
	// ===================================================================
	
	modulo_dmx_mx_35_sel dmx_1(.mdc(at_in[2:0]),.mdl(at_in[5:3]),.SEL35E(sel_dmx_mx_35_1));
	
	//Matriz de armazenamento de posicionamento - Concluido
	
	modulo_preset_linha_1 preset_1(.HH(hh2),.cl1(m_po_in[34:30]));
	modulo_preset_linha_2 preset_2(.HH(hh2),.cl2(m_po_in[29:25]));
	modulo_preset_linha_3 preset_3(.HH(hh2),.cl3(m_po_in[24:20]));
	modulo_preset_linha_4 preset_4(.HH(hh2),.cl4(m_po_in[19:15]));
	modulo_preset_linha_5 preset_5(.HH(hh2),.cl5(m_po_in[14:10]));
	modulo_preset_linha_6 preset_6(.HH(hh2),.cl6(m_po_in[9:5]));
	modulo_preset_linha_7 preset_7(.HH(hh2),.cl7(m_po_in[4:0]));
	
	modulo_matriz_reg_po reg_matriz_po_1(.m_in(m_po_in),.clk(Nsel_state[2]),.clr(1'b1),.m_out(m_po_out),);
	
	modulo_mux8_1 mux_5(.A(m_po_out[34]),.B(m_po_out[33]),.C(m_po_out[32]),.D(m_po_out[31]),.E(m_po_out[30]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[6]));
	modulo_mux8_1 mux_6(.A(m_po_out[29]),.B(m_po_out[28]),.C(m_po_out[27]),.D(m_po_out[26]),.E(m_po_out[25]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[5]));
	modulo_mux8_1 mux_7(.A(m_po_out[24]),.B(m_po_out[23]),.C(m_po_out[22]),.D(m_po_out[21]),.E(m_po_out[20]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[4]));
	modulo_mux8_1 mux_8(.A(m_po_out[19]),.B(m_po_out[18]),.C(m_po_out[17]),.D(m_po_out[16]),.E(m_po_out[15]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[3]));
	modulo_mux8_1 mux_9(.A(m_po_out[14]),.B(m_po_out[13]),.C(m_po_out[12]),.D(m_po_out[11]),.E(m_po_out[10]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[2]));
	modulo_mux8_1 mux_10(.A(m_po_out[9]),.B(m_po_out[8]),.C(m_po_out[7]),.D(m_po_out[6]),.E(m_po_out[5]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[1]));
	modulo_mux8_1 mux_11(.A(m_po_out[4]),.B(m_po_out[3]),.C(m_po_out[2]),.D(m_po_out[1]),.E(m_po_out[0]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[0]));
	
	modulo_mux35_1 mux_12_rgb_out_po(.A(m_po_out),.input_sel(sel_dmx_mx_35_1),.out(rgb_po_out));
	
	modulo_rgb_sel_out rgb_input(.std(hh1),.bt(Nsel_state[1]),.at(rgb_po_out),.out_rgb_r(rgb_output[1]),.out_rgb_g(rgb_output[0]));
	
	// ===================================================================
	
	//Matriz de armazenamento de Ataque - Concluido
	
	modulo_demux1_35(.A(Nsel_state[1]),.input_sel(sel_dmx_mx_35_1),.out(m_at_in_aux));
	
	modulo_matriz_reg_at reg_matriz_at_1(.m_in(m_po_out),.clk(m_at_in_aux),.clr(1'b1),.m_out(m_at_out),);
	
	modulo_mux8_1 mux_13(.A(m_at_out[34]),.B(m_at_out[33]),.C(m_at_out[32]),.D(m_at_out[31]),.E(m_at_out[30]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[6]));
	modulo_mux8_1 mux_14(.A(m_at_out[29]),.B(m_at_out[28]),.C(m_at_out[27]),.D(m_at_out[26]),.E(m_at_out[25]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[5]));
	modulo_mux8_1 mux_15(.A(m_at_out[24]),.B(m_at_out[23]),.C(m_at_out[22]),.D(m_at_out[21]),.E(m_at_out[20]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[4]));
	modulo_mux8_1 mux_16(.A(m_at_out[19]),.B(m_at_out[18]),.C(m_at_out[17]),.D(m_at_out[16]),.E(m_at_out[15]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[3]));
	modulo_mux8_1 mux_17(.A(m_at_out[14]),.B(m_at_out[13]),.C(m_at_out[12]),.D(m_at_out[11]),.E(m_at_out[10]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[2]));
	modulo_mux8_1 mux_18(.A(m_at_out[9]),.B(m_at_out[8]),.C(m_at_out[7]),.D(m_at_out[6]),.E(m_at_out[5]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[1]));
	modulo_mux8_1 mux_19(.A(m_at_out[4]),.B(m_at_out[3]),.C(m_at_out[2]),.D(m_at_out[1]),.E(m_at_out[0]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[0]));
	
	// ===================================================================
	
	//Multiplexadores da saídas da matriz finais
	
	modulo_mux2_1 mux_21(.A(m_po_line[6]),.B(m_at_line[6]),.SEL(hh1[1]),.OUT(m_line[6]),);
	modulo_mux2_1 mux_22(.A(m_po_line[5]),.B(m_at_line[5]),.SEL(hh1[1]),.OUT(m_line[5]),);
	modulo_mux2_1 mux_23(.A(m_po_line[4]),.B(m_at_line[4]),.SEL(hh1[1]),.OUT(m_line[4]),);
	modulo_mux2_1 mux_24(.A(m_po_line[3]),.B(m_at_line[3]),.SEL(hh1[1]),.OUT(m_line[3]),);
	modulo_mux2_1 mux_25(.A(m_po_line[2]),.B(m_at_line[2]),.SEL(hh1[1]),.OUT(m_line[2]),);
	modulo_mux2_1 mux_26(.A(m_po_line[1]),.B(m_at_line[1]),.SEL(hh1[1]),.OUT(m_line[1]),);
	modulo_mux2_1 mux_27(.A(m_po_line[0]),.B(m_at_line[0]),.SEL(hh1[1]),.OUT(m_line[0]),);
	
	//=================================================================

endmodule 