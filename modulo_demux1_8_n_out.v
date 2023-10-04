module modulo_demux1_8_n_out(A,input_sel,Nout);

	input A;
	input [2:0] input_sel;
	output [7:0] Nout;
	wire [7:0] out;
	wire [2:0] Ninput_sel;
	wire NA;
	
	not(NA,A);
	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[0],input_sel[0]);
	
	not(Nout[7],out[7]);
	not(Nout[6],out[6]);
	not(Nout[5],out[5]);
	not(Nout[4],out[4]);
	not(Nout[3],out[3]);
	not(Nout[2],out[2]);
	not(Nout[1],out[1]);
	not(Nout[0],out[0]);
	
	and_gate_4_inputs gate_1(.A(NA),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(out[7]),);
	and_gate_4_inputs gate_2(.A(NA),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(out[6]),);
	and_gate_4_inputs gate_3(.A(NA),.B(Ninput_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(out[5]),);
	and_gate_4_inputs gate_4(.A(NA),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(out[4]),);
	and_gate_4_inputs gate_5(.A(NA),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.S(out[3]),);
	and_gate_4_inputs gate_6(.A(NA),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.S(out[2]),);
	and_gate_4_inputs gate_7(.A(NA),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.S(out[1]),);
	and_gate_4_inputs gate_8(.A(NA),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.S(out[0]),);

endmodule
