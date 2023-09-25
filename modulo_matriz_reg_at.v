module modulo_matriz_reg_at (m_in_1,m_in_2,m_in_3,m_in_4,m_in_5,m_in_6,m_in_7,m_in_8,clk_1,clk_2,clk_3
	clk_4,clk_5,clk_6,clk_7,clk_8,clr,m_out);

	input [7:0] m_in,clk;
	
	input [3:0] m_in_1;
	input [3:0] m_in_2;
	input [3:0] m_in_3;
	input [3:0] m_in_4;
	input [3:0] m_in_5;
	input [3:0] m_in_6;
	input [3:0] m_in_7;
	input [3:0] m_in_8;
	
	input [3:0] clk_1;
	input [3:0] clk_2;
	input [3:0] clk_3;
	input [3:0] clk_4;
	input [3:0] clk_5;
	input [3:0] clk_6;
	input [3:0] clk_7;;
	input [3:0] clk_8;;
	
	input [7:0] m_in,clk;
	
	
	input clr;
	output [34:0] m_out;
	
	
	modulo_ff_d ff_1(.d(m_in_1[34]),.clk(clk[34]),.clr(clr),.q(m_out[34]),);
	
	modulo_ff_d ff_2(.d(m_in_1[33]),.clk(clk[33]),.clr(clr),.q(m_out[33]),);
	
	modulo_ff_d ff_3(.d(m_in_1[32]),.clk(clk[32]),.clr(clr),.q(m_out[32]),);
	
	modulo_ff_d ff_4(.d(m_in_1[31]),.clk(clk[31]),.clr(clr),.q(m_out[31]),);
	
	
	modulo_ff_d ff_5(.d(m_in_2[30]),.clk(clk[30]),.clr(clr),.q(m_out[30]),);
	
	modulo_ff_d ff_6(.d(m_in_2[29]),.clk(clk[29]),.clr(clr),.q(m_out[29]),);

	modulo_ff_d ff_7(.d(m_in_2[28]),.clk(clk[28]),.clr(clr),.q(m_out[28]),);
	
	modulo_ff_d ff_8(.d(m_in_2[27]),.clk(clk[27]),.clr(clr),.q(m_out[27]),);
	
	
	modulo_ff_d ff_9(.d(m_in_3[26]),.clk(clk[26]),.clr(clr),.q(m_out[26]),);
	
	modulo_ff_d ff_10(.d(m_in_3[25]),.clk(clk[25]),.clr(clr),.q(m_out[25]),);
	
	modulo_ff_d ff_11(.d(m_in_3[24]),.clk(clk[24]),.clr(clr),.q(m_out[24]),);
	
	modulo_ff_d ff_12(.d(m_in_3[23]),.clk(clk[23]),.clr(clr),.q(m_out[23]),);
	
	
	modulo_ff_d ff_13(.d(m_in_4[22]),.clk(clk[22]),.clr(clr),.q(m_out[22]),);
	
	modulo_ff_d ff_14(.d(m_in_4[21]),.clk(clk[21]),.clr(clr),.q(m_out[21]),);

	modulo_ff_d ff_15(.d(m_in_4[20]),.clk(clk[20]),.clr(clr),.q(m_out[20]),);
	
	modulo_ff_d ff_16(.d(m_in_4[19]),.clk(clk[19]),.clr(clr),.q(m_out[19]),);
	
	
	modulo_ff_d ff_17(.d(m_in_5[18]),.clk(clk[18]),.clr(clr),.q(m_out[18]),);
	
	modulo_ff_d ff_18(.d(m_in_5[17]),.clk(clk[17]),.clr(clr),.q(m_out[17]),);
	
	modulo_ff_d ff_19(.d(m_in_5[16]),.clk(clk[16]),.clr(clr),.q(m_out[16]),);
	
	modulo_ff_d ff_20(.d(m_in_5[15]),.clk(clk[15]),.clr(clr),.q(m_out[15]),);
	
	
	modulo_ff_d ff_21(.d(m_in_6[14]),.clk(clk[14]),.clr(clr),.q(m_out[14]),);
	
	modulo_ff_d ff_22(.d(m_in_6[13]),.clk(clk[13]),.clr(clr),.q(m_out[13]),);
	
	modulo_ff_d ff_23(.d(m_in_6[12]),.clk(clk[12]),.clr(clr),.q(m_out[12]),);
	
	modulo_ff_d ff_24(.d(m_in_6[11]),.clk(clk[11]),.clr(clr),.q(m_out[11]),);
	
	
	modulo_ff_d ff_25(.d(m_in_7[10]),.clk(clk[10]),.clr(clr),.q(m_out[10]),);
	
	modulo_ff_d ff_26(.d(m_in_7[9]),.clk(clk[9]),.clr(clr),.q(m_out[9]),);
	
	modulo_ff_d ff_27(.d(m_in_7[8]),.clk(clk[8]),.clr(clr),.q(m_out[8]),);
	
	modulo_ff_d ff_28(.d(m_in_7[7]),.clk(clk[7]),.clr(clr),.q(m_out[7]),);
	
	
	modulo_ff_d ff_29(.d(m_in_8[6]),.clk(clk[6]),.clr(clr),.q(m_out[6]),);
	
	modulo_ff_d ff_30(.d(m_in_8[5]),.clk(clk[5]),.clr(clr),.q(m_out[5]),);
	
	modulo_ff_d ff_31(.d(m_in_8[4]),.clk(clk[4]),.clr(clr),.q(m_out[4]),);
	
	modulo_ff_d ff_32(.d(m_in_8[3]),.clk(clk[3]),.clr(clr),.q(m_out[3]),);
	
	
	modulo_ff_d ff_33(.d(m_in[2]),.clk(clk[2]),.clr(clr),.q(m_out[2]),);
	
	modulo_ff_d ff_34(.d(m_in[1]),.clk(clk[1]),.clr(clr),.q(m_out[1]),);
	
	modulo_ff_d ff_35(.d(m_in[0]),.clk(clk[0]),.clr(clr),.q(m_out[0]),);

endmodule 