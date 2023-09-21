module modulo_divisor_frequencia(clr, q, clk)

	input clk,clr;
	output [19:0] q;
	
	// F/2
	
	modulo_ff_t_1(.t(1b'1),.clk(clk),.clr(clr),.q(q[0]),);
	
	// F/4
	
	modulo_ff_t_2(.t(1b'1),.clk(q[0]),.clr(clr),.q(q[1]),); 
	
	// F/8
	
	modulo_ff_t_3(.t(1b'1),.clk(q[1]),.clr(clr),.q(q[2]),); 
	
	// F/16
	
	modulo_ff_t_4(.t(1b'1),.clk(q[2]),.clr(clr),.q(q[3]),); 
	
	// F/32
	
	modulo_ff_t_5(.t(1b'1),.clk(q[3]),.clr(clr),.q(q[4]),); 
	
	// F/64
	
	modulo_ff_t_6(.t(1b'1),.clk(q[4]),.clr(clr),.q(q[5]),); 
	
	// F/128
	
	modulo_ff_t_7(.t(1b'1),.clk(q[5]),.clr(clr),.q(q[6]),); 
	
	// F/256
	
	modulo_ff_t_8(.t(1b'1),.clk(q[6]),.clr(clr),.q(q[7]),);
																					  
	// F/512
	
	modulo_ff_t_9(.t(1b'1),.clk(q[7]),.clr(clr),.q(q[8]),);
																					  
	// F/1024
	
	modulo_ff_t_10(.t(1b'1),.clk(q[8]),.clr(clr),.q(q[9]),);
																					  
	// F/2048
	
	modulo_ff_t_11(.t(1b'1),.clk(q[9]),.clr(clr),.q(q[10]),);
																					  
	// F/4096
	
	modulo_ff_t_12(.t(1b'1),.clk(q[10]),.clr(clr),.q(q[11]),);
																					  
	// F/8192
	
	modulo_ff_t_13(.t(1b'1),.clk(q[11]),.clr(clr),.q(q[12]),);
																					  
	// F/16384
	
	modulo_ff_t_14(.t(1b'1),.clk(q[12]),.clr(clr),.q(q[13]),);
																					  
	// F/32768
	
	modulo_ff_t_15(.t(1b'1),.clk(q[13]),.clr(clr),.q(q[14]),);
																					  
	// F/65536
	
	modulo_ff_t_16(.t(1b'1),.clk(q[14]),.clr(clr),.q(q[15]),);
																					  
	// F/131072
	
	modulo_ff_t_17(.t(1b'1),.clk(q[15]),.clr(clr),.q(q[16]),);
																					  
	// F/262144
	
	modulo_ff_t_18(.t(1b'1),.clk(q[16]),.clr(clr),.q(q[17]),);
																					  
	// F/524288
	
	modulo_ff_t_19(.t(1b'1),.clk(q[17]),.clr(clr),.q(q[18]),);
																					  
	// F/1048576
	
	modulo_ff_t_20(.t(1b'1),.clk(q[18]),.clr(clr),.q(q[19]),);

endmodule 