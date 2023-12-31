module modulo_demux1_8(A,input_sel,out);

	input A;
	input [2:0] input_sel;
	output [7:0] out;
	wire [2:0] Ninput_sel;

	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	and_gate_4_inputs gate_1(.A(A),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(out[7]),);
	and_gate_4_inputs gate_2(.A(A),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(out[6]),);
	and_gate_4_inputs gate_3(.A(A),.B(Ninput_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(out[5]),);
	and_gate_4_inputs gate_4(.A(A),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(out[4]),);
	and_gate_4_inputs gate_5(.A(A),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(out[3]),);
	and_gate_4_inputs gate_6(.A(A),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(out[2]),);
	and_gate_4_inputs gate_7(.A(A),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(out[1]),);
	and_gate_4_inputs gate_8(.A(A),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(out[0]),);

endmodule

 