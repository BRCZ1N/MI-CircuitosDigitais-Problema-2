module modulo_status(std0,stdig0);

	input [1:0] std0;
	output [3:0] stdig0;
	wire [1:0] nstd0;
	wire nstd0_and_std1, std0_and_nstd1,nstd0_and_nstd1, std0_and_std1 ;
	not(nstd0[1],std0[1]);
	not(nstd0[0],std0[0]);
	
	//STDIG0_0;
	
	and_gate_2_inputs gate_1(.A(1'b1),.B(1'b1),.S(stdig0[3]),);
	
	//STDIG0_1;
	
	and_gate_2_inputs gate_2(.A(nstd0[0]),.B(nstd0[1]),.S(nstd0_and_nstd1),);
	and_gate_2_inputs gate_3(.A(std0[0]),.B(std0[1]),.S(std0_and_std1),);
	
	or_gate_2_inputs gate_4(.A(nstd0_and_nstd1),.B(std0_and_std1),.S(stdig0[2]),);
	
	//STDIG0_2;
	
	and_gate_2_inputs gate_5(.A(nstd0[0]),.B(std0[1]),.S(nstd0_and_std1),);
	and_gate_2_inputs gate_6(.A(std0[0]),.B(nstd0[1]),.S(std0_and_nstd1),);
	
	or_gate_2_inputs gate_7(.A(nstd0_and_std1),.B(std0_and_nstd1),.S(stdig0[1]),);
	
	//STDIG0_3
	
	and_gate_2_inputs gate_8(.A(std0[1]),.B(1'b1),.S(stdig0[0]),);
	
	
endmodule 