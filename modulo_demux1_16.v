module modulo_demux1_16(S,E,Y);

	input E;
	input [3:0] S;
	output [15:0] Y;
	wire  [3:0] NS;
	
	not(NS[0],S[0]);
	not(NS[1],S[1]);
	not(NS[2],S[2]);
	not(NS[3],S[3]);
	and_gate_5_inputs gate_1(.A(NS[0]),.B(NS[1]),.C(NS[2]),.D(NS[3]),.E(E),.S(Y[15]),);

   //p1

	
	and_gate_5_inputs gate_2(.A(NS[0]),.B(NS[1]),.C(NS[2]),.D(S[3]),.E(E),.S(Y[14]),);
	//p2
	
	and_gate_5_inputs gate_3(.A(NS[0]),.B(NS[1]),.C(NS[2]),.D(NS[3]),.E(E),.S(Y[13]),);
	//p3
	
	and_gate_5_inputs gate_4(.A(NS[0]),.B(NS[1]),.C(S[2]),.D(S[3]),.E(E),.S(Y[12]),);
	
	//p4
	
	
	and_gate_5_inputs gate_5(.A(NS[0]),.B(S[1]),.C(NS[2]),.D(NS[3]),.E(E),.S(Y[11]),);
	//p5
	
	and_gate_5_inputs gate_6(.A(NS[0]),.B(S[1]),.C(NS[2]),.D(S[3]),.E(E),.S(Y[10]),);
	//p6
	
	
	and_gate_5_inputs gate_7(.A(NS[0]),.B(S[1]),.C(S[2]),.D(NS[3]),.E(E),.S(Y[9]),);
	//p7
	and_gate_5_inputs gate_8(.A(NS[0]),.B(S[1]),.C(S[2]),.D(S[3]),.E(E),.S(Y[8]),);
	//p8
	
	and_gate_5_inputs gate_9(.A(S[0]),.B(NS[1]),.C(NS[2]),.D(NS[3]),.E(E),.S(Y[7]),);
	//p9	
	and_gate_5_inputs gate_10(.A(S[0]),.B(NS[1]),.C(NS[2]),.D(S[3]),.E(E),.S(Y[6]),);
	//p10
	
	and_gate_5_inputs gate_11(.A(S[0]),.B(NS[1]),.C(S[2]),.D(NS[3]),.E(E),.S(Y[5]),);
	//p11
	
	and_gate_5_inputs gate_12(.A(S[0]),.B(NS[1]),.C(S[2]),.D(S[3]),.E(E),.S(Y[4]),);
	
	//p12
	
	and_gate_5_inputs gate_13(.A(S[0]),.B(S[1]),.C(NS[2]),.D(NS[3]),.E(E),.S(Y[3]),);
	
	//p13
	
	and_gate_5_inputs gate_14(.A(S[0]),.B(S[1]),.C(NS[2]),.D(S[3]),.E(E),.S(Y[2]),);
	//p14
	
	and_gate_5_inputs gate_15(.A(S[0]),.B(S[1]),.C(S[2]),.D(NS[3]),.E(E),.S(Y[1]),);
	//p15
	
	
	and_gate_5_inputs gate_16(.A(S[0]),.B(S[1]),.C(S[2]),.D(S[3]),.E(E),.S(Y[0]),);
	
endmodule 
