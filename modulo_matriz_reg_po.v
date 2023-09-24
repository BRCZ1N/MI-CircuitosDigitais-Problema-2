module modulo_matriz_reg_po (m_in,clk,clr,m_out);

	input [34:0] m_in;
	input clr,clk;
	output [34:0] m_out;
	
	modulo_ff_d ff_1(.d(m_in[34]),.clk(clk),.clr(clr),.q(m_out[34]),);
	
	modulo_ff_d ff_2(.d(m_in[33]),.clk(clk),.clr(clr),.q(m_out[33]),);
	
	modulo_ff_d ff_3(.d(m_in[32]),.clk(clk),.clr(clr),.q(m_out[32]),);
	
	modulo_ff_d ff_4(.d(m_in[31]),.clk(clk),.clr(clr),.q(m_out[31]),);
	
	modulo_ff_d ff_5(.d(m_in[30]),.clk(clk),.clr(clr),.q(m_out[30]),);
	
	modulo_ff_d ff_6(.d(m_in[29]),.clk(clk),.clr(clr),.q(m_out[29]),);

	modulo_ff_d ff_7(.d(m_in[28]),.clk(clk),.clr(clr),.q(m_out[28]),);
	
	modulo_ff_d ff_8(.d(m_in[27]),.clk(clk),.clr(clr),.q(m_out[27]),);
	
	modulo_ff_d ff_9(.d(m_in[26]),.clk(clk),.clr(clr),.q(m_out[26]),);
	
	modulo_ff_d ff_10(.d(m_in[25]),.clk(clk),.clr(clr),.q(m_out[25]),);
	
	modulo_ff_d ff_11(.d(m_in[24]),.clk(clk),.clr(clr),.q(m_out[24]),);
	
	modulo_ff_d ff_12(.d(m_in[23]),.clk(clk),.clr(clr),.q(m_out[23]),);
	
	modulo_ff_d ff_13(.d(m_in[22]),.clk(clk),.clr(clr),.q(m_out[22]),);
	
	modulo_ff_d ff_14(.d(m_in[21]),.clk(clk),.clr(clr),.q(m_out[21]),);

	modulo_ff_d ff_15(.d(m_in[20]),.clk(clk),.clr(clr),.q(m_out[20]),);
	
	modulo_ff_d ff_16(.d(m_in[19]),.clk(clk),.clr(clr),.q(m_out[19]),);
	
	modulo_ff_d ff_17(.d(m_in[18]),.clk(clk),.clr(clr),.q(m_out[18]),);
	
	modulo_ff_d ff_18(.d(m_in[17]),.clk(clk),.clr(clr),.q(m_out[17]),);
	
	modulo_ff_d ff_19(.d(m_in[16]),.clk(clk),.clr(clr),.q(m_out[16]),);
	
	modulo_ff_d ff_20(.d(m_in[15]),.clk(clk),.clr(clr),.q(m_out[15]),);
	
	modulo_ff_d ff_21(.d(m_in[14]),.clk(clk),.clr(clr),.q(m_out[14]),);
	
	modulo_ff_d ff_22(.d(m_in[13]),.clk(clk),.clr(clr),.q(m_out[13]),);
	
	modulo_ff_d ff_23(.d(m_in[12]),.clk(clk),.clr(clr),.q(m_out[12]),);
	
	modulo_ff_d ff_24(.d(m_in[11]),.clk(clk),.clr(clr),.q(m_out[11]),);
	
	modulo_ff_d ff_25(.d(m_in[10]),.clk(clk),.clr(clr),.q(m_out[10]),);
	
	modulo_ff_d ff_26(.d(m_in[9]),.clk(clk),.clr(clr),.q(m_out[9]),);
	
	modulo_ff_d ff_27(.d(m_in[8]),.clk(clk),.clr(clr),.q(m_out[8]),);
	
	modulo_ff_d ff_28(.d(m_in[7]),.clk(clk),.clr(clr),.q(m_out[7]),);
	
	modulo_ff_d ff_29(.d(m_in[6]),.clk(clk),.clr(clr),.q(m_out[6]),);
	
	modulo_ff_d ff_30(.d(m_in[5]),.clk(clk),.clr(clr),.q(m_out[5]),);
	
	modulo_ff_d ff_31(.d(m_in[4]),.clk(clk),.clr(clr),.q(m_out[4]),);
	
	modulo_ff_d ff_32(.d(m_in[3]),.clk(clk),.clr(clr),.q(m_out[3]),);
	
	modulo_ff_d ff_33(.d(m_in[2]),.clk(clk),.clr(clr),.q(m_out[2]),);
	
	modulo_ff_d ff_34(.d(m_in[1]),.clk(clk),.clr(clr),.q(m_out[1]),);
	
	modulo_ff_d ff_35(.d(m_in[0]),.clk(clk),.clr(clr),.q(m_out[0]),);

endmodule 