module pbl(status,coord_at,out_7seg,out_7seg_ac,button_confirmation, button_clear);

	input button_confirmation, button_clear;
	input [1:0] status;
	input [5:0] coord_at;
	output [7:0] out_7seg;
	output [3:0] out_7seg_ac;
	wire [3:0] coord_at_linha, coord_at_coluna, status_wire, out_mux_7seg_decod;
	wire [1:0] count_2_bits_mux_7seg_sel;
	wire [34:0] m_po, m_at;
	wire [6:0] m_po_col, m_at_col;
	wire [2:0] count_3_bits_mux_matriz_leds_sel, Ncount_3_bits_mux_matriz_leds_sel;
	wire [34:0] clks, e_reg_at;
	wire [15:0] demux1_16_out_1_e, demux1_16_out_1_c;
	wire clk;
	wire clr_1, clr_2;
	
	not(Ncount_3_bits_mux_matriz_leds_sel[2],count_3_bits_mux_matriz_leds_sel[2]);
	not(Ncount_3_bits_mux_matriz_leds_sel[1],count_3_bits_mux_matriz_leds_sel[1]);
	not(Ncount_3_bits_mux_matriz_leds_sel[0],count_3_bits_mux_matriz_leds_sel[0]);
	
	modulo_status mod_sta(.std0(status),.stdig0(status_wire),);
	modulo_coord_linha mod_coord_linha_1(.mdl(coord_at[5:3]),.cdl(coord_at_linha),);
	modulo_coord_coluna mod_coord_col_1(.mdc(coord_at[2:0]),.cdc(coord_at_coluna),);
	
	modulo_contador_sync_2_bits count_2_bits_1(.clr(clr_1),.clk(clk),.q(count_2_bits_mux_7seg_sel),);
	and_gate_2_inputs gate_1(.A(count_2_bits_mux_7seg_sel[1]),.B(1'b1),.S(clr_1),);
	
	modulo_mux4_1 mux_1(.A(status_wire[3]),.B(coord_at_linha[3]),.C(coord_at_coluna[3]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[3]),);
	modulo_mux4_1 mux_2(.A(status_wire[2]),.B(coord_at_linha[2]),.C(coord_at_coluna[2]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[2]),);
	modulo_mux4_1 mux_3(.A(status_wire[1]),.B(coord_at_linha[1]),.C(coord_at_coluna[1]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[1]),);
	modulo_mux4_1 mux_4(.A(status_wire[1]),.B(coord_at_linha[0]),.C(coord_at_coluna[0]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[0]),);
	
	modulo_decodificador_bcd_ex_7seg decodificador_bcd_ex_1(.D7SEG(out_mux_7seg_decod), .OUT_SEGS(out_7seg),);
	modulo_decodificador_bcd_ex_7seg_ac decodificador_bcd_ex_ac_1(.DAC(out_mux_7seg_decod), .AC(out_7seg_ac),);
	
	//Módulos Alex
	
	//Aqui o clock tem que ser sincronizado
	
	modulo_matriz_reg_po reg_matriz_po_1(.m_in(),.clk(button_confirmation),.clr(button_clear),.m_out(m_po),);
	
	modulo_contador_sync_3_bits count_3_bits_1(.clr(clr_2),.clk(clk),.q(count_3_bits_mux_matriz_leds_sel),);
	and_gate_3_inputs gate_2(.A(count_3_bits_mux_matriz_leds_sel[2]),.B(count_3_bits_mux_matriz_leds_sel[1]),.C(Ncount_3_bits_mux_matriz_leds_sel[0]),.S(clr_2),);
	
	modulo_mux8_1 mux_5(.A(m_po[34]),.B(m_po[33]),.C(m_po[32]),.D(m_po[31]),.E(m_po[30]),.F(),.G(),.H(),.input_sel(),.out(m_po_col[6]),);
	modulo_mux8_1 mux_6(.A(m_po[29]),.B(m_po[28]),.C(m_po[27]),.D(m_po[26]),.E(m_po[25]),.F(),.G(),.H(),.input_sel(),.out(m_po_col[5]),);
	modulo_mux8_1 mux_7(.A(m_po[24]),.B(m_po[23]),.C(m_po[22]),.D(m_po[21]),.E(m_po[20]),.F(),.G(),.H(),.input_sel(),.out(m_po_col[4]),);
	modulo_mux8_1 mux_8(.A(m_po[19]),.B(m_po[18]),.C(m_po[17]),.D(m_po[16]),.E(m_po[15]),.F(),.G(),.H(),.input_sel(),.out(m_po_col[3]),);
	modulo_mux8_1 mux_9(.A(m_po[14]),.B(m_po[13]),.C(m_po[12]),.D(m_po[11]),.E(m_po[10]),.F(),.G(),.H(),.input_sel(),.out(m_po_col[2]),);
	modulo_mux8_1 mux_10(.A(m_po[9]),.B(m_po[8]),.C(m_po[7]),.D(m_po[6]),.E(m_po[5]),.F(),.G(),.H(),.input_sel(),.out(m_po_col[1]),);
	modulo_mux8_1 mux_11(.A(m_po[4]),.B(m_po[3]),.C(m_po[2]),.D(m_po[1]),.E(m_po[0]),.F(),.G(),.H(),.input_sel(),.out(m_po_col[0]),);
	
	//Aqui o clock tem que ser único e selecionado pelo usuario
	
	modulo_demux1_16 demux_1(.E(1'b0),.S(),.Y(demux1_16_out_1_e));
	modulo_demux1_4 demux_2(.E(demux1_16_out_1_e[15]),.S(),.Y(e_reg_at[34:31]),);
	modulo_demux1_4 demux_3(.E(demux1_16_out_1_e[14]),.S(),.Y(e_reg_at[30:27]),);
	modulo_demux1_4 demux_4(.E(demux1_16_out_1_e[13]),.S(),.Y(e_reg_at[26:23]),);
	modulo_demux1_4 demux_5(.E(demux1_16_out_1_e[12]),.S(),.Y(e_reg_at[22:19]),);
	modulo_demux1_4 demux_6(.E(demux1_16_out_1_e[11]),.S(),.Y(e_reg_at[18:15]),);
	modulo_demux1_4 demux_7(.E(demux1_16_out_1_e[10]),.S(),.Y(e_reg_at[14:11]),);
	modulo_demux1_4 demux_8(.E(demux1_16_out_1_e[9]),.S(),.Y(e_reg_at[10:7]),);
	modulo_demux1_4 demux_9(.E(demux1_16_out_1_e[8]),.S(),.Y(e_reg_at[6:3]),);
	modulo_demux1_4 demux_10(.E(demux1_16_out_1_e[7]),.S(),.Y(e_reg_at[2:0]),);
	
	modulo_demux1_16 demux_11(.E(1'b0),.S(),.Y(demux1_16_out_1_c));
	modulo_demux1_4 demux_12(.E(demux1_16_out_1_c[15]),.S(),.Y(clks[34:31]),);
	modulo_demux1_4 demux_13(.E(demux1_16_out_1_c[14]),.S(),.Y(clks[30:27]),);
	modulo_demux1_4 demux_14(.E(demux1_16_out_1_c[13]),.S(),.Y(clks[26:23]),);
	modulo_demux1_4 demux_15(.E(demux1_16_out_1_c[12]),.S(),.Y(clks[22:19]),);
	modulo_demux1_4 demux_16(.E(demux1_16_out_1_c[11]),.S(),.Y(clks[18:15]),);
	modulo_demux1_4 demux_17(.E(demux1_16_out_1_c[10]),.S(),.Y(clks[14:11]),);
	modulo_demux1_4 demux_18(.E(demux1_16_out_1_c[9]),.S(),.Y(clks[10:7]),);
	modulo_demux1_4 demux_19(.E(demux1_16_out_1_c[8]),.S(),.Y(clks[6:3]),);
	modulo_demux1_4 demux_20(.E(demux1_16_out_1_c[7]),.S(),.Y(clks[2:0]),);
	
	modulo_matriz_reg_at reg_matriz_at_1(.m_in(e_reg_at),.clk(clks),.clr(button_clear),.m_out(m_at),);
	
	modulo_mux8_1 mux_12(.A(m_at[34]),.B(m_at[33]),.C(m_at[32]),.D(m_at[31]),.E(m_at[30]),.F(),.G(),.H(),.input_sel(),.out(m_at_col[6]),);
	modulo_mux8_1 mux_13(.A(m_at[29]),.B(m_at[28]),.C(m_at[27]),.D(m_at[26]),.E(m_at[25]),.F(),.G(),.H(),.input_sel(),.out(m_at_col[5]),);
	modulo_mux8_1 mux_14(.A(m_at[24]),.B(m_at[23]),.C(m_at[22]),.D(m_at[21]),.E(m_at[20]),.F(),.G(),.H(),.input_sel(),.out(m_at_col[4]),);
	modulo_mux8_1 mux_15(.A(m_at[19]),.B(m_at[18]),.C(m_at[17]),.D(m_at[16]),.E(m_at[15]),.F(),.G(),.H(),.input_sel(),.out(m_at_col[3]),);
	modulo_mux8_1 mux_16(.A(m_at[14]),.B(m_at[13]),.C(m_at[12]),.D(m_at[11]),.E(m_at[10]),.F(),.G(),.H(),.input_sel(),.out(m_at_col[2]),);
	modulo_mux8_1 mux_17(.A(m_at[9]),.B(m_at[8]),.C(m_at[7]),.D(m_at[6]),.E(m_at[5]),.F(),.G(),.H(),.input_sel(),.out(m_at_col[1]),);
	modulo_mux8_1 mux_18(.A(m_at[4]),.B(m_at[3]),.C(m_at[2]),.D(m_at[1]),.E(m_at[0]),.F(),.G(),.H(),.input_sel(),.out(m_at_col[0]),);
	
	

endmodule 