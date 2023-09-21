module modulo_contador_2bits(clr, q, clk)

	input clk,clr;
	output [1:0] q;
	
	modulo_ff_t_count_1(.t(1b'1),.clk(clk),.clr(clr),.q(q[0]),);
	
	modulo_ff_t_count_2(.t(q[0]),.clk(clk),.clr(clr),.q(q[1]),);

endmodule 
