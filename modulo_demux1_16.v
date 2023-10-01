module modulo_demux1_16(A,input_sel,out);

	input A;
	input [3:0] input_sel;
	output [15:0] out;
	wire  [3:0] Ninput_sel;
	
	not(Ninput_sel[0],input_sel[0]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[3],input_sel[3]);
	
	and_gate_5_inputs gate_1(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[15]),);
	and_gate_5_inputs gate_2(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(A),.S(out[14]),);
	and_gate_5_inputs gate_3(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[13]),);
	and_gate_5_inputs gate_4(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(A),.S(out[12]),);
	and_gate_5_inputs gate_5(.A(Ninput_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[11]),);
	and_gate_5_inputs gate_6(.A(Ninput_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(A),.S(out[10]),);
	and_gate_5_inputs gate_7(.A(Ninput_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[9]),);
	and_gate_5_inputs gate_8(.A(Ninput_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(A),.S(out[8]),);
	and_gate_5_inputs gate_9(.A(input_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[7]),);
	and_gate_5_inputs gate_10(.A(input_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(A),.S(out[6]),);
	and_gate_5_inputs gate_11(.A(input_sel[3]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[5]),);
	and_gate_5_inputs gate_12(.A(input_sel[3]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(A),.S(out[4]),);
	and_gate_5_inputs gate_13(.A(input_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[3]),);
	and_gate_5_inputs gate_14(.A(input_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(A),.S(out[2]),);
	and_gate_5_inputs gate_15(.A(input_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.E(A),.S(out[1]),);
	and_gate_5_inputs gate_16(.A(input_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(A),.S(out[0]),);
	
endmodule 
