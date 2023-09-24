module modulo_mux8_1(input_e,input_sel,out);

	input [7:0] input_e;
	input [2:0] input_sel;
	output out;
	wire [7:0] gate_wire_and;
	wire [2:0] Ninput_sel, gate_wire_or;

	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	
	and_gate_3_inputs gate_1(.A(input_e[7]),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(gate_wire_and[7]),);
	
	and_gate_3_inputs gate_2(.A(input_e[6]),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(gate_wire_and[6]),);
	
	and_gate_3_inputs gate_3(.A(input_e[5]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(gate_wire_and[5]),);
	
	and_gate_3_inputs gate_4(.A(input_e[4]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(gate_wire_and[4]),);
	
	and_gate_3_inputs gate_5(.A(input_e[3]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(gate_wire_and[3]),);
	
	and_gate_3_inputs gate_6(.A(input_e[2]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(gate_wire_and[2]),);
	
	and_gate_3_inputs gate_7(.A(input_e[1]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(gate_wire_and[1]),);
	
	and_gate_3_inputs gate_8(.A(input_e[0]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(gate_wire_and[0]),);

	
	or_gate_4_inputs gate_10(.A(gate_wire_and[7]),.B(gate_wire_and[6]),.C(gate_wire_and[5]),.D(gate_wire_and[4]),.S(gate_wire_or[1]),);
	
	or_gate_4_inputs gate_11(.A(gate_wire_and[3]),.B(gate_wire_and[2]),.C(gate_wire_and[1]),.D(gate_wire_and[0]),.S(gate_wire_or[0]),);
	
	or_gate_4_inputs gate_12(.A(gate_wire_or[3]),.B(gate_wire_or[2]),.C(gate_wire_or[1]),.D(gate_wire_or[0]),.S(out),);
	

endmodule