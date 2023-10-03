module modulo_sel_1_8_demux(mdc,mdl,dmx8_input);

	input [2:0] mdc,mdl;
	output [2:0] dmx8_input;
	wire [2:0] nmdc, nmdl;
	wire [1:0] mx4e1_wire_1;
	wire [1:0] mx4e2_wire_2;
	wire [1:0] mx4e3_wire_3;

	not(nmdc[2], mdc[2]);
	not(nmdc[1], mdc[1]);
	not(nmdc[0], mdc[0]);
	not(nmdl[2], mdl[2]);
	not(nmdl[1], mdl[1]);
	not(nmdl[0], mdl[0]);
	
	
	wire [10:0] mx4e1;
	wire [11:0] mx4e2;
	wire [12:0] mx4e3;


//MDC0'MDC1'MDC2'MDL0MDL1'MDL2'
and_gate_4_inputs gate_1(.A(nmdc[2]),.B(nmdc[1]),.C(nmdc[0]),.D(mdl[2]),.S(mx4e1[10]),);
and_gate_3_inputs gate_2(.A(mx4e1[10]),.B(nmdl[1]),.C(nmdl[0]),.S(mx4e1[9]),);	

//MDL0MDL1MDL2
and_gate_3_inputs gate_3(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx4e1[8]),);	

//MDC1'MDC2 MDL0'MDL1 MDL2'
and_gate_5_inputs gate_4(.A(nmdc[1]),.B(mdc[0]),.C(nmdl[2]),.D(mdl[1]),.E(nmdl[0]),.S(mx4e1[7]),);

//MDC1MDC2'MDL0'MDL1'MDL2'
and_gate_5_inputs gate_5(.A(mdc[1]),.B(nmdc[0]),.C(nmdl[2]),.D(nmdl[1]),.E(nmdl[0]),.S(mx4e1[6]),);

//MDC1MDC2'MDL0MDL2 
and_gate_4_inputs gate_6(.A(mdc[1]),.B(nmdc[0]),.C(mdl[2]),.D(mdl[0]),.S(mx4e1[5]),);
	
//MDC1MDC2MDL1MDL2

and_gate_4_inputs gate_7(.A(mdc[1]),.B(mdc[0]),.C(mdl[1]),.D(mdl[0]),.S(mx4e1[4]),);

//MDC0MDL0'MDL1'MDL2
and_gate_4_inputs gate_8(.A(mdc[2]),.B(nmdl[2]),.C(nmdl[1]),.D(mdl[0]),.S(mx4e1[3]),);

//MDC0MDL0MDL1 
and_gate_3_inputs gate_9(.A(mdc[2]),.B(mdl[2]),.C(mdl[1]),.S(mx4e1[2]),);	

//MDC0MDC2

and_gate_2_inputs gate_10(.A(mdc[2]),.B(mdc[0]),.S(mx4e1[1]),);

//MDC0MDC1

and_gate_2_inputs gate_11(.A(mdc[2]),.B(mdc[1]),.S(mx4e1[0]),);


//MX8E1(MDC0, MDC1, MDC2, MDL0, MDL1, MDL2) = MDC0'MDC1'MDC2'MDL0MDL1'MDL2' + 
//MDL0MDL1MDL2 + 
//MDC1'MDC2 MDL0'MDL1 MDL2' + 
//MDC1MDC2'MDL0'MDL1'MDL2' + 
//MDC1MDC2'MDL0MDL2 + 
//MDC1MDC2MDL1MDL2 + 
//MDC0MDL0'MDL1'MDL2 + 
//MDC0MDL0MDL1 + 
//MDC0MDC2 +
//MDC0MDC1

or_gate_4_inputs gate_12(.A(mx4e1[9]),.B(mx4e1[8]),.C(mx4e1[7]),.D(mx4e1[6]),.S(mx4e1_wire_1[0]),);
or_gate_5_inputs gate_13(.A(mx4e1_wire_1[0]),.B(mx4e1[5]),.C(mx4e1[4]),.D(mx4e1[3]),.E(mx4e1[2]),.S(mx4e1_wire_1[1]),);
or_gate_3_inputs gate_14(.A(mx4e1_wire_1[1]),.B(mx4e1[1]),.C(mx4e1[0]),.S(dmx8_input[2]),);

