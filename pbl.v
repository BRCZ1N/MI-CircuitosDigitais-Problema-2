module pbl(status,coord_at,out_7seg,out_7seg_ac,button_clr, button_clk, clk, out_7seg, out_7seg_ac,m_col,m_line);

	input button_clr,button_clk, clk;
	input [1:0] status;
	input [5:0] coord_at;
	output [7:0] out_7seg;
	output [3:0] out_7seg_ac;
	output [4:0] m_col;
	output [6:0] m_line;
	wire [3:0] coord_at_linha, coord_at_coluna, status_wire, out_mux_7seg_decod;
	wire [1:0] count_2_bits_mux_7seg_sel;
	wire [34:0] m_po_in, m_at_in;
	wire [34:0] m_po_out, m_at_out;
	wire [6:0] m_po_line, m_at_line;
	wire [2:0] count_3_bits_mux_matriz_leds_sel, Ncount_3_bits_mux_matriz_leds_sel;
	wire [34:0] m_at_clks;
	wire [15:0] demux1_16_out_1_e, demux1_16_out_1_c;
	wire clr_1, clr_2;
	wire clk_div;
	
	not(Ncount_3_bits_mux_matriz_leds_sel[2],count_3_bits_mux_matriz_leds_sel[2]);
	not(Ncount_3_bits_mux_matriz_leds_sel[1],count_3_bits_mux_matriz_leds_sel[1]);
	not(Ncount_3_bits_mux_matriz_leds_sel[0],count_3_bits_mux_matriz_leds_sel[0]);
	
	modulo_status mod_sta(.std0(status),.stdig0(status_wire),);
	modulo_coord_linha mod_coord_linha_1(.mdl(coord_at[5:3]),.cdl(coord_at_linha),);
	modulo_coord_coluna mod_coord_col_1(.mdc(coord_at[2:0]),.cdc(coord_at_coluna),);
	
	modulo_contador_sync_2_bits count_2_bits_1(.clr(clr_1),.clk(div_clk),.q(count_2_bits_mux_7seg_sel),);
	and_gate_2_inputs gate_1(.A(count_2_bits_mux_7seg_sel[1]),.B(1'b1),.S(clr_1),);
	
	modulo_mux4_1 mux_1(.A(status_wire[3]),.B(coord_at_linha[3]),.C(coord_at_coluna[3]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[3]),);
	modulo_mux4_1 mux_2(.A(status_wire[2]),.B(coord_at_linha[2]),.C(coord_at_coluna[2]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[2]),);
	modulo_mux4_1 mux_3(.A(status_wire[1]),.B(coord_at_linha[1]),.C(coord_at_coluna[1]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[1]),);
	modulo_mux4_1 mux_4(.A(status_wire[1]),.B(coord_at_linha[0]),.C(coord_at_coluna[0]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[0]),);
	
	modulo_decodificador_bcd_ex_7seg decodificador_bcd_ex_1(.D7SEG(out_mux_7seg_decod), .OUT_SEGS(out_7seg),);
	modulo_decodificador_bcd_ex_7seg_ac decodificador_bcd_ex_ac_1(.DAC(out_mux_7seg_decod), .AC(out_7seg_ac),);
	
	//Aqui o clock tem que ser sincronizado
	
	modulo_contador_sync_3_bits count_3_bits_1(.clr(clr_2),.clk(clk),.q(count_3_bits_mux_matriz_leds_sel),);
	and_gate_2_inputs gate_2(.A(count_3_bits_mux_matriz_leds_sel[2]),.B(1'b1),.S(clr_2),);
	
	modulo_demux1_8 demux_col(.input_e(1'b1),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_col),);
	
	modulo_preset_linha_1 preset_1(.HH(HH_preset),.cl1(m_po_in[34:30]));
	modulo_preset_linha_2 preset_2(.HH(HH_preset),.cl2(m_po_in[29:25]));
	modulo_preset_linha_3 preset_3(.HH(HH_preset),.cl3(m_po_in[24:20]));
	modulo_preset_linha_4 preset_4(.HH(HH_preset),.cl4(m_po_in[19:15]));
	modulo_preset_linha_5 preset_5(.HH(HH_preset),.cl5(m_po_in[14:10]));
	modulo_preset_linha_6 preset_6(.HH(HH_preset),.cl6(m_po_in[9:5]));
	modulo_preset_linha_7 preset_7(.HH(HH_preset),.cl7(m_po_in[4:0]));
	
	modulo_matriz_reg_po reg_matriz_po_1(.m_in(m_po_in),.clk(button_clk),.clr(button_clr),.m_out(m_po_out),);
	
	modulo_mux8_1 mux_5(.A(m_po_out[34]),.B(m_po_out[33]),.C(m_po_out[32]),.D(m_po_out[31]),.E(m_po_out[30]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[6]),);
	modulo_mux8_1 mux_6(.A(m_po_out[29]),.B(m_po_out[28]),.C(m_po_out[27]),.D(m_po_out[26]),.E(m_po_out[25]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[5]),);
	modulo_mux8_1 mux_7(.A(m_po_out[24]),.B(m_po_out[23]),.C(m_po_out[22]),.D(m_po_out[21]),.E(m_po_out[20]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[4]),);
	modulo_mux8_1 mux_8(.A(m_po_out[19]),.B(m_po_out[18]),.C(m_po_out[17]),.D(m_po_out[16]),.E(m_po_out[15]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[3]),);
	modulo_mux8_1 mux_9(.A(m_po_out[14]),.B(m_po_out[13]),.C(m_po_out[12]),.D(m_po_out[11]),.E(m_po_out[10]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[2]),);
	modulo_mux8_1 mux_10(.A(m_po_out[9]),.B(m_po_out[8]),.C(m_po_out[7]),.D(m_po_out[6]),.E(m_po_out[5]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[1]),);
	modulo_mux8_1 mux_11(.A(m_po_out[4]),.B(m_po_out[3]),.C(m_po_out[2]),.D(m_po_out[1]),.E(m_po_out[0]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_po_line[0]),);
	
	
	modulo_demux1_16 demux_11(.input_e(clk_button),.input_sel(),.out(demux1_16_out_1_c));
	modulo_demux1_4 demux_12(.input_e(demux1_16_out_1_c[15]),.input_sel(),.out(m_at_clks[34:31]),);
	modulo_demux1_4 demux_13(.input_e(demux1_16_out_1_c[14]),.input_sel(),.out(m_at_clks[30:27]),);
	modulo_demux1_4 demux_14(.input_e(demux1_16_out_1_c[13]),.input_sel(),.out(m_at_clks[26:23]),);
	modulo_demux1_4 demux_15(.input_e(demux1_16_out_1_c[12]),.input_sel(),.out(m_at_clks[22:19]),);
	modulo_demux1_4 demux_16(.input_e(demux1_16_out_1_c[11]),.input_sel(),.out(m_at_clks[18:15]),);
	modulo_demux1_4 demux_17(.input_e(demux1_16_out_1_c[10]),.input_sel(),.out(m_at_clks[14:11]),);
	modulo_demux1_4 demux_18(.input_e(demux1_16_out_1_c[9]),.input_sel(),.out(m_at_clks[10:7]),);
	modulo_demux1_4 demux_19(.input_e(demux1_16_out_1_c[8]),.input_sel(),.out(m_at_clks[6:3]),);
	modulo_demux1_4 demux_20(.input_e(demux1_16_out_1_c[7]),.input_sel(),.out(m_at_clks[2:0]),);
	
	modulo_demux1_16 demux_1(.input_e(1'b0),.input_sel(),.out(demux1_16_out_1_e));
	modulo_demux1_4 demux_2(.input_e(demux1_16_out_1_e[15]),.input_sel(),.out(m_at_in[34:31]),);
	modulo_demux1_4 demux_3(.input_e(demux1_16_out_1_e[14]),.input_sel(),.out(m_at_in[30:27]),);
	modulo_demux1_4 demux_4(.input_e(demux1_16_out_1_e[13]),.input_sel(),.out(m_at_in[26:23]),);
	modulo_demux1_4 demux_5(.input_e(demux1_16_out_1_e[12]),.input_sel(),.out(m_at_in[22:19]),);
	modulo_demux1_4 demux_6(.input_e(demux1_16_out_1_e[11]),.input_sel(),.out(m_at_in[18:15]),);
	modulo_demux1_4 demux_7(.input_e(demux1_16_out_1_e[10]),.input_sel(),.out(m_at_in[14:11]),);
	modulo_demux1_4 demux_8(.input_e(demux1_16_out_1_e[9]),.input_sel(),.out(m_at_in[10:7]),);
	modulo_demux1_4 demux_9(.input_e(demux1_16_out_1_e[8]),.input_sel(),.out(m_at_in[6:3]),);
	modulo_demux1_4 demux_10(.input_e(demux1_16_out_1_e[7]),.input_sel(),.out(m_at_in[2:0]),);
	
	modulo_matriz_reg_at reg_matriz_at_1(.m_in(mt_at_in),.clk(m_at_clks),.clr(button_clr),.m_out(m_at),);
	
	modulo_mux8_1 mux_12(.A(m_at_out[34]),.B(m_at_out[33]),.C(m_at_out[32]),.D(m_at_out[31]),.E(m_at_out[30]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[6]),);
	modulo_mux8_1 mux_13(.A(m_at_out[29]),.B(m_at_out[28]),.C(m_at_out[27]),.D(m_at_out[26]),.E(m_at_out[25]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[5]),);
	modulo_mux8_1 mux_14(.A(m_at_out[24]),.B(m_at_out[23]),.C(m_at_out[22]),.D(m_at_out[21]),.E(m_at_out[20]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[4]),);
	modulo_mux8_1 mux_15(.A(m_at_out[19]),.B(m_at_out[18]),.C(m_at_out[17]),.D(m_at_out[16]),.E(m_at_out[15]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[3]),);
	modulo_mux8_1 mux_16(.A(m_at_out[14]),.B(m_at_out[13]),.C(m_at_out[12]),.D(m_at_out[11]),.E(m_at_out[10]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[2]),);
	modulo_mux8_1 mux_17(.A(m_at_out[9]),.B(m_at_out[8]),.C(m_at_out[7]),.D(m_at_out[6]),.E(m_at_out[5]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[1]),);
	modulo_mux8_1 mux_18(.A(m_at_out[4]),.B(m_at_out[3]),.C(m_at_out[2]),.D(m_at_out[1]),.E(m_at_out[0]),.F(),.G(),.H(),.input_sel(count_3_bits_mux_matriz_leds_sel),.out(m_at_line[0]),);


endmodule 