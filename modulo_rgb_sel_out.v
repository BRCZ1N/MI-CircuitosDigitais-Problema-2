module modulo_rgb_sel_out(std,bt,at,out_rgb_r,out_rgb_g);
	
	input [1:0] std;
	input bt;
	input at;
	wire nbt,nat;
	wire [1:0] nstd;
	output out_rgb_r,out_rgb_g;
	
	not(nstd[1],std[1]);
	not(nstd[0],std[0]);
	not(nbt,bt);
	not(nat,at);
	
	and_gate_4_inputs gate_1(.A(std[1]),.B(nstd[0]),.C(nbt),.D(at),.S(out_rgb_r),);
		
	and_gate_4_inputs gate_4(.A(std[1]),.B(nstd[0]),.C(nbt),.D(nat),.S(out_rgb_g),);

endmodule 