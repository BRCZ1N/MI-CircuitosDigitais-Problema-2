module modulo_mux16_1(input_e,input_sel, out);

	input input_e;
	input [2:0] input_sel;
	wire [7:0] out;
	wire [3:0] Ninput_sel;
	
	not(Ninput_sel[3],input_sel[3]);
	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	and_gate_4_inputs gate_1(.A(input_e),.B(Ninput_sel[3]),.C(Ninput_sel[2]),.D(Ninput_sel[1]),.S(gate_wire_and[7]),);
	and_gate_4_inputs gate_2(.A(input_e),.B(Ninput_sel[3]),.C(Ninput_sel[2]),.D(input_sel[1]),.S(gate_wire_and[6]),);
	and_gate_4_inputs gate_3(.A(input_e),.B(Ninput_sel[3]),.C(input_sel[2]),.D(Ninput_sel[1]),.S(gate_wire_and[5]),);
	and_gate_4_inputs gate_4(.A(input_e),.B(Ninput_sel[3]),.C(input_sel[2]),.D(input_sel[1]),.S(gate_wire_and[4]),);
	and_gate_4_inputs gate_5(.A(input_e),.B(input_sel[3]),.C(Ninput_sel[2]),.D(Ninput_sel[1]),.S(gate_wire_and[3]),);
	and_gate_4_inputs gate_6(.A(input_e),.B(input_sel[3]),.C(Ninput_sel[2]),.D(input_sel[1]),.S(gate_wire_and[2]),);
	and_gate_4_inputs gate_7(.A(input_e),.B(input_sel[3]),.C(input_sel[2]),.D(Ninput_sel[1]),.S(gate_wire_and[1]),);
	and_gate_4_inputs gate_8(.A(input_e),.B(input_sel[3]),.C(input_sel[2]),.D(input_sel[1]),.S(gate_wire_and[0]),);

endmodule

 