module modulo_demux1_8(input_e,input_sel,out);

	input input_e;
	input [2:0] input_sel;
	output [7:0] out;
	wire [2:0] Ninput_sel;

	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	and_gate_4_inputs gate_1(.A(input_e),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(out[7]),);
	and_gate_4_inputs gate_2(.A(input_e),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(out[6]),);
	and_gate_4_inputs gate_3(.A(input_e),.B(Ninput_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(out[5]),);
	and_gate_4_inputs gate_4(.A(input_e),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(out[4]),);
	and_gate_4_inputs gate_5(.A(input_e),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(out[3]),);
	and_gate_4_inputs gate_6(.A(input_e),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(out[2]),);
	and_gate_4_inputs gate_7(.A(input_e),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(out[1]),);
	and_gate_4_inputs gate_8(.A(input_e),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(out[0]),);

endmodule

 