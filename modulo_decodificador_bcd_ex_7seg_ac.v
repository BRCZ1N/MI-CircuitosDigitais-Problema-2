module modulo_decodificador_bcd_ex_7seg_ac(STAC,AC);

	input [1:0] STAC;
	output [3:0] AC;
	wire [1:0] NSTAC;
	
	not(NSTAC[1],STAC[1]);
	not(NSTAC[0],STAC[0]);

	
	//AC1
	
	or_gate_2_inputs gate_1(.A(1'b0),.B(1'b0),.S(AC[3]),);

	//AC2
	
	and_gate_2_inputs gate_2(.A(NSTAC[1]),.B(STAC[0]),.S(AC[2]),);
	
	
	//AC3
	
	and_gate_2_inputs gate_3(.A(NSTAC[1]),.B(STAC[0]),.S(AC[1]),);
	
	
	//AC4
	
	and_gate_2_inputs gate_4(.A(1'b1),.B(1'b1),.S(AC[0]),);
	
	
endmodule 