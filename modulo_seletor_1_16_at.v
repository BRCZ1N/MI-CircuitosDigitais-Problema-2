module modulo_seletor_1_16_at (mdc,mdl,dmx16_sel);

	input [2:0] mdc,mdl;
	output [3:0] dmx16_sel;
	wire [2:0] nmdc,nmdl;
	wire [2:0] mx16e1;
	wire [5:0] mx16e2;
	wire [7:0] mx16e3;
	wire [10:0] mx16e4;
	wire [1:0] mx16e2_aux;
	wire [1:0] mx16e3_aux;
	wire [1:0] mx16e4_aux;
	
	not(nmdc[2], mdc[2]);
	not(nmdc[1], mdc[1]);
	not(nmdc[0], mdc[1]);
	
	not(nmdl[2], mdl[2]);
	not(nmdl[1], mdl[1]);
	not(nmdl[0], mdl[1]);
	
	//MX16E1(MDC1, MDC2, MDC3, MDL1, MDL2, MDL3) = MDL1MDL2MDL3 + MDC1MDC3 + MDC1MDC2
	
	and_gate_3_inputs gate_1(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx16e1[2]),);
	and_gate_2_inputs gate_2(.A(mdc[2]),.B(mdc[0]),.S(mx16e1[1]),);
	and_gate_2_inputs gate_3(.A(mdc[2]),.B(mdc[1]),.S(mx16e1[0]),);
	
	or_gate_3_inputs gate_4(.A(mx16e1[2]),.B(mx16e1[1]),.C(mx16e1[0]),.S(dmx16_sel[3]),);
	
	//MX16E2(MDC1, MDC2, MDC3, MDL1, MDL2, MDL3) = MDL1MDL2MDL3 + MDC2MDL2 + MDC2MDL1 + MDC2MDC3 + MDC1MDL1' + MDC1MDC3
	
	and_gate_3_inputs gate_5(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx16e2[5]),);
	and_gate_2_inputs gate_6(.A(mdc[1]),.B(mdl[1]),.S(mx16e2[4]),);
	and_gate_2_inputs gate_7(.A(mdc[1]),.B(mdl[2]),.S(mx16e2[3]),);
	and_gate_2_inputs gate_8(.A(mdc[1]),.B(mdc[0]),.S(mx16e2[2]),);
	and_gate_2_inputs gate_9(.A(mdc[2]),.B(nmdl[2]),.S(mx16e2[1]),);
	and_gate_2_inputs gate_10(.A(mdc[2]),.B(mdc[0]),.S(mx16e2[0]),);
	
	or_gate_3_inputs gate_11(.A(mx16e2[5]),.B(mx16e2[4]),.C(mx16e2[3]),.S(mx16e2_aux[1]),);
	or_gate_3_inputs gate_12(.A(mx16e2[2]),.B(mx16e2[1]),.C(mx16e2[0]),.S(mx16e2_aux[0]),);
	or_gate_2_inputs gate_13(.A(mx16e2_aux[1]),.B(mx16e2_aux[0]),.S(dmx16_sel[2]),);
	
	//MX16E3(MDC1, MDC2, MDC3, MDL1, MDL2, MDL3) = MDL1MDL2MDL3 + MDC2'MDC3MDL3 
	//+ MDC2'MDC3MDL2 + MDC3MDL1 + MDC2MDC3'MDL1'MDL2' + MDC3MDL2MDL3 + MDC1MDL1' + MDC1MDC2
	
	and_gate_3_inputs gate_14(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx16e3[7]),);
	and_gate_3_inputs gate_15(.A(nmdc[1]),.B(mdc[0]),.C(mdl[0]),.S(mx16e3[6]),);
	and_gate_3_inputs gate_16(.A(nmdc[1]),.B(mdc[0]),.C(mdl[1]),.S(mx16e3[5]),);
	and_gate_3_inputs gate_17(.A(mdc[0]),.B(mdl[2]),.S(mx16e3[4]),);
	
	and_gate_4_inputs gate_18(.A(mdc[1]),.B(nmdc[0]),.C(nmdl[2]),.D(nmdl[1]),.S(mx16e3[3]),);
	and_gate_3_inputs gate_19(.A(mdc[0]),.B(mdl[1]),.C(mdl[0]),.S(mx16e3[2]),);
	and_gate_2_inputs gate_20(.A(mdc[2]),.B(nmdl[2]),.S(mx16e3[1]),);
	and_gate_2_inputs gate_21(.A(mdc[2]),.B(mdc[1]),.S(mx16e3[0]),);
	
	or_gate_4_inputs gate_22(.A(mx16e3[7]),.B(mx16e3[6]),.C(mx16e3[5]),.D(mx16e3[4]),.S(mx16e3_aux[1]),);
	or_gate_4_inputs gate_23(.A(mx16e3[3]),.B(mx16e3[2]),.C(mx16e3[1]),.D(mx16e3[0]),.S(mx16e3_aux[0]),);
	or_gate_2_inputs gate_24(.A(mx16e3_aux[1]),.B(mx16e3_aux[0]),.S(dmx16_sel[1]),);

	
	//MX16E4((MDC1, MDC2, MDC3, MDL1, MDL2, MDL3) = MDC1'MDC2'MDC3'MDL1 + MDC3MDL1'MDL2'MDL3' + MDC2MDL1'MDL2' + 
	//MDC2MDC3MDL1'MDL3' + MDL1MDL2MDL3 + MDC1MDL1' + MDC1MDC3 + MDC1MDC2 + MDC1'MDC2'MDL1MDL3 + MDC1'MDC2'MDL1MDL2 + MDC1'MDC3'MDL1MDL2
	
	and_gate_4_inputs gate_25(.A(nmdc[2]),.B(nmdc[1]),.C(nmdc[0]),.D(mdl[2]),.S(mx16e4[10]),);
	and_gate_4_inputs gate_26(.A(mdc[0]),.B(nmdl[2]),.C(nmdl[1]),.D(nmdl[0]),.S(mx16e4[9]),);
	and_gate_3_inputs gate_27(.A(mdc[1]),.B(nmdl[2]),.C(nmdl[1]),.S(mx16e4[8]),);
	and_gate_4_inputs gate_28(.A(mdc[1]),.B(mdc[0]),.C(nmdl[2]),.D(nmdl[0]),.S(mx16e4[7]),);
	and_gate_3_inputs gate_29(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx16e4[6]),);
	
	and_gate_2_inputs gate_30(.A(mdc[2]),.B(nmdl[2]),.S(mx16e4[5]),);
	and_gate_2_inputs gate_31(.A(mdc[2]),.B(mdc[0]),.S(mx16e4[4]),);
	and_gate_2_inputs gate_32(.A(mdc[2]),.B(mdc[1]),.S(mx16e4[3]),);
	and_gate_4_inputs gate_33(.A(nmdc[2]),.B(nmdc[1]),.C(mdl[2]),.D(mdl[0]),.S(mx16e4[2]),);
	and_gate_4_inputs gate_34(.A(nmdc[2]),.B(nmdc[1]),.C(mdl[2]),.D(mdl[1]),.S(mx16e4[1]),);
	and_gate_4_inputs gate_35(.A(nmdc[2]),.B(nmdc[0]),.C(mdl[2]),.D(mdl[1]),.S(mx16e4[0]),);
	
	or_gate_5_inputs gate_36(.A(mx16e4[9]),.B(mx16e4[8]),.C(mx16e4[7]),.D(mx16e4[6]),.E(mx16e4[5]),.S(mx16e4_aux[1]),);
	or_gate_5_inputs gate_37(.A(mx16e4[4]),.B(mx16e4[3]),.C(mx16e4[2]),.D(mx16e4[1]),.E(mx16e4[0]),.S(mx16e4_aux[0]),);
	or_gate_3_inputs gate_38(.A(mx16e4_aux[1]),.B(mx16e4_aux[0]),.C(mx16e4[0]),.S(dmx16_sel[0]),);

endmodule 