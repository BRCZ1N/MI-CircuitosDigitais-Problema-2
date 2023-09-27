module modulo_demux1_4(S,E,Y);

	input [1:0]S, E;
	output [3:0]Y;
	wire  [1:0]NS;
	
	not(NS[0],S[0]);
	not(NS[1],S[1]);
	
	//p0

	and_gate_3_inputs gate_1(.A(NS[0]),.B(NS[1]),.C(E),.S(Y[0]),);
	
	//p1
	and_gate_3_inputs gate_2(.A(NS[0]),.B(S[1]),.C(E),.S(Y[1]),);
	//p2
	
	
	and_gate_3_inputs gate_3(.A(S[0]),.B(NS[1]),.C(E),.S(Y[2]),);
	//p3
	
	
	and_gate_3_inputs gate_4(.A(S[0]),.B(S[1]),.C(E),.S(Y[3]),);
endmodule 