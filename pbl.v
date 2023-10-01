module pbl(hh1,hh2,out_7seg,out_7seg_ac,button_confirmation, clk, m_col, m_line, test);

	output [3:0]test;
	input button_confirmation, clk;
	input [1:0] hh1;
	input [5:0] hh2;
	output [7:0] out_7seg;
	output [3:0] out_7seg_ac;
	output [7:0] m_col;
	output [6:0] m_line;
	wire [3:0] coord_at_linha, coord_at_coluna, status_wire, out_mux_7seg_decod,sel_dmx_mx_16,Nsel_state,sel_state;
	wire [1:0] count_2_bits_mux_7seg_sel,Nstatus_wire,sel_dmx_mx_4, sel_matriz;
	wire [34:0] m_po_in, m_at_in;
	wire [34:0] m_po_out, m_at_out;
	wire [6:0] m_po_line, m_at_line, Nm_at_line;
	wire [2:0] count_3_bits_mux_matriz_leds_sel, Ncount_3_bits_mux_matriz_leds_sel;
	wire [34:0] m_at_clks;
	wire [15:0] demux1_16_out_1_e, demux1_16_out_1_c;
	wire clr_1,clr_2, rgb_in_cod, out_deboucing;
	wire [19:0] clk_div;
	wire [8:0] m_at_line_rgb_select;
	wire [3:0] status_coord_c_coord_l_1, status_coord_c_coord_l_2, status_coord_c_coord_l_3, status_coord_c_coord_l_4;
	wire [7:0] m_po_out_w1, m_po_out_w2, m_po_out_w3, m_po_out_w4, m_po_out_w5, m_po_out_w6, m_po_out_w7;
	wire [7:0] m_at_out_w1, m_at_out_w2, m_at_out_w3, m_at_out_w4, m_at_out_w5, m_at_out_w6, m_at_out_w7;
	wire [3:0] v_status_1, v_status_2, v_status_3, v_status_4, v_status_5, v_status_6, v_status_7;
	
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
	modulo_coord_linha mod_coord_linha_1(.mdl(hh2[5:3]),.cdl(coord_at_linha),);
	modulo_coord_coluna mod_coord_col_1(.mdc(hh2[2:0]),.cdc(coord_at_coluna),);
	
	modulo_divisor_frequencia div_1(.clr(1'b0),.q(clk_div),.clk(clk));
	
	// Circuito dos 7 Segmentos - Concluido 
	
	modulo_contador_sync_2_bits count_2_bits_1(.clr(clr_1),.clk(clk_div[19]),.q(count_2_bits_mux_7seg_sel),);
	or_gate_3_inputs gate_1(.A(count_2_bits_mux_7seg_sel[1]),.B(Nstatus_wire[1]),.C(status_wire[0]),.S(clr_1),);
	
	and_gate_2_inputs gate_3(.A(1'b1),.B(status_wire[3]),.S(status_coord_c_coord_l_1[3]));
	and_gate_2_inputs gate_4(.A(1'b1),.B(coord_at_coluna[3]),.S(status_coord_c_coord_l_1[2]));
	and_gate_2_inputs gate_5(.A(1'b1),.B(coord_at_linha[3]),.S(status_coord_c_coord_l_1[1]));
	and_gate_2_inputs gate_6(.A(1'b1),.B(1'b1),.S(status_coord_c_coord_l_1[0]));
	
	and_gate_2_inputs gate_7(.A(1'b1),.B(status_wire[2]),.S(status_coord_c_coord_l_2[3]));
	and_gate_2_inputs gate_8(.A(1'b1),.B(coord_at_coluna[2]),.S(status_coord_c_coord_l_2[2]));
	and_gate_2_inputs gate_9(.A(1'b1),.B(coord_at_linha[2]),.S(status_coord_c_coord_l_2[1]));
	and_gate_2_inputs gate_10(.A(1'b1),.B(1'b1),.S(status_coord_c_coord_l_2[0]));
	
	and_gate_2_inputs gate_11(.A(1'b1),.B(status_wire[1]),.S(status_coord_c_coord_l_3[3]));
	and_gate_2_inputs gate_12(.A(1'b1),.B(coord_at_coluna[1]),.S(status_coord_c_coord_l_3[2]));
	and_gate_2_inputs gate_13(.A(1'b1),.B(coord_at_linha[1]),.S(status_coord_c_coord_l_3[1]));
	and_gate_2_inputs gate_14(.A(1'b1),.B(1'b1),.S(status_coord_c_coord_l_3[0]));
	
	and_gate_2_inputs gate_15(.A(1'b1),.B(status_wire[0]),.S(status_coord_c_coord_l_4[3]));
	and_gate_2_inputs gate_16(.A(1'b1),.B(coord_at_coluna[0]),.S(status_coord_c_coord_l_4[2]));
	and_gate_2_inputs gate_17(.A(1'b1),.B(coord_at_linha[0]),.S(status_coord_c_coord_l_4[1]));
	and_gate_2_inputs gate_18(.A(1'b1),.B(1'b1),.S(status_coord_c_coord_l_4[0]));
	
	modulo_mux4_1 mux_1(.input_e(status_coord_c_coord_l_1),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[3]),);
	modulo_mux4_1 mux_2(.input_e(status_coord_c_coord_l_2),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[2]),);
	modulo_mux4_1 mux_3(.input_e(status_coord_c_coord_l_3),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[1]),);
	modulo_mux4_1 mux_4(.input_e(status_coord_c_coord_l_4),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[0]),);
	
	modulo_decodificador_bcd_ex_7seg decodificador_bcd_ex_1(.D7SEG(out_mux_7seg_decod), .OUT_SEGS(out_7seg),);
	modulo_decodificador_bcd_ex_7seg_ac decodificador_bcd_ex_ac_1(.STAC(hh1), .AC(out_7seg_ac),);
	
	// ==========================
	
	modulo_demux1_4 demux_button_confirmation(.input_e(button_confirmation),.input_sel(hh1),.out(sel_state),);
	
	modulo_demux1_8 demux_col(.input_e(1'b1),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_col),);
	
	modulo_contador_sync_3_bits count_3_bits_1(.clr(clr_2),.clk(clk_div[0]),.q(count_3_bits_mux_matriz_leds_sel),);
	and_gate_2_inputs gate_2(.A(count_3_bits_mux_matriz_leds_sel[2]),.B(1'b1),.S(clr_2),);
	
	//Matriz de armazenamento de posicionamento
	
	modulo_preset_linha_1 preset_1(.HH(hh2[5:4]),.cl1(m_po_in[34:30]));
	modulo_preset_linha_2 preset_2(.HH(hh2[5:4]),.cl2(m_po_in[29:25]));
	modulo_preset_linha_3 preset_3(.HH(hh2[5:4]),.cl3(m_po_in[24:20]));
	modulo_preset_linha_4 preset_4(.HH(hh2[5:4]),.cl4(m_po_in[19:15]));
	modulo_preset_linha_5 preset_5(.HH(hh2[5:4]),.cl5(m_po_in[14:10]));
	modulo_preset_linha_6 preset_6(.HH(hh2[5:4]),.cl6(m_po_in[9:5]));
	modulo_preset_linha_7 preset_7(.HH(hh2[5:4]),.cl7(m_po_in[4:0]));
	
	modulo_matriz_reg_po reg_matriz_po_1(.m_in(m_po_in),.clk(Nsel_state[2]),.clr(Nsel_state[0]),.m_out(m_po_out),);
	
	modulo_mapeamento_mux8_1 map_1(.e(m_po_out[34:30]), .out_mapeado(m_po_out_w1));
	modulo_mapeamento_mux8_1 map_2(.e(m_po_out[29:25]), .out_mapeado(m_po_out_w2));
	modulo_mapeamento_mux8_1 map_3(.e(m_po_out[24:20]), .out_mapeado(m_po_out_w3));
	modulo_mapeamento_mux8_1 map_4(.e(m_po_out[19:15]), .out_mapeado(m_po_out_w4));
	modulo_mapeamento_mux8_1 map_5(.e(m_po_out[14:10]), .out_mapeado(m_po_out_w5));
	modulo_mapeamento_mux8_1 map_6(.e(m_po_out[9:5]), .out_mapeado(m_po_out_w6));
	modulo_mapeamento_mux8_1 map_7(.e(m_po_out[4:0]), .out_mapeado(m_po_out_w7));
	
	modulo_mux8_1 mux_5(.input_e(m_po_out_w1),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[6]),);
	modulo_mux8_1 mux_6(.input_e(m_po_out_w2),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[5]),);
	modulo_mux8_1 mux_7(.input_e(m_po_out_w3),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[4]),);
	modulo_mux8_1 mux_8(.input_e(m_po_out_w4),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[3]),);
	modulo_mux8_1 mux_9(.input_e(m_po_out_w5),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[2]),);
	modulo_mux8_1 mux_10(.input_e(m_po_out_w6),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[1]),);
	modulo_mux8_1 mux_11(.input_e(m_po_out_w7),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[0]),);
	
	//============================================
	
	//Matriz de armazenamento de Ataque
	
	modulo_seletor_1_16_at mod_sel_demux_1_16_1(.mdc(hh2[5:3]),.mdl(hh2[2:0]),.dmx16_sel(sel_dmx_mx_16));
	modulo_seletor_1_4_at mod_sel_demux_1_4_1(.mdc(hh2[5:3]),.mdl(hh2[2:0]),.dmx4_sel(sel_dmx_mx_4));
	
	modulo_demux1_16 demux_11(.input_e(Nsel_state[1]),.input_sel(sel_dmx_mx_16),.out(demux1_16_out_1_c));
	modulo_demux1_4 demux_12(.input_e(demux1_16_out_1_c[15]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[34:31]),);
	modulo_demux1_4 demux_13(.input_e(demux1_16_out_1_c[14]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[30:27]),);
	modulo_demux1_4 demux_14(.input_e(demux1_16_out_1_c[13]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[26:23]),);
	modulo_demux1_4 demux_15(.input_e(demux1_16_out_1_c[12]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[22:19]),);
	modulo_demux1_4 demux_16(.input_e(demux1_16_out_1_c[11]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[18:15]),);
	modulo_demux1_4 demux_17(.input_e(demux1_16_out_1_c[10]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[14:11]),);
	modulo_demux1_4 demux_18(.input_e(demux1_16_out_1_c[9]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[10:7]),);
	modulo_demux1_4 demux_19(.input_e(demux1_16_out_1_c[8]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[6:3]),);
	modulo_demux1_4 demux_20(.input_e(demux1_16_out_1_c[7]),.input_sel(sel_dmx_mx_4),.out(m_at_clks[2:0]),);
	
	modulo_demux1_16 demux_1(.input_e(1'b0),.input_sel(sel_dmx_mx_16),.out(demux1_16_out_1_e));
	modulo_demux1_4 demux_2(.input_e(demux1_16_out_1_e[15]),.input_sel(sel_dmx_mx_4),.out(m_at_in[34:31]),);
	modulo_demux1_4 demux_3(.input_e(demux1_16_out_1_e[14]),.input_sel(sel_dmx_mx_4),.out(m_at_in[30:27]),);
	modulo_demux1_4 demux_4(.input_e(demux1_16_out_1_e[13]),.input_sel(sel_dmx_mx_4),.out(m_at_in[26:23]),);
	modulo_demux1_4 demux_5(.input_e(demux1_16_out_1_e[12]),.input_sel(sel_dmx_mx_4),.out(m_at_in[22:19]),);
	modulo_demux1_4 demux_6(.input_e(demux1_16_out_1_e[11]),.input_sel(sel_dmx_mx_4),.out(m_at_in[18:15]),);
	modulo_demux1_4 demux_7(.input_e(demux1_16_out_1_e[10]),.input_sel(sel_dmx_mx_4),.out(m_at_in[14:11]),);
	modulo_demux1_4 demux_8(.input_e(demux1_16_out_1_e[9]),.input_sel(sel_dmx_mx_4),.out(m_at_in[10:7]),);
	modulo_demux1_4 demux_9(.input_e(demux1_16_out_1_e[8]),.input_sel(sel_dmx_mx_4),.out(m_at_in[6:3]),);
	modulo_demux1_4 demux_10(.input_e(demux1_16_out_1_e[7]),.input_sel(sel_dmx_mx_4),.out(m_at_in[2:0]),);
	
	assign test = sel_dmx_mx_16;
	
	modulo_matriz_reg_at reg_matriz_at_1(.m_in(m_at_in),.clk(m_at_clks),.clr(Nsel_state[0]),.m_out(m_at_out),);
	
	modulo_mapeamento_mux8_1 map_8(.e(m_at_out[34:30]), .out_mapeado(m_at_out_w1));
	modulo_mapeamento_mux8_1 map_9(.e(m_at_out[29:25]), .out_mapeado(m_at_out_w2));
	modulo_mapeamento_mux8_1 map_10(.e(m_at_out[24:20]), .out_mapeado(m_at_out_w3));
	modulo_mapeamento_mux8_1 map_11(.e(m_at_out[19:15]), .out_mapeado(m_at_out_w4));
	modulo_mapeamento_mux8_1 map_12(.e(m_at_out[14:10]), .out_mapeado(m_at_out_w5));
	modulo_mapeamento_mux8_1 map_13(.e(m_at_out[9:5]), .out_mapeado(m_at_out_w6));
	modulo_mapeamento_mux8_1 map_14(.e(m_at_out[4:0]), .out_mapeado(m_at_out_w7));
	
	modulo_mux8_1 mux_12(.input_e(m_at_out_w1),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[6]),);
	modulo_mux8_1 mux_13(.input_e(m_at_out_w2),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[5]),);
	modulo_mux8_1 mux_14(.input_e(m_at_out_w3),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[4]),);
	modulo_mux8_1 mux_15(.input_e(m_at_out_w4),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[3]),);
	modulo_mux8_1 mux_16(.input_e(m_at_out_w5),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[2]),);
	modulo_mux8_1 mux_17(.input_e(m_at_out_w6),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[1]),);
	modulo_mux8_1 mux_18(.input_e(m_at_out_w7),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[0]),);
	
	modulo_mux16_1 mux_20(.input_e(m_at_line_rgb_select[8:0]),.input_sel(sel_dmx_mx_16),.out(rgb_in_cod));
	
	modulo_mux4_1 mux_21(.input_e(m_at_out[34:31]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[8]),);
	modulo_mux4_1 mux_22(.input_e(m_at_out[30:27]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[7]),);
	modulo_mux4_1 mux_23(.input_e(m_at_out[26:23]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[6]),);
	modulo_mux4_1 mux_24(.input_e(m_at_out[22:19]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[5]),);
	modulo_mux4_1 mux_25(.input_e(m_at_out[18:15]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[4]),);
	modulo_mux4_1 mux_26(.input_e(m_at_out[14:11]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[3]),);
	modulo_mux4_1 mux_28(.input_e(m_at_out[10:7]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[2]),);
	modulo_mux4_1 mux_29(.input_e(m_at_out[6:3]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[1]),);
	modulo_mux4_1 mux_30(.input_e(m_at_out[2:0]),.input_sel(sel_dmx_mx_4),.out(m_at_line_rgb_select[0]),);
	
	
	and_gate_2_inputs gate_19(.A(1'b1),.B(1'b1),.S(v_status_1[3]));
	and_gate_2_inputs gate_20(.A(1'b1),.B(m_po_line[6]),.S(v_status_1[2]));
	and_gate_2_inputs gate_21(.A(1'b1),.B(m_at_line[6]),.S(v_status_1[1]));
	and_gate_2_inputs gate_22(.A(1'b1),.B(m_po_line[6]),.S(v_status_1[0]));
	
	and_gate_2_inputs gate_23(.A(1'b1),.B(1'b1),.S(v_status_2[3]));
	and_gate_2_inputs gate_24(.A(1'b1),.B(m_po_line[5]),.S(v_status_2[2]));
	and_gate_2_inputs gate_25(.A(1'b1),.B(m_at_line[5]),.S(v_status_2[1]));
	and_gate_2_inputs gate_26(.A(1'b1),.B(m_po_line[5]),.S(v_status_2[0]));
	
	and_gate_2_inputs gate_27(.A(1'b1),.B(1'b1),.S(v_status_3[3]));
	and_gate_2_inputs gate_28(.A(1'b1),.B(m_po_line[4]),.S(v_status_3[2]));
	and_gate_2_inputs gate_29(.A(1'b1),.B(m_at_line[4]),.S(v_status_3[1]));
	and_gate_2_inputs gate_30(.A(1'b1),.B(m_po_line[4]),.S(v_status_3[0]));
	
	and_gate_2_inputs gate_31(.A(1'b1),.B(1'b1),.S(v_status_4[3]));
	and_gate_2_inputs gate_32(.A(1'b1),.B(m_po_line[3]),.S(v_status_4[2]));
	and_gate_2_inputs gate_33(.A(1'b1),.B(m_at_line[3]),.S(v_status_4[1]));
	and_gate_2_inputs gate_34(.A(1'b1),.B(m_po_line[3]),.S(v_status_4[0]));
	
	and_gate_2_inputs gate_35(.A(1'b1),.B(1'b1),.S(v_status_5[3]));
	and_gate_2_inputs gate_36(.A(1'b1),.B(m_po_line[2]),.S(v_status_5[2]));
	and_gate_2_inputs gate_37(.A(1'b1),.B(m_at_line[2]),.S(v_status_5[1]));
	and_gate_2_inputs gate_38(.A(1'b1),.B(m_po_line[2]),.S(v_status_5[0]));
	
	and_gate_2_inputs gate_39(.A(1'b1),.B(1'b1),.S(v_status_6[3]));
	and_gate_2_inputs gate_40(.A(1'b1),.B(m_po_line[1]),.S(v_status_6[2]));
	and_gate_2_inputs gate_41(.A(1'b1),.B(m_at_line[1]),.S(v_status_6[1]));
	and_gate_2_inputs gate_42(.A(1'b1),.B(m_po_line[1]),.S(v_status_6[0]));
	
	and_gate_2_inputs gate_43(.A(1'b1),.B(1'b1),.S(v_status_7[3]));
	and_gate_2_inputs gate_44(.A(1'b1),.B(m_po_line[0]),.S(v_status_7[2]));
	and_gate_2_inputs gate_45(.A(1'b1),.B(m_at_line[0]),.S(v_status_7[1]));
	and_gate_2_inputs gate_46(.A(1'b1),.B(m_po_line[0]),.S(v_status_7[0]));

	
	modulo_mux4_1 mux_31(.input_e(v_status_1),.input_sel(hh1),.out(m_line[6]),);
	modulo_mux4_1 mux_32(.input_e(v_status_2),.input_sel(hh1),.out(m_line[5]),);
	modulo_mux4_1 mux_33(.input_e(v_status_3),.input_sel(hh1),.out(m_line[4]),);
	modulo_mux4_1 mux_34(.input_e(v_status_4),.input_sel(hh1),.out(m_line[3]),);
	modulo_mux4_1 mux_35(.input_e(v_status_5),.input_sel(hh1),.out(m_line[2]),);
	modulo_mux4_1 mux_36(.input_e(v_status_6),.input_sel(hh1),.out(m_line[1]),);
	modulo_mux4_1 mux_37(.input_e(v_status_7),.input_sel(hh1),.out(m_line[0]),);
	

	
	//=================================================================

endmodule 