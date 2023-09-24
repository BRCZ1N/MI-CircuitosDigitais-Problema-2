module modulo_contador_3bits(clr, clk, q);

	input clk,clr;
	output [2:0] q;
	wire ff1_and_ff2;
	
	modulo_ff_t ff_1(.t(1'b1),.clk(clk),.clr(clr),.q(q[0]),);
	
	modulo_ff_t ff_2(.t(q[0]),.clk(clk),.clr(clr),.q(q[1]),);
	
	and(ff1_and_ff2, q[1],q[0]);
	
	modulo_ff_t ff_3(.t(ff1_and_ff2),.clk(clk),.clr(clr),.q(q[2]),);

	and(clr, q[2],q[1],q[0]);
	
endmodule 
