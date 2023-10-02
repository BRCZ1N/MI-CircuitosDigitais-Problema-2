module pbl(hh1,hh2,out_7seg,out_7seg_ac,button_confirmation,button_count,clk,m_col,m_line, rgb_output);

	input button_confirmation, button_count, clk;
	input [1:0] hh1;
	input [1:0] hh2;
	output [1:0] rgb_output;
	output [7:0] out_7seg;
	output [3:0] out_7seg_ac;
	output [4:0] m_col;
	output [6:0] m_line;
	wire [3:0] coord_at_linha, coord_at_coluna, status_wire, out_mux_7seg_decod,sel_dmx_mx_16,Nsel_state,sel_state;
	wire [1:0] count_2_bits_mux_7seg_sel,Nstatus_wire,sel_dmx_mx_4, sel_matriz;
	wire [34:0] m_po_in, m_at_in;
	wire [34:0] m_po_out, m_at_out;
	wire [6:0] m_po_line, m_at_line, Nm_at_line;
	wire [2:0] count_3_bits_mux_matriz_leds_sel, Ncount_3_bits_mux_matriz_leds_sel;
	wire [34:0] m_at_clks;
	wire [15:0] demux1_16_out_1_e, demux1_16_out_1_c;
	wire clr_1,clr_2, clr_0, rgb_in_cod, out_deboucing;
	wire [19:0] clk_div;
	wire [8:0] m_at_line_rgb_select;
	wire [5:0] at_in;
	wire [7:0] m_col_wire;

	not(Nsel_state[3], sel_state[3]);
	not(Nsel_state[2], sel_state[2]);
	not(Nsel_state[1], sel_state[1]);
	not(Nsel_state[0], sel_state[0]);
	
	not(Nm_at_line[6],m_at_line[6]);
	not(Nm_at_line[5],m_at_line[5]);
	not(Nm_at_line[4],m_at_line[4]);
	not(Nm_at_line[3],m_at_line[3]);
	not(Nm_at_line[2],m_at_line[2]);
	not(Nm_at_line[1],m_at_line[1]);
	not(Nm_at_line[0],m_at_line[0]);
	
	not(Nstatus_wire[1],status_wire[1]);
	not(Nstatus_wire[0],status_wire[0]);
	
	not(Ncount_3_bits_mux_matriz_leds_sel[2],count_3_bits_mux_matriz_leds_sel[2]);
	not(Ncount_3_bits_mux_matriz_leds_sel[1],count_3_bits_mux_matriz_leds_sel[1]);
	not(Ncount_3_bits_mux_matriz_leds_sel[0],count_3_bits_mux_matriz_leds_sel[0]);
	
	modulo_status mod_sta(.std0(hh1),.stdig0(status_wire),);
	modulo_coord_linha mod_coord_linha_1(.mdl(at_in[5:3]),.cdl(coord_at_linha),);
	modulo_coord_coluna mod_coord_col_1(.mdc(at_in[2:0]),.cdc(coord_at_coluna),);
	
	modulo_divisor_frequencia div_1(.clr(1'b0),.q(clk_div),.clk(clk));
	
	modulo_contador_sync_6_bits count_6_bits_1(.clr(clr_0),.clk(button_confirm),.q(at_in),);

	
	//RESET DO CONTADOR
	
	//AQ
	wire  MDL_andor_MDC;
	and_gate_4_inputs gate_0_reset(.A(Nsel_state[1]),.B(at_in[2]),.C(at_in[1]),.D(at_in[0]),.S(MDL_andor_MDC),);
	or_gate_2_inputs gate_1_reset(.A(MDL_andor_MDC),.B(at_in[5]),.S(clr_0),);
	
	// Circuito dos 7 Segmentos - Concluido 
	
	modulo_contador_sync_2_bits count_2_bits_1(.clr(clr_1),.clk(clk_div[0]),.q(count_2_bits_mux_7seg_sel),);
	or_gate_3_inputs gate_1(.A(count_2_bits_mux_7seg_sel[1]),.B(Nstatus_wire[1]),.C(status_wire[0]),.S(clr_1),);
	
	//modulo_mux4_1 mux_1(.A(),.B(),.C(),.D(),.input_sel(),.out());
	modulo_mux4_1 mux_1(.A(status_wire[3]),.B(coord_at_coluna[3]),.C(coord_at_linha[3]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[3]));
	modulo_mux4_1 mux_2(.A(status_wire[2]),.B(coord_at_coluna[2]),.C(coord_at_linha[2]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[2]));
	modulo_mux4_1 mux_3(.A(status_wire[1]),.B(coord_at_coluna[1]),.C(coord_at_linha[1]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[1]));
	modulo_mux4_1 mux_4(.A(status_wire[0]),.B(coord_at_coluna[0]),.C(coord_at_linha[0]),.D(1'b1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[0]));
	
	modulo_decodificador_bcd_ex_7seg decodificador_bcd_ex_1(.D7SEG(out_mux_7seg_decod), .OUT_SEGS(out_7seg),);
	modulo_decodificador_bcd_ex_7seg_ac decodificador_bcd_ex_ac_1(.STAC(hh1), .AC(out_7seg_ac),);
	
	// ==========================
	
	modulo_demux1_4 demux_button_confirmation(.A(button_confirmation),.input_sel(hh1),.out(sel_state),);
	
	modulo_demux1_8 demux_col(.A(1'b1),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_col_wire),);
	and_gate_2_inputs gate_1_col(.A(m_col_wire[7]),.B(1'b1),.S(m_col[4]),);
	and_gate_2_inputs gate_2_col(.A(m_col_wire[6]),.B(1'b1),.S(m_col[3]),);
	and_gate_2_inputs gate_3_col(.A(m_col_wire[5]),.B(1'b1),.S(m_col[2]),);
	and_gate_2_inputs gate_4_col(.A(m_col_wire[4]),.B(1'b1),.S(m_col[1]),);
	and_gate_2_inputs gate_5_col(.A(m_col_wire[3]),.B(1'b1),.S(m_col[0]),);
	
	
	modulo_contador_sync_3_bits count_3_bits_1(.clr(clr_2),.clk(clk_div[0]),.q(count_3_bits_mux_matriz_leds_sel),);
	and_gate_2_inputs gate_2(.A(count_3_bits_mux_matriz_leds_sel[2]),.B(1'b1),.S(clr_2),);
	
	//Matriz de armazenamento de posicionamento
	
	modulo_preset_linha_1 preset_1(.HH(hh2),.cl1(m_po_in[34:30]));
	modulo_preset_linha_2 preset_2(.HH(hh2),.cl2(m_po_in[29:25]));
	modulo_preset_linha_3 preset_3(.HH(hh2),.cl3(m_po_in[24:20]));
	modulo_preset_linha_4 preset_4(.HH(hh2),.cl4(m_po_in[19:15]));
	modulo_preset_linha_5 preset_5(.HH(hh2),.cl5(m_po_in[14:10]));
	modulo_preset_linha_6 preset_6(.HH(hh2),.cl6(m_po_in[9:5]));
	modulo_preset_linha_7 preset_7(.HH(hh2),.cl7(m_po_in[4:0]));
	
	modulo_matriz_reg_po reg_matriz_po_1(.m_in(m_po_in),.clk(Nsel_state[2]),.clr(Nsel_state[0]),.m_out(m_po_out),);
	
	modulo_mux8_1 mux_5(.A(m_po_out[34]),.B(m_po_out[33]),.C(m_po_out[32]),.D(m_po_out[31]),.E(m_po_out[30]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[6]));
	modulo_mux8_1 mux_6(.A(m_po_out[29]),.B(m_po_out[28]),.C(m_po_out[27]),.D(m_po_out[26]),.E(m_po_out[25]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[5]));
	modulo_mux8_1 mux_7(.A(m_po_out[24]),.B(m_po_out[23]),.C(m_po_out[22]),.D(m_po_out[21]),.E(m_po_out[20]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[4]));
	modulo_mux8_1 mux_8(.A(m_po_out[19]),.B(m_po_out[18]),.C(m_po_out[17]),.D(m_po_out[16]),.E(m_po_out[15]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[3]));
	modulo_mux8_1 mux_9(.A(m_po_out[14]),.B(m_po_out[13]),.C(m_po_out[12]),.D(m_po_out[11]),.E(m_po_out[10]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[2]));
	modulo_mux8_1 mux_10(.A(m_po_out[9]),.B(m_po_out[8]),.C(m_po_out[7]),.D(m_po_out[6]),.E(m_po_out[5]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[1]));
	modulo_mux8_1 mux_11(.A(m_po_out[4]),.B(m_po_out[3]),.C(m_po_out[2]),.D(m_po_out[1]),.E(m_po_out[0]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[0]));
	
	//============================================
	
	//Matriz de armazenamento de Ataque
	
	modulo_seletor_1_16_at mod_sel_demux_1_16_1(.mdc(at_in[5:3]),.mdl(at_in[2:0]),.dmx16_sel(sel_dmx_mx_16));
	modulo_seletor_1_4_at mod_sel_demux_1_4_1(.mdc(at_in[5:3]),.mdl(at_in[2:0]),.dmx4_sel(sel_dmx_mx_4));
	
	modulo_demux1_16 demux_11(.A(Nsel_state[1]),.input_sel(sel_dmx_mx_16),.out(demux1_16_out_1_c));
	modulo_demux1_4 demux_12(.A(demux1_16_out_1_c[15]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[34:31]),);
	modulo_demux1_4 demux_13(.A(demux1_16_out_1_c[14]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[30:27]),);
	modulo_demux1_4 demux_14(.A(demux1_16_out_1_c[13]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[26:23]),);
	modulo_demux1_4 demux_15(.A(demux1_16_out_1_c[12]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[22:19]),);
	modulo_demux1_4 demux_16(.A(demux1_16_out_1_c[11]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[18:15]),);
	modulo_demux1_4 demux_17(.A(demux1_16_out_1_c[10]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[14:11]),);
	modulo_demux1_4 demux_18(.A(demux1_16_out_1_c[9]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[10:7]),);
	modulo_demux1_4 demux_19(.A(demux1_16_out_1_c[8]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[6:3]),);
	modulo_demux1_4 demux_20(.A(demux1_16_out_1_c[7]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[2:0]),);
	
	modulo_demux1_16 demux_1(.A(1'b0),.input_sel(sel_dmx_mx_16),.out(demux1_16_out_1_e));
	modulo_demux1_4 demux_2(.A(demux1_16_out_1_e[15]),.input_sel(sel_dmx_mx_4),.out(m_at_in[34:31]),);
	modulo_demux1_4 demux_3(.A(demux1_16_out_1_e[14]),.input_sel(sel_dmx_mx_4),.out(m_at_in[30:27]),);
	modulo_demux1_4 demux_4(.A(demux1_16_out_1_e[13]),.input_sel(sel_dmx_mx_4),.out(m_at_in[26:23]),);
	modulo_demux1_4 demux_5(.A(demux1_16_out_1_e[12]),.input_sel(sel_dmx_mx_4),.out(m_at_in[22:19]),);
	modulo_demux1_4 demux_6(.A(demux1_16_out_1_e[11]),.input_sel(sel_dmx_mx_4),.out(m_at_in[18:15]),);
	modulo_demux1_4 demux_7(.A(demux1_16_out_1_e[10]),.input_sel(sel_dmx_mx_4),.out(m_at_in[14:11]),);
	modulo_demux1_4 demux_8(.A(demux1_16_out_1_e[9]),.input_sel(sel_dmx_mx_4),.out(m_at_in[10:7]),);
	modulo_demux1_4 demux_9(.A(demux1_16_out_1_e[8]),.input_sel(sel_dmx_mx_4),.out(m_at_in[6:3]),);
	modulo_demux1_4 demux_10(.A(demux1_16_out_1_e[7]),.input_sel(sel_dmx_mx_4),.out(m_at_in[2:0]),);
	
	modulo_matriz_reg_at reg_matriz_at_1(.m_in(m_at_in),.clk(m_at_clks),.clr(Nsel_state[0]),.m_out(m_at_out),);
	
	modulo_mux8_1 mux_12(.A(m_at_out[34]),.B(m_at_out[33]),.C(m_at_out[32]),.D(m_at_out[31]),.E(m_at_out[30]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[6]));
	modulo_mux8_1 mux_13(.A(m_at_out[29]),.B(m_at_out[28]),.C(m_at_out[27]),.D(m_at_out[26]),.E(m_at_out[25]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[5]));
	modulo_mux8_1 mux_14(.A(m_at_out[24]),.B(m_at_out[23]),.C(m_at_out[22]),.D(m_at_out[21]),.E(m_at_out[20]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[4]));
	modulo_mux8_1 mux_15(.A(m_at_out[19]),.B(m_at_out[18]),.C(m_at_out[17]),.D(m_at_out[16]),.E(m_at_out[15]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[3]));
	modulo_mux8_1 mux_16(.A(m_at_out[14]),.B(m_at_out[13]),.C(m_at_out[12]),.D(m_at_out[11]),.E(m_at_out[10]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[2]));
	modulo_mux8_1 mux_17(.A(m_at_out[9]),.B(m_at_out[8]),.C(m_at_out[7]),.D(m_at_out[6]),.E(m_at_out[5]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[1]));
	modulo_mux8_1 mux_18(.A(m_at_out[4]),.B(m_at_out[3]),.C(m_at_out[2]),.D(m_at_out[1]),.E(m_at_out[0]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[0]));
	
	modulo_mux16_1 mux_19(.A(m_at_line_rgb_select[8]),.B(m_at_line_rgb_select[7]),.C(m_at_line_rgb_select[6]),.D(m_at_line_rgb_select[5]),.E(m_at_line_rgb_select[4]),.F(m_at_line_rgb_select[3]),.G(m_at_line_rgb_select[2]),.H(m_at_line_rgb_select[1]),.I(m_at_line_rgb_select[0]),.J(),.K(),.L(),.M(),.N(),.O(),.input_sel(sel_dmx_mx_16),.out(rgb_in_cod),);
	
	modulo_mux4_1 mux_20(.A(m_at_out[34]),.B(m_at_out[33]),.C(m_at_out[32]),.D(m_at_out[31]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[8]),);
	modulo_mux4_1 mux_21(.A(m_at_out[30]),.B(m_at_out[29]),.C(m_at_out[28]),.D(m_at_out[27]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[7]),);
	modulo_mux4_1 mux_22(.A(m_at_out[26]),.B(m_at_out[25]),.C(m_at_out[24]),.D(m_at_out[23]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[6]),);
	modulo_mux4_1 mux_23(.A(m_at_out[22]),.B(m_at_out[21]),.C(m_at_out[20]),.D(m_at_out[19]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[5]),);
	modulo_mux4_1 mux_24(.A(m_at_out[18]),.B(m_at_out[17]),.C(m_at_out[16]),.D(m_at_out[15]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[4]),);
	modulo_mux4_1 mux_25(.A(m_at_out[14]),.B(m_at_out[13]),.C(m_at_out[12]),.D(m_at_out[11]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[3]),);
	modulo_mux4_1 mux_26(.A(m_at_out[10]),.B(m_at_out[9]),.C(m_at_out[8]),.D(m_at_out[7]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[2]),);
	modulo_mux4_1 mux_27(.A(m_at_out[6]),.B(m_at_out[5]),.C(m_at_out[4]),.D(m_at_out[3]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[1]),);
	modulo_mux4_1 mux_28(.A(m_at_out[2]),.B(m_at_out[1]),.C(m_at_out[0]),.D(),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[0]),);
	
	modulo_mux4_1 mux_29(.A(1'b1),.B(m_po_line[6]),.C(m_at_line[6]),.D(m_po_line[6]),.input_sel(hh1),.out(m_line[6]),);
	modulo_mux4_1 mux_30(.A(1'b1),.B(m_po_line[5]),.C(m_at_line[5]),.D(m_po_line[5]),.input_sel(hh1),.out(m_line[5]),);
	modulo_mux4_1 mux_31(.A(1'b1),.B(m_po_line[4]),.C(m_at_line[4]),.D(m_po_line[4]),.input_sel(hh1),.out(m_line[4]),);
	modulo_mux4_1 mux_32(.A(1'b1),.B(m_po_line[3]),.C(m_at_line[3]),.D(m_po_line[3]),.input_sel(hh1),.out(m_line[3]),);
	modulo_mux4_1 mux_33(.A(1'b1),.B(m_po_line[2]),.C(m_at_line[2]),.D(m_po_line[2]),.input_sel(hh1),.out(m_line[2]),);
	modulo_mux4_1 mux_34(.A(1'b1),.B(m_po_line[1]),.C(m_at_line[1]),.D(m_po_line[1]),.input_sel(hh1),.out(m_line[1]),);
	modulo_mux4_1 mux_35(.A(1'b1),.B(m_po_line[0]),.C(m_at_line[0]),.D(m_po_line[0]),.input_sel(hh1),.out(m_line[0]),);
	
	
	//=================================================================

endmodule 