/*MX8E2(MDC0, MDC1, MDC2, MDL0, MDL1, MDL2) = MDC0'MDC1'MDC2'MDL0'MDL1 + 
MDC1'MDC2MDL0'MDL1' + 
MDC2MDL0MDL1 + 
MDC1MDC2'MDL0MDL1'MDL2' + 
MDC2MDL0'MDL1'MDL2 + 
MDC1MDC2MDL1MDL2' + 
MDC0MDL1'MDL2' + 
MDC0MDC2 + 
MDC0MDC1 + 
MDC0'MDC2'MDL1MDL2 + 
MDC1'MDC2MDL1'MDL2 + 
MDC0MDL0MDL2*/



// MDC0'MDC1'MDC2'MDL0'MDL1
and_gate_5_inputs gate_15(.A(nmdc[2]),.B(nmdc[1]),.C(nmdc[0]),.D(nmdl[2]),.E(mdl[1]),.S(mx4e2[11]),);

// MDC1'MDC2MDL0'MDL1'
and_gate_4_inputs gate_16(.A(nmdc[1]),.B(mdc[0]),.C(nmdl[2]),.D(nmdl[1]),.S(mx4e2[10]),);


//MDC2MDL0MDL1 
and_gate_3_inputs gate_17(.A(mdc[0]),.B(mdl[2]),.C(mdl[1]),.S(mx4e2[9]),);

//MDC1 MDC2'MDL0MDL1'MDL2'
and_gate_5_inputs gate_18(.A(mdc[1]),.B(nmdc[0]),.C(mdl[2]),.D(nmdl[1]),.E(nmdl[0]),.S(mx4e2[8]),);




//MDC2MDL0'MDL1'MDL2

and_gate_4_inputs gate_19(.A(mdc[0]),.B(nmdl[2]),.C(nmdl[1]),.D(mdl[0]),.S(mx4e2[7]),);


//MDC1 MDC2 MDL1 MDL2'

and_gate_4_inputs gate_20(.A(mdc[1]),.B(mdc[0]),.C(mdl[1]),.D(nmdl[0]),.S(mx4e2[6]),);


//MDC0MDL1'MDL2'

and_gate_3_inputs gate_21(.A(mdc[2]),.B(nmdl[1]),.C(nmdl[0]),.S(mx4e2[5]),);


//MDC0MDC2
and_gate_2_inputs gate_22(.A(mdc[2]),.B(mdc[0]),.S(mx4e2[4]),);




//MDC0MDC1

and_gate_2_inputs gate_23(.A(mdc[2]),.B(mdc[1]),.S(mx4e2[3]),);

//MDC0'MDC2'MDL1 MDL2 

and_gate_4_inputs gate_24(.A(nmdc[2]),.B(nmdc[0]),.C(mdl[1]),.D(mdl[0]),.S(mx4e2[2]),);

//MDC1'MDC2 MDL1'MDL2 

and_gate_4_inputs gate_25(.A(nmdc[1]),.B(mdc[0]),.C(nmdl[1]),.D(mdl[0]),.S(mx4e2[1]),);

//MDC0 MDL0 MDL2

and_gate_3_inputs gate_26(.A(mdc[2]),.B(mdl[2]),.C(mdl[0]),.S(mx4e2[0]),);


or_gate_5_inputs gate_27(.A(mx4e2[10]),.B(mx4e2[9]),.C(mx4e2[8]),.D(mx4e2[7]),.E(mx4e2[6]),.S(mx4e2_wire_2[0]),);
or_gate_5_inputs gate_28(.A(mx4e2_wire_2[0]),.B(mx4e2[5]),.C(mx4e2[4]),.D(mx4e2[3]),.E(mx4e2[2]),.S(mx4e2_wire_2[1]),);
or_gate_4_inputs gate_29(.A(mx4e2_wire_2[1]),.B(mx4e2[1]),.C(mx4e2[0]),.D(mx4e2[11]),.S(dmx8_input[1]),);


