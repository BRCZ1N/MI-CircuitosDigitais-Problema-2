module modulo_seletor_1_16_at (mdc,mdl,dmx16_sel);

	input [2:0] mdc,mdl;
	output [3:0] dmx16_sel;
	wire [2:0] nmdc,nmdl;
	wire [3:0] mx16e2;
	wire [5:0] mx16e3;
	wire [7:0] mx16e4;
	wire [1:0] mx16e3_aux;
	wire [1:0] mx16e4_aux;
	
	not(nmdc[2], mdc[2]);
	not(nmdc[1], mdc[1]);
	not(nmdc[0], mdc[1]);
	
	not(nmdl[2], mdl[2]);
	not(nmdl[1], mdl[1]);
	not(nmdl[0], mdl[1]);
	
	
	and_gate_2_inputs gate_1(.A(mdc[2]),.B(mdl[2]),.S(dmx16_sel[3]),);
	

	and_gate_2_inputs gate_2(.A(mdc[1]),.B(mdl[1]),.S(mx16e2[3]),);
	and_gate_2_inputs gate_3(.A(mdc[1]),.B(mdl[2]),.S(mx16e2[2]),);
	and_gate_2_inputs gate_4(.A(mdc[1]),.B(mdc[0]),.S(mx16e2[1]),);
	and_gate_2_inputs gate_5(.A(mdc[2]),.B(nmdl[2]),.S(mx16e2[0]),);
	
	or_gate_4_inputs gate_6(.A(mx16e2[3]),.B(mx16e2[2]),.C(mx16e2[1]),.D(mx16e2[0]),.S(dmx16_sel[2]),);
	
	and_gate_3_inputs gate_7(.A(nmdc[1]),.B(mdc[0]),.C(mdl[0]),.S(mx16e3[5]),);
	and_gate_3_inputs gate_8(.A(nmdc[1]),.B(mdc[0]),.C(mdl[1]),.S(mx16e3[4]),);
	and_gate_2_inputs gate_9(.A(mdc[0]),.B(mdl[2]),.S(mx16e3[3]),);
	and_gate_4_inputs gate_10(.A(mdc[1]),.B(nmdc[0]),.C(nmdl[2]),.D(nmdl[1]),.S(mx16e3[2]),);
	and_gate_3_inputs gate_11(.A(mdc[0]),.B(mdl[1]),.C(mdl[0]),.S(mx16e3[1]),);
	and_gate_2_inputs gate_12(.A(mdc[2]),.B(nmdl[2]),.S(mx16e3[0]),);
	
	or_gate_3_inputs gate_13(.A(mx16e3[5]),.B(mx16e3[4]),.C(mx16e3[3]),.S(mx16e3_aux[1]),);
	or_gate_3_inputs gate_14(.A(mx16e3[2]),.B(mx16e3[1]),.C(mx16e3[0]),.S(mx16e3_aux[0]),);
	or_gate_2_inputs gate_15(.A(mx16e3_aux[1]),.B(mx16e3_aux[0]),.S(dmx16_sel[1]),);

	
	
	
	
	and_gate_4_inputs gate_16(.A(nmdc[2]),.B(nmdc[1]),.C(nmdc[0]),.D(mdl[2]),.S(mx16e4[7]),);
	and_gate_4_inputs gate_17(.A(mdc[0]),.B(nmdl[2]),.C(nmdl[1]),.D(nmdl[0]),.S(mx16e4[6]),);
	and_gate_3_inputs gate_18(.A(mdc[1]),.B(nmdl[2]),.C(nmdl[1]),.S(mx16e4[5]),);
	and_gate_4_inputs gate_19(.A(mdc[1]),.B(mdc[0]),.C(nmdl[2]),.D(nmdl[0]),.S(mx16e4[4]),);
	and_gate_2_inputs gate_20(.A(mdc[2]),.B(nmdl[2]),.S(mx16e4[3]),);
	and_gate_4_inputs gate_21(.A(nmdc[2]),.B(nmdc[1]),.C(mdl[2]),.D(mdl[0]),.S(mx16e4[2]),);
	and_gate_4_inputs gate_22(.A(nmdc[2]),.B(nmdc[1]),.C(mdl[2]),.D(mdl[1]),.S(mx16e4[1]),);
	and_gate_4_inputs gate_23(.A(nmdc[2]),.B(nmdc[0]),.C(mdl[2]),.D(nmdl[1]),.S(mx16e4[0]),);
	
	or_gate_4_inputs gate_24(.A(mx16e4[7]),.B(mx16e4[6]),.C(mx16e4[5]),.D(mx16e4[4]),.S(mx16e4_aux[1]),);
	or_gate_4_inputs gate_25(.A(mx16e4[3]),.B(mx16e4[2]),.C(mx16e4[1]),.D(mx16e4[0]),.S(mx16e4_aux[0]),);
	or_gate_2_inputs gate_26(.A(mx16e4_aux[1]),.B(mx16e4_aux[0]),.S(dmx16_sel[0]),);

endmodule 