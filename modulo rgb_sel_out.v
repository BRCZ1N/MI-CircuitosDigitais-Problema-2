module modulo_rgb_sel_out(std,bt,po,at,out_rgb);
	
	input [1:0] std;
	input bt;
	input po;
	input at;
	wire [1:0] rgb_out_1,nstd;
	output [1:0] out_rgb;
	
	not(nstd[1],std[1]);
	not(nstd[0],std[0]);
	not(nbt,bt);
	not(nat,at);
	not(npo,po);
	
	
	and_gate_4_inputs gate_1(.A(std[1]),.B(nstd[0]),.C(nbt),.D(at),.S(rgb_out_1[1]),);
	and_gate_4_inputs gate_1(.A(std[1]),.B(nstd[0]),.C(nbt),.D(po),.S(rgb_out_1[0]),);
	or_gate_2_inputs gate_1(.A(rgb_out_1[1]),.B(rgb_out_1[0]),.S(out_rgb[1]),);
	
	
	and_gate_5_inputs gate_1(.A(std[1]),.B(nstd[0]),.C(nbt),.D(npo),.E(nat),.S(out_rgb[0]),);



endmodule 