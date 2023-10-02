module modulo_seletor_1_4_at (mdc,mdl,dmx4_sel);

	input [2:0] mdc,mdl;
	output [1:0] dmx4_sel;
	wire [2:0] nmdc, nmdl;
	wire [8:0] mx4e1;
	wire [2:0] mx4e1_2;
	wire [4:0] mx4e2;
	
	not(nmdc[2], mdc[2]);
	not(nmdc[1], mdc[1]);
	not(nmdc[0], mdc[0]);
	
	not(nmdl[2], mdl[2]);
	not(nmdl[1], mdl[1]);
	not(nmdl[0], mdl[0]);
	
	//f(MDC1, MDC2, MDC3, MDL1, MDL2, MDL3) = MDC2'MDC3'MDL2 + 
	//MDC2'MDC3MDL2'MDL3' + MDC2'MDL2MDL3 + MDC2MDC3'MDL2' + MDC2MDL2'MDL3 + MDC2MDC3MDL2MDL3' + MDC1MDC3 + MDL1MDL2MDL3 + MDC1MDL2
	
	and_gate_3_inputs gate_1(.A(nmdc[1]),.B(nmdc[0]),.C(mdl[1]),.S(mx4e1[8]),);
	and_gate_4_inputs gate_2(.A(nmdc[1]),.B(mdc[0]),.C(nmdl[1]),.D(nmdl[0]),.S(mx4e1[7]),);
	and_gate_3_inputs gate_3(.A(nmdc[1]),.B(mdl[1]),.C(mdl[0]),.S(mx4e1[6]),);
	
	and_gate_3_inputs gate_4(.A(mdc[1]),.B(nmdc[0]),.C(nmdl[1]),.S(mx4e1[5]),);
	and_gate_3_inputs gate_5(.A(mdc[1]),.B(nmdl[1]),.C(mdl[0]),.S(mx4e1[4]),);
	and_gate_4_inputs gate_6(.A(mdc[1]),.B(mdc[0]),.C(mdl[1]),.D(nmdl[0]),.S(mx4e1[3]),);
	
	and_gate_2_inputs gate_7(.A(mdc[2]),.B(mdc[0]),.S(mx4e1[2]),);
	and_gate_3_inputs gate_8(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx4e1[1]),);
	and_gate_2_inputs gate_9(.A(mdc[2]),.B(mdl[1]),.S(mx4e1[0]),);
	
	or_gate_3_inputs gate_10(.A(mx4e1[8]),.B(mx4e1[7]),.C(mx4e1[6]),.S(mx4e1_2[2]),);
	or_gate_3_inputs gate_11(.A(mx4e1[5]),.B(mx4e1[4]),.C(mx4e1[3]),.S(mx4e1_2[1]),);
	or_gate_3_inputs gate_12(.A(mx4e1[2]),.B(mx4e1[1]),.C(mx4e1[0]),.S(mx4e1_2[0]),);
	
	or_gate_3_inputs gate_13(.A(mx4e1_2[2]),.B(mx4e1_2[1]),.C(mx4e1_2[0]),.S(dmx4_sel[1]),);
	
	//f(MDC1, MDC2, MDC3, MDL1, MDL2, MDL3) = MDC3'MDL3 + MDC3MDL3' + MDC1MDC2 + MDL1MDL2MDL3 + MDC1MDL3
	
	and_gate_2_inputs gate_14(.A(nmdc[0]),.B(mdl[0]),.S(mx4e2[4]),);
	and_gate_2_inputs gate_15(.A(mdc[0]),.B(nmdl[0]),.S(mx4e2[3]),);
	and_gate_2_inputs gate_16(.A(mdc[2]),.B(mdc[1]),.S(mx4e2[2]),);
	and_gate_3_inputs gate_17(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx4e2[1]),);
	and_gate_2_inputs gate_18(.A(mdc[2]),.B(mdl[0]),.S(mx4e2[0]),);
	
	or_gate_5_inputs gate_19(.A(mx4e2[4]),.B(mx4e2[3]),.C(mx4e2[2]),.D(mx4e2[1]),.E(mx4e2[0]),.S(dmx4_sel[0]),);
	


endmodule 