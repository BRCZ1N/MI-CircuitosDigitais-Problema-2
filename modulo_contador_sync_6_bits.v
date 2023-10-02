module modulo_contador_sync_6_bits(clr, clk, q);

	input clk,clr;
	output [5:0] q;
	wire ff1_and_ff2,ff1_and_ff2_and_ff3,ff1_and_ff2_and_ff3_and_ff4,ff1_and_ff2_and_ff3_and_ff4_and_ff5;
	
	modulo_ff_t ff_1(.t(1'b1),.clk(clk),.clr(clr),.q(q[0]),);
	
	modulo_ff_t ff_2(.t(q[0]),.clk(clk),.clr(clr),.q(q[1]),);
	
	and(ff1_and_ff2, q[1],q[0]);
	
	modulo_ff_t ff_3(.t(ff1_and_ff2),.clk(clk),.clr(clr),.q(q[2]),);
	
	and(ff1_and_ff2_and_ff3,ff1_and_ff2, q[2]);
	
	modulo_ff_t ff_4(.t(ff1_and_ff2_and_ff3),.clk(clk),.clr(clr),.q(q[3]),);
	
	and(ff1_and_ff2_and_ff3_and_ff4,ff1_and_ff2_and_ff3,q[3]);
	
	modulo_ff_t ff_5(.t(ff1_and_ff2_and_ff3_and_ff4),.clk(clk),.clr(clr),.q(q[4]),);
	
	and(ff1_and_ff2_and_ff3_and_ff4_and_ff5,ff1_and_ff2_and_ff3_and_ff4, q[4]);
	
	modulo_ff_t ff_6(.t(ff1_and_ff2_and_ff3_and_ff4_and_ff5),.clk(clk),.clr(clr),.q(q[5]),);
	
	
endmodule 
