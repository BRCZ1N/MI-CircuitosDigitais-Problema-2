module modulo_seletor_1_4_at (mdc,mdl,dmx4_sel);

	input [2:0] mdc,mdl;
	output [1:0] dmx4_sel;
	wire [2:0] nmdc, nmdl;
	wire [5:0] mx4e1;
	wire [1:0] mx4e2;
	
	not(nmdc[2], mdc[2]);
	not(nmdc[1], mdc[1]);
	not(nmdc[0], mdc[1]);
	
	not(nmdl[2], mdl[2]);
	not(nmdl[1], mdl[1]);
	not(nmdl[0], mdl[1]);
	
	
	and_gate_3_inputs gate_1(.A(nmdc[1]),.B(nmdc[0]),.C(mdl[1]),.S(mx4e1[5]),);
	and_gate_4_inputs gate_2(.A(nmdc[1]),.B(mdc[0]),.C(nmdl[1]),.D(nmdl[0]),.S(mx4e1[4]),);
	and_gate_3_inputs gate_3(.A(nmdc[1]),.B(mdl[1]),.C(mdl[0]),.S(mx4e1[3]),);
	and_gate_3_inputs gate_4(.A(mdc[1]),.B(nmdc[0]),.C(nmdl[1]),.S(mx4e1[2]),);
	and_gate_3_inputs gate_5(.A(mdc[1]),.B(nmdl[1]),.C(mdl[0]),.S(mx4e1[1]),);
	and_gate_4_inputs gate_6(.A(mdc[1]),.B(mdc[0]),.C(mdl[1]),.D(nmdl[0]),.S(mx4e1[0]),);
	
	or_gate_5_inputs gate_7(.A(mx4e1[5]),.B(mx4e1[4]),.C(mx4e1[3]),.D(mx4e1[3]),.E(mx4e1[3]),.S(dmx4_sel[1]),);
	
	and_gate_2_inputs gate_8(.A(nmdc[0]),.B(mdl[0]),.S(mx4e2[1]),);
	and_gate_2_inputs gate_9(.A(mdc[0]),.B(nmdl[0]),.S(mx4e2[0]),);
	
	or_gate_2_inputs gate_10(.A(mx4e2[1]),.B(mx4e2[0]),.S(dmx4_sel[0]),);
	


endmodule 