/*
MX8E3(MDC0, MDC1, MDC2, MDL0, MDL1, MDL2) = MDC0'MDC1'MDL0MDL1 + 
MDC1'MDC2MDL0MDL2' + 
MDC1MDL0'MDL1MDL2' + 
MDC1MDC2'MDL0MDL1'MDL2' + 
MDL0MDL1MDL2 +
 
MDC1MDC2MDL0'MDL2' + 
MDC1MDC2MDL0MDL2 + 
MDC0MDL0MDL2 + 
MDC0MDC2 + 
MDC0MDC1 + 
MDC0'MDC1'MDL0'MDL1'MDL2 + 
MDC1'MDC2'MDL1MDL2*/


//MDC0'MDC1'MDL0MDL1

and_gate_4_inputs gate_30(.A(nmdc[2]),.B(nmdc[1]),.C(mdl[2]),.D(mdl[1]),.S(mx4e3[11]),);

//MDC1'MDC2MDL0MDL2'
and_gate_4_inputs gate_31(.A(nmdc[1]),.B(mdc[0]),.C(mdl[2]),.D(nmdl[0]),.S(mx4e3[10]),);


//MDC1MDL0'MDL1MDL2'
and_gate_4_inputs gate_32(.A(mdc[1]),.B(nmdl[2]),.C(mdl[1]),.D(nmdl[0]),.S(mx4e3[9]),);

//MDC1MDC2'MDL0MDL1'MDL2' 
and_gate_5_inputs gate_33(.A(mdc[1]),.B(nmdc[0]),.C(mdl[2]),.D(nmdl[1]),.E(nmdl[0]),.S(mx4e3[8]),);

///MDL0 MDL1 MDL2
and_gate_3_inputs gate_34(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(mx4e3[7]),);


//MDC1 MDC2 MDL0' MDL2'
and_gate_4_inputs gate_35(.A(mdc[1]),.B(mdc[0]),.C(nmdl[2]),.D(nmdl[0]),.S(mx4e3[6]),);

//MDC1 MDC2 MDL0 MDL2 
and_gate_4_inputs gate_36(.A(mdc[1]),.B(mdc[0]),.C(mdl[2]),.D(mdl[0]),.S(mx4e3[5]),);

//MDC0 MDL0 MDL2 
and_gate_3_inputs gate_37(.A(mdc[2]),.B(mdl[2]),.C(mdl[0]),.S(mx4e3[4]),);

//MDC0 MDC2 
and_gate_2_inputs gate_38(.A(mdc[2]),.B(mdc[0]),.S(mx4e3[3]),);

//MDC0MDC1
and_gate_2_inputs gate_39(.A(mdc[2]),.B(mdc[1]),.S(mx4e3[2]),);
//MDC0'MDC1'MDL0'MDL1'MDL2
and_gate_5_inputs gate_40(.A(nmdc[2]),.B(nmdc[1]),.C(nmdl[2]),.D(nmdl[1]),.E(mdl[0]),.S(mx4e3[1]),);

//MDC1'MDC2'MDL1MDL2
and_gate_4_inputs gate_41(.A(nmdc[1]),.B(nmdc[0]),.C(mdl[1]),.D(mdl[0]),.S(mx4e3[0]),);

//MDC0MDL0'MDL1'MDL2'
and_gate_4_inputs gate_42(.A(mdc[2]),.B(nmdl[2]),.C(nmdl[1]),.D(nmdl[0]),.S(mx4e3[12]),);

or_gate_5_inputs gate_43(.A(mx4e3[11]),.B(mx4e3[10]),.C(mx4e3[9]),.D(mx4e3[8]),.E(mx4e3[7]),.S(mx4e3_wire_3[0]),);
or_gate_5_inputs gate_44(.A(mx4e3[6]),.B(mx4e3[5]),.C(mx4e3[4]),.D(mx4e3[3]),.E(mx4e3[2]),.S(mx4e3_wire_3[1]),);
or_gate_5_inputs gate_45(.A(mx4e3_wire_3[0]),.B(mx4e3_wire_3[1]),.C(mx4e3[1]),.D(mx4e3[0]),.E(mx4e3[12]),.S(dmx8_input[0]),);

endmodule
