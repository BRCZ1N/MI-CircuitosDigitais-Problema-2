module modulo_mux2_1(A,B,input_sel,out);

	input A,B;
	input input_sel;
	output out;
	wire [1:0] gate_wire_and;
	
	not(Ninput_sel, input_sel);
	
	and_gate_2_inputs gate_1(.A(A),.B(Ninput_sel),.S(gate_wire_and[1]),);
	and_gate_2_inputs gate_2(.A(B),.B(input_sel),.S(gate_wire_and[0]),);

	or_gate_4_inputs gate_5(.A(gate_wire_and[1]),.B(gate_wire_and[0]),.S(out),);
	

endmodule
