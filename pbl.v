module pbl(status,coord_at,out_7seg,out_7seg_ac);

	input [1:0] status;
	input [5:0] coord_at;
	output [7:0] out_7seg;
	output [3:0] out_7seg_ac;
	wire [3:0] coord_at_linha, coord_at_coluna, status_wire, out_mux_7seg_decod;
	wire [1:0] count_2_bits_mux_7seg_sel;
	wire clk;
	wire clr_1;
	
	modulo_status mod_sta(.std0(status),.stdig0(status_wire));
	
	modulo_coord_linha mod_coord_linha_1(.mdl(coord_at[5:3]),.cdl(coord_at_linha));
	
	modulo_coord_coluna mod_coord_col_1(.mdc(coord_at[2:0]),.cdc(coord_at_coluna));

	modulo_contador_sync_2_bits count_2_bits_1(.clr(clr_1),.clk(clk),.q(count_2_bits_mux_7seg_sel));
	
	and_gate_2_inputs gate_1(.A(count_2_bits_mux_7seg_sel[1]),.B(1'b1),.S(clr_1));
	
	modulo_mux4_1 mux_1(.A(status_wire[3]),.B(coord_at_linha[3]),.C(coord_at_coluna[3]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[3]));
	
	modulo_mux4_1 mux_2(.A(status_wire[2]),.B(coord_at_linha[2]),.C(coord_at_coluna[2]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[2]));
	
	modulo_mux4_1 mux_3(.A(status_wire[1]),.B(coord_at_linha[1]),.C(coord_at_coluna[1]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[1]));
	
	modulo_mux4_1 mux_4(.A(status_wire[1]),.B(coord_at_linha[0]),.C(coord_at_coluna[0]),.D(),.input_sel(count_2_bits_mux_7seg_sel),.out(out_mux_7seg_decod[0]));
	
	modulo_decodificador_bcd_ex_7seg decodificador_bcd_ex_1(.D7SEG(out_mux_7seg_decod), .OUT_SEGS(out_7seg),);
	
	modulo_decodificador_bcd_ex_7seg_ac decodificador_bcd_ex_ac_1(.DAC(out_mux_7seg_decod), .AC(out_7seg_ac),);
	
	modulo_matriz_reg_po();
	
	modulo_mux8_1 mux_5(.A(m_at[34]),.B(m_at[33]),.C(m_at[32]),.D(m_at[31),.E(m_at[30]),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_6(.A(m_at[29]),.B(m_at[28]),.C(m_at[27]),.D(m_at[26),.E(m_at[25]),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_7(.A(m_at[24]),.B(m_at[23]),.C(m_at[22]),.D(m_at[21),.E(m_at[20]),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_8(.A(m_at[19]),.B(m_at[18]),.C(m_at[17]),.D(m_at[16),.E(m_at[15]),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_9(.A(m_at[14]),.B(m_at[13]),.C(m_at[12]),.D(m_at[11]),.E(m_at[10]),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_10(.A(m_at[9]),.B(m_at[8]),.C(m_at[7]),.D(m_at[6]),.E(m_at[5]),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_11(.A(m_at[4]),.B(m_at[3]),.C(m_at[2]),.D(m_at[1]),.E(m_at[0]),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_matriz_reg_at();
	
	modulo_mux8_1 mux_5(.A(),.B(),.C(),.D(),.E(),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_5(.A(),.B(),.C(),.D(),.E(),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_5(.A(),.B(),.C(),.D(),.E(),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_5(.A(),.B(),.C(),.D(),.E(),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_5(.A(),.B(),.C(),.D(),.E(),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_5(.A(),.B(),.C(),.D(),.E(),.F(),.G(),.H(),.input_sel(),.out());
	
	modulo_mux8_1 mux_5(.A(),.B(),.C(),.D(),.E(),.F(),.G(),.H(),.input_sel(),.out());
	
	
	
	mux
	

endmodule 