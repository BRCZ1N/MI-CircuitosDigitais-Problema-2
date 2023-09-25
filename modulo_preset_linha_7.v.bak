module modulo_preset_linha_7 (HH,cl7);

	input [1:0] HH;
	output [4:0]cl7;
	wire[1:0] NHH;

	not(NHH[1],HH[1]);
	not(NHH[0],HH[0]);
	wire NHH1_and_HH2,HH1_and_NHH2
//cl1
	and_gate_2_inputs gate_1(.A(NHH[0]),.B(HH[1]),.S(cl7[0]),);	
	

	
//cl2
	and_gate_2_inputs gate_2(.A(NHH[0]),.B(HH[1]),.S(cl7[1]),);	
	
	
//cl3

	and_gate_2_inputs gate_3(.A(1'b0),.B(1'b0),.S(cl7[2]),);
	
//cl4
	or_gate_2_inputs gate_4(.A(NHH[1]),.B(HH[0]),.S(cl7[3]),);	
//cl5
	
	or_gate_2_inputs gate_5(.A(NHH[1]),.B(HH[0]),.S(cl7[4]),);	
	
endmodule 