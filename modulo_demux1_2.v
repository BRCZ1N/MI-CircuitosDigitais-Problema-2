module modulo_demux1_2(input_sel,input_e,out);

	input input_sel, input_e;
	output [1:0] out;
	wire  Ninput_sel;
	
	not(Ninput_sel,input_sel);

	and_gate_2_inputs gate_1(.A(Ninput_sel),.B(input_e),.S(out[1]),);
	
	
	and_gate_2_inputs gate_2(.A(input_sel),.B(input_e),.S(out[0]),);
	

endmodule 