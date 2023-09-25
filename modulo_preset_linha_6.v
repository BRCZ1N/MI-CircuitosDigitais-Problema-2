module modulo_preset_linha_6 (HH,cl6);

	input [1:0] HH;
	output [4:0]cl6;
	wire[1:0] NHH;

	not(NHH[1],HH[1]);
	not(NHH[0],HH[0]);
	wire NHH1_and_HH2,HH1_and_NHH2;
//cl61
	and_gate_2_inputs gate_1(.A(NHH[0]),.B(HH[1]),.S(NHH1_and_HH2),);	
	and_gate_2_inputs gate_2(.A(HH[0]),.B(NHH[1]),.S(HH1_and_NHH2),);	
	
	or_gate_2_inputs gate_3 (.A(NHH1_and_HH2),.B(HH1_and_NHH2),.S(cl6[0]),);

	
//cl2
	and_gate_2_inputs gate_4(.A(1'b1),.B(1'b1),.S(cl6[1]),);
	
//cl3

	
	or_gate_2_inputs gate_5(.A(NHH[0]),.B(HH[1]),.S(cl6[2]),);
	
//cl4
	
	and_gate_2_inputs gate_6(.A(1'b1),.B(1'b1),.S(cl6[3]),);
//cl5
	
	wire NHH1_and_NHH2, HH1_and_HH2;
	and_gate_2_inputs gate_7(.A(NHH[0]),.B(NHH[1]),.S(NHH1_and_NHH2),);	
	and_gate_2_inputs gate_8(.A(HH[0]),.B(HH[1]),.S(HH1_and_HH2),);	
	
	or_gate_2_inputs gate_9(.A(NHH1_and_NHH2),.B(HH1_and_HH2),.S(cl6[4]),);
	
endmodule 