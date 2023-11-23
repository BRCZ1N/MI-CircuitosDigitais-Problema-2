module modulo_matriz_reg_at(m_in,clk,clr,m_out);

	input [34:0] m_in, clk;
	input clr;
	output [34:0] m_out;
	
	modulo_ff_d_init_q_1 ff_1(.d(m_in[34]),.clk(clk[34]),.clr(clr),.q(m_out[34]),.nq());
	
	modulo_ff_d_init_q_1 ff_2(.d(m_in[33]),.clk(clk[33]),.clr(clr),.q(m_out[33]),.nq());
	
	modulo_ff_d_init_q_1 ff_3(.d(m_in[32]),.clk(clk[32]),.clr(clr),.q(m_out[32]),.nq());
	
	modulo_ff_d_init_q_1 ff_4(.d(m_in[31]),.clk(clk[31]),.clr(clr),.q(m_out[31]),.nq());
	
	modulo_ff_d_init_q_1 ff_5(.d(m_in[30]),.clk(clk[30]),.clr(clr),.q(m_out[30]),.nq());
	
	modulo_ff_d_init_q_1 ff_6(.d(m_in[29]),.clk(clk[29]),.clr(clr),.q(m_out[29]),.nq());

	modulo_ff_d_init_q_1 ff_7(.d(m_in[28]),.clk(clk[28]),.clr(clr),.q(m_out[28]),.nq());
	
	modulo_ff_d_init_q_1 ff_8(.d(m_in[27]),.clk(clk[27]),.clr(clr),.q(m_out[27]),.nq());
	
	modulo_ff_d_init_q_1 ff_9(.d(m_in[26]),.clk(clk[26]),.clr(clr),.q(m_out[26]),.nq());
	
	modulo_ff_d_init_q_1 ff_10(.d(m_in[25]),.clk(clk[25]),.clr(clr),.q(m_out[25]),.nq());
	
	modulo_ff_d_init_q_1 ff_11(.d(m_in[24]),.clk(clk[24]),.clr(clr),.q(m_out[24]),.nq());
	
	modulo_ff_d_init_q_1 ff_12(.d(m_in[23]),.clk(clk[23]),.clr(clr),.q(m_out[23]),.nq());
	
	modulo_ff_d_init_q_1 ff_13(.d(m_in[22]),.clk(clk[22]),.clr(clr),.q(m_out[22]),.nq());
	
	modulo_ff_d_init_q_1 ff_14(.d(m_in[21]),.clk(clk[21]),.clr(clr),.q(m_out[21]),.nq());

	modulo_ff_d_init_q_1 ff_15(.d(m_in[20]),.clk(clk[20]),.clr(clr),.q(m_out[20]),.nq());
	
	modulo_ff_d_init_q_1 ff_16(.d(m_in[19]),.clk(clk[19]),.clr(clr),.q(m_out[19]),.nq());
	
	modulo_ff_d_init_q_1 ff_17(.d(m_in[18]),.clk(clk[18]),.clr(clr),.q(m_out[18]),.nq());
	
	modulo_ff_d_init_q_1 ff_18(.d(m_in[17]),.clk(clk[17]),.clr(clr),.q(m_out[17]),.nq());
	
	modulo_ff_d_init_q_1 ff_19(.d(m_in[16]),.clk(clk[16]),.clr(clr),.q(m_out[16]),.nq());
	
	modulo_ff_d_init_q_1 ff_20(.d(m_in[15]),.clk(clk[15]),.clr(clr),.q(m_out[15]),.nq());
	
	modulo_ff_d_init_q_1 ff_21(.d(m_in[14]),.clk(clk[14]),.clr(clr),.q(m_out[14]),.nq());
	
	modulo_ff_d_init_q_1 ff_22(.d(m_in[13]),.clk(clk[13]),.clr(clr),.q(m_out[13]),.nq());
	
	modulo_ff_d_init_q_1 ff_23(.d(m_in[12]),.clk(clk[12]),.clr(clr),.q(m_out[12]),.nq());
	
	modulo_ff_d_init_q_1 ff_24(.d(m_in[11]),.clk(clk[11]),.clr(clr),.q(m_out[11]),.nq());
	
	modulo_ff_d_init_q_1 ff_25(.d(m_in[10]),.clk(clk[10]),.clr(clr),.q(m_out[10]),.nq());
	
	modulo_ff_d_init_q_1 ff_26(.d(m_in[9]),.clk(clk[9]),.clr(clr),.q(m_out[9]),.nq());
	
	modulo_ff_d_init_q_1 ff_27(.d(m_in[8]),.clk(clk[8]),.clr(clr),.q(m_out[8]),.nq());
	
	modulo_ff_d_init_q_1 ff_28(.d(m_in[7]),.clk(clk[7]),.clr(clr),.q(m_out[7]),.nq());
	
	modulo_ff_d_init_q_1 ff_29(.d(m_in[6]),.clk(clk[6]),.clr(clr),.q(m_out[6]),.nq());
	
	modulo_ff_d_init_q_1 ff_30(.d(m_in[5]),.clk(clk[5]),.clr(clr),.q(m_out[5]),.nq());
	
	modulo_ff_d_init_q_1 ff_31(.d(m_in[4]),.clk(clk[4]),.clr(clr),.q(m_out[4]),.nq());
	
	modulo_ff_d_init_q_1 ff_32(.d(m_in[3]),.clk(clk[3]),.clr(clr),.q(m_out[3]),.nq());
	
	modulo_ff_d_init_q_1 ff_33(.d(m_in[2]),.clk(clk[2]),.clr(clr),.q(m_out[2]),.nq());
	
	modulo_ff_d_init_q_1 ff_34(.d(m_in[1]),.clk(clk[1]),.clr(clr),.q(m_out[1]),.nq());
	
	modulo_ff_d_init_q_1 ff_35(.d(m_in[0]),.clk(clk[0]),.clr(clr),.q(m_out[0]),.nq());

endmodule 