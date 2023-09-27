module modulo_preset_linha_1 (HH,cl1);

	input [1:0] HH;
	output [4:0] cl1;
	wire[1:0] NHH;

	not(NHH[1],HH[1]);
	not(NHH[0],HH[0]);

	and_gate_2_inputs gate_1(.A(1'b1),.B(HH[0]),.S(cl1[4]),);	

	and_gate_2_inputs gate_2(.A(1'b1),.B(HH[0]),.S(cl1[3]),);

	and_gate_2_inputs gate_3(.A(HH[0]),.B(NHH[1]),.S(cl1[2]),);

	or_gate_2_inputs gate_4(.A(NHH[0]),.B(NHH[1]),.S(cl1[1]),);

	and_gate_2_inputs gate_5(.A(1'b1),.B(NHH[0]),.S(cl1[0]),);
	
endmodule 