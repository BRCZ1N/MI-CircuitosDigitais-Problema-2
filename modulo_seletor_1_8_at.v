module modulo_seletor_1_8_at (mdc,mdl,dmx8_sel);

	input [2:0] mdc,mdl;
	output [6:0] dmx8_sel;
	wire [2:0] nmdc, nmdl;
	wire [1:0] mx4e1;
	wire [3:0] mx4e2;
	wire [5:0] mx4e3;
	wire [1:0] mx4e4;
	wire [3:0] mx4e5;
	wire [5:0] mx4e6;
	wire [1:0] mx4e7;
	wire [1:0] mx4e2_wire_1;
	wire [1:0] mx4e3_wire_1;
	wire [1:0] mx4e5_wire_1;
	wire [1:0] mx4e6_wire_1;
	
	not(nmdc[2], mdc[2]);
	not(nmdc[1], mdc[1]);
	not(nmdc[0], mdc[0]);
	
	not(nmdl[2], mdl[2]);
	not(nmdl[1], mdl[1]);
	not(nmdl[0], mdl[0]);
	
	//MDL0MDL2 + MDL0MDL1 + MDC2 + MDC1 + MDC0
	
	and_gate_2_inputs gate_1(.A(mdl[2]),.B(mdl[0]),.S(mx4e1[1]),);
	and_gate_2_inputs gate_2(.A(mdl[2]),.B(mdl[1]),.S(mx4e1[0]),);
	
	or_gate_5_inputs gate_3(.A(mx4e1[1]),.B(mx4e1[0]),.C(mdc[0]),.D(mdc[1]),.E(mdc[2]),.S(dmx8_sel[6]),);

	//MDC2'MDL0' + MDL1MDL2 + MDC2MDL0 + MDC1 + MDC0 + MDC2'MDL1'MDL2'
	
	and_gate_2_inputs gate_4(.A(nmdc[0]),.B(nmdl[2]),.S(mx4e2[3]),);
	and_gate_2_inputs gate_5(.A(mdl[1]),.B(mdl[0]),.S(mx4e2[2]),);
	and_gate_2_inputs gate_6(.A(mdc[0]),.B(mdl[2]),.S(mx4e2[1]),);	
	and_gate_3_inputs gate_7(.A(nmdc[0]),.B(nmdl[1]),.C(nmdl[0]),.S(mx4e2[0]),);	
	
	or_gate_3_inputs gate_8(.A(mx4e2[3]),.B(mx4e2[2]),.C(mx4e2[1]),.S(mx4e2_wire_1[1]),);
	or_gate_3_inputs gate_9(.A(mdc[1]),.B(mdc[2]),.C(mx4e2[0]),.S(mx4e2_wire_1[0]),);
	
	or_gate_3_inputs gate_10(.A(mx4e2_wire_1[1]),.B(mx4e2_wire_1[0]),.S(dmx8_sel[5]),);
	
	//MDL0MDL1MDL2 + MDC0 + MDC1'MDL0'MDL1' + MDL0'MDL1MDL2' + MDC2'MDL2 + MDC2'MDL0 + MDC1MDC2
	
	and_gate_3_inputs gate_11(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx4e3[5]),);
	and_gate_3_inputs gate_12(.A(nmdc[1]),.B(nmdl[2]),.C(nmdl[1]),.S(mx4e3[4]),);
	and_gate_3_inputs gate_13(.A(nmdl[2]),.B(mdl[1]),.C(nmdl[0]),.S(mx4e3[3]),);
	and_gate_2_inputs gate_14(.A(nmdc[0]),.B(mdl[0]),.S(mx4e3[2]),);	
	and_gate_2_inputs gate_15(.A(nmdc[0]),.B(mdl[2]),.S(mx4e3[1]),);	
	and_gate_2_inputs gate_16(.A(mdc[1]),.B(mdc[0]),.S(mx4e3[0]),);	
	
	or_gate_3_inputs gate_17(.A(mx4e3[5]),.B(mdc[2]),.C(mx4e3[4]),.S(mx4e3_wire_1[1]),);
	or_gate_4_inputs gate_18(.A(mx4e3[3]),.B(mx4e3[2]),.C(mx4e3[1]),.D(mx4e3[0]),.S(mx4e3_wire_1[0]),);
	
	or_gate_2_inputs gate_19(.A(mx4e3_wire_1[1]),.B(mx4e3_wire_1[0]),.S(dmx8_sel[4]),);
	
	//MDC1' + MDL0'MDL1'MDL2' + MDL0MDL1 + MDC2 + MDC0
	
	and_gate_3_inputs gate_20(.A(nmdl[2]),.B(nmdl[1]),.C(nmdl[0]),.S(mx4e4[1]),);
	and_gate_2_inputs gate_21(.A(mdl[2]),.B(mdl[1]),.S(mx4e4[0]),);
	
	or_gate_5_inputs gate_22(.A(nmdc[1]),.B(mx4e4[1]),.C(mx4e4[0]),.D(mdc[0]),.E(mdc[2]),.S(dmx8_sel[3]),);

	//MDC1' + MDC2'MDL0' + MDC2MDL0 + MDC0 + MDC2'MDL1' + MDC2'MDL2
	
	and_gate_2_inputs gate_23(.A(nmdc[0]),.B(nmdl[2]),.S(mx4e5[3]),);
	and_gate_2_inputs gate_24(.A(mdc[0]),.B(mdl[2]),.S(mx4e5[2]),);
	and_gate_2_inputs gate_25(.A(nmdc[0]),.B(nmdl[1]),.S(mx4e5[1]),);
	and_gate_2_inputs gate_26(.A(nmdc[0]),.B(mdl[0]),.S(mx4e5[0]),);
	
	or_gate_3_inputs gate_27(.A(nmdc[1]),.B(mx4e5[3]),.C(mx4e5[2]),.S(mx4e5_wire_1[1]),);
	or_gate_3_inputs gate_28(.A(mdc[2]),.B(mx4e5[1]),.C(mx4e5[0]),.S(mx4e5_wire_1[0]),);
	
	or_gate_2_inputs gate_29(.A(mx4e5_wire_1[1]),.B(mx4e5_wire_1[0]),.S(dmx8_sel[2]),);
	
	// MDL1MDL2 + MDC0'MDC1' + MDC1MDC2' + MDC2MDL0' + MDL0'MDL1 + MDC0MDL0
	
	and_gate_3_inputs gate_30(.A(mdl[1]),.B(mdl[0]),.S(mx4e6[5]),);
	and_gate_3_inputs gate_31(.A(nmdc[2]),.B(nmdc[1]),.S(mx4e6[4]),);
	and_gate_3_inputs gate_32(.A(mdc[1]),.B(nmdc[0]),.S(mx4e6[3]),);
	and_gate_3_inputs gate_33(.A(mdc[0]),.B(nmdl[2]),.S(mx4e6[2]),);
	and_gate_3_inputs gate_34(.A(nmdl[2]),.B(mdl[1]),.S(mx4e6[1]),);
	and_gate_3_inputs gate_35(.A(mdc[2]),.B(mdl[2]),.S(mx4e6[0]),);
	
	or_gate_3_inputs gate_36(.A(mx4e6[5]),.B(mx4e6[4]),.C(mx4e6[3]),.S(mx4e6_wire_1[1]),);
	or_gate_3_inputs gate_37(.A(mx4e6[2]),.B(mx4e6[1]),.C(mx4e6[0]),.S(mx4e6_wire_1[0]),);
	
	or_gate_2_inputs gate_38(.A(mx4e6_wire_1[1]),.B(mx4e6_wire_1[0]),.S(dmx8_sel[1]),);
	
	//MDC0' + MDL0'MDL1' + MDL0MDL1MDL2 + MDC2 + MDC1
	
	and_gate_3_inputs gate_39(.A(nmdl[2]),.B(nmdl[1]),.S(mx4e7[1]),);
	and_gate_3_inputs gate_40(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx4e7[0]),);
	
	or_gate_2_inputs gate_41(.A(mx4e7[1]),.B(mx4e7[0]),.S(dmx8_sel[0]),);

endmodule 