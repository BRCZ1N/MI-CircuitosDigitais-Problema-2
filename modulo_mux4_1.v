module modulo_mux4_1(input_e,input_sel,out);

	input [3:0] input_e;
	input [1:0] input_sel;
	output out;
	wire [3:0] gate_wire_and;
	wire [1:0] Ninput_sel, gate_wire_or;
	
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	assign Ninput_sel_out = Ninput_sel;
	
	and_gate_3_inputs gate_1(.A(input_e[3]),.B(Ninput_sel[1]),.C(Ninput_sel[0]),.S(gate_wire_and[3]),);
	
	and_gate_3_inputs gate_2(.A(input_e[2]),.B(Ninput_sel[1]),.C(input_sel[0]),.S(gate_wire_and[2]),);
	
	and_gate_3_inputs gate_3(.A(input_e[1]),.B(input_sel[1]),.C(Ninput_sel[0]),.S(gate_wire_and[1]),);
	
	and_gate_3_inputs gate_4(.A(input_e[0]),.B(input_sel[1]),.C(input_sel[0]),.S(gate_wire_and[0]),);

	or_gate_4_inputs gate_5(.A(gate_wire_and[3]),.B(gate_wire_and[2]),.C(gate_wire_and[1]),.D(gate_wire_and[0]),.S(out),);
	

endmodule
