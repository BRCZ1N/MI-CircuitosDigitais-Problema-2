module modulo_decodificador_bcd_ex_7seg_ac(DAC,AC);

	input [1:0] DAC;
	output [3:0] AC;
	wire [1:0] NDAC;
	
	not(NDAC[1],DAC[1]);
	not(NDAC[0],DAC[0]);

	
	//AC1
	
	or_gate_2_inputs gate_1(.A(DAC[1]),.B(DAC[0]),.S(AC[3]),);

	//AC2
	
	and_gate_2_inputs gate_2(.A(1'b1),.B(NDAC[0]),.S(AC[2]),);
	
	
	//AC3
	
	and_gate_2_inputs gate_3(.A(1'b1),.B(NDAC[1]),.S(AC[1]),);
	
	
	//AC4
	
	and_gate_2_inputs gate_4(.A(1'b1),.B(NDAC[0]),.S(AC[0]),);
	
	
endmodule 