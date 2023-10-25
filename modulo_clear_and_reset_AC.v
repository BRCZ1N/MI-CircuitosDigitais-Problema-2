module modulo_clear_and_reset_AC(STA,Q,CLR_RESET,AC);

	input [1:0] STA,Q;
	output CLR_RESET;
	output [3:0] AC;
	wire gate_1_wire_1;
	wire [1:0] NSTA, NQ;
	
	not(NSTA[1],STA[1]);
	not(NSTA[0],STA[0]);
	not(NQ[1],Q[1]);
	not(NQ[0],Q[0]);
	
	or_gate_3_inputs gate_1(.A(NSTA[1]),.B(Q[1]),.C(STA[0]),.S(CLR_RESET),);
	
	and_gate_2_inputs gate_2(.A(STA[1]),.B(STA[0]),.S(gate_1_wire_1),);
	
	or_gate_3_inputs gate_3(.A(Q[1]),.B(Q[0]),.C(gate_1_wire_1),.S(AC[3]),);
	
	or_gate_4_inputs gate_4(.A(NSTA[1]),.B(NQ[0]),.C(Q[1]),.D(STA[0]),.S(AC[2]),);
	
	or_gate_4_inputs gate_5(.A(NSTA[1]),.B(NQ[1]),.C(Q[0]),.D(STA[0]),.S(AC[1]),);
	
	and_gate_2_inputs gate_6(.A(1'b1),.B(1'b1),.S(AC[0]),);
	
	
endmodule 