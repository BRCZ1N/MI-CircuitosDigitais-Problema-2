module modulo_coord_coluna(mdc,cdc);

	input [2:0] mdc;
	output [3:0] cdc;
	wire [2:0] nmdc;
	
	not(nmdc[2],mdc[2]);
	not(nmdc[1],mdc[1]);
	not(nmdc[0],mdc[0]);
	
	//STDIG0_0;
	
	and_gate_2_inputs gate_1(.A(1'b0),.B(1'b0),.S(cdc[3]),);
	
	//STDIG0_1;
	and_gate_2_inputs gate_2(.A(mdc[2]),.B(1'b1),.S(cdc[2]),);
	
	//STDIG0_2;
	and_gate_2_inputs gate_3(.A(mdc[1]),.B(1'b1),.S(cdc[1]),);
	
	//STDIG0_3
	and_gate_2_inputs gate_4(.A(mdc[0]),.B(1'b1),.S(cdc[0]),);

endmodule 