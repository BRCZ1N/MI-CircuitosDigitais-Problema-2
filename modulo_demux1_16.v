module modulo_demux1_16(input_sel,input_e,out);

	input input_e;
	input [3:0] input_sel;
	output [15:0] out;
	wire  [3:0] Ninput_sel;
	
	not(Ninput_sel[0],input_sel[0]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[3],input_sel[3]);
	
	and_gate_5_inputs gate_1(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[15]),);

   //p1
	
	and_gate_5_inputs gate_2(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[14]),);
	//p2
	
	and_gate_5_inputs gate_3(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[13]),);
	//p3
	
	and_gate_5_inputs gate_4(.A(Ninput_sel[3]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[12]),);
	
	//p4
	
	
	and_gate_5_inputs gate_5(.A(Ninput_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[11]),);
	//p5
	
	and_gate_5_inputs gate_6(.A(Ninput_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[10]),);
	//p6
	
	
	and_gate_5_inputs gate_7(.A(Ninput_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[9]),);
	//p7
	and_gate_5_inputs gate_8(.A(Ninput_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[8]),);
	//p8
	
	and_gate_5_inputs gate_9(.A(input_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[7]),);
	//p9	
	and_gate_5_inputs gate_10(.A(input_sel[3]),.B(Ninput_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[6]),);
	//p10
	
	and_gate_5_inputs gate_11(.A(input_sel[3]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[5]),);
	//p11
	
	and_gate_5_inputs gate_12(.A(input_sel[3]),.B(Ninput_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[4]),);
	
	//p12
	
	and_gate_5_inputs gate_13(.A(input_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[3]),);
	
	//p13
	
	and_gate_5_inputs gate_14(.A(input_sel[3]),.B(input_sel[2]),.C(Ninput_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[2]),);
	//p14
	
	and_gate_5_inputs gate_15(.A(input_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(Ninput_sel[0]),.E(input_e),.S(out[1]),);
	//p15
	
	
	and_gate_5_inputs gate_16(.A(input_sel[3]),.B(input_sel[2]),.C(input_sel[1]),.D(input_sel[0]),.E(input_e),.S(out[0]),);
	
endmodule 
