module modulo_mux16_1(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,input_sel, out);

	input A,B,C,D,E,F,G,H,I,J,K,L,M,N,O;
	input [3:0] input_sel;
	output out;
	wire [15:0] gate_wire_and;
	wire [3:0] Ninput_sel, gate_wire_or;
	
	not(Ninput_sel[3],input_sel[3]);
	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	and_gate_5_inputs gate_1(.A(A),.B(Ninput_sel[3]),.C(Ninput_sel[2]),.D(Ninput_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[15]),);
	and_gate_5_inputs gate_2(.A(B),.B(Ninput_sel[3]),.C(Ninput_sel[2]),.D(Ninput_sel[1]),.E(input_sel[0]),.S(gate_wire_and[14]),);
	and_gate_5_inputs gate_3(.A(C),.B(Ninput_sel[3]),.C(Ninput_sel[2]),.D(input_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[13]),);
	and_gate_5_inputs gate_4(.A(D),.B(Ninput_sel[3]),.C(Ninput_sel[2]),.D(input_sel[1]),.E(input_sel[0]),.S(gate_wire_and[12]),);
	and_gate_5_inputs gate_5(.A(E),.B(Ninput_sel[3]),.C(input_sel[2]),.D(Ninput_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[11]),);
	and_gate_5_inputs gate_6(.A(F),.B(Ninput_sel[3]),.C(input_sel[2]),.D(Ninput_sel[1]),.E(input_sel[0]),.S(gate_wire_and[10]),);
	and_gate_5_inputs gate_7(.A(G),.B(Ninput_sel[3]),.C(input_sel[2]),.D(input_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[9]),);
	and_gate_5_inputs gate_8(.A(H),.B(Ninput_sel[3]),.C(input_sel[2]),.D(input_sel[1]),.E(input_sel[0]),.S(gate_wire_and[8]),);
	and_gate_5_inputs gate_9(.A(I),.B(input_sel[3]),.C(Ninput_sel[2]),.D(Ninput_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[7]),);
	and_gate_5_inputs gate_10(.A(J),.B(input_sel[3]),.C(Ninput_sel[2]),.D(Ninput_sel[1]),.E(input_sel[0]),.S(gate_wire_and[6]),);
	and_gate_5_inputs gate_11(.A(K),.B(input_sel[3]),.C(Ninput_sel[2]),.D(input_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[5]),);
	and_gate_5_inputs gate_12(.A(L),.B(input_sel[3]),.C(Ninput_sel[2]),.D(input_sel[1]),.E(input_sel[0]),.S(gate_wire_and[4]),);
	and_gate_5_inputs gate_13(.A(M),.B(input_sel[3]),.C(input_sel[2]),.D(Ninput_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[3]),);
	and_gate_5_inputs gate_14(.A(M),.B(input_sel[3]),.C(input_sel[2]),.D(Ninput_sel[1]),.E(input_sel[0]),.S(gate_wire_and[2]),);
	and_gate_5_inputs gate_15(.A(N),.B(input_sel[3]),.C(input_sel[2]),.D(input_sel[1]),.E(Ninput_sel[0]),.S(gate_wire_and[1]),);
	and_gate_5_inputs gate_16(.A(O),.B(input_sel[3]),.C(input_sel[2]),.D(input_sel[1]),.E(input_sel[0]),.S(gate_wire_and[0]),);
	or_gate_4_inputs gate_17(.A(gate_wire_and[15]),.B(gate_wire_and[14]),.C(gate_wire_and[13]),.D(gate_wire_and[12]),.S(gate_wire_or[3]),);
	or_gate_4_inputs gate_18(.A(gate_wire_and[11]),.B(gate_wire_and[10]),.C(gate_wire_and[9]),.D(gate_wire_and[8]),.S(gate_wire_or[2]),);
	or_gate_4_inputs gate_19(.A(gate_wire_and[7]),.B(gate_wire_and[6]),.C(gate_wire_and[5]),.D(gate_wire_and[4]),.S(gate_wire_or[1]),);
	or_gate_4_inputs gate_20(.A(gate_wire_and[3]),.B(gate_wire_and[2]),.C(gate_wire_and[1]),.D(gate_wire_and[0]),.S(gate_wire_or[0]),);
	or_gate_4_inputs gate_21(.A(gate_wire_or[3]),.B(gate_wire_or[2]),.C(gate_wire_or[1]),.D(gate_wire_or[0]),.S(out),);
	

endmodule

 