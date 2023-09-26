module modulo_preset_linha_5 (HH,cl5);

input [1:0] HH;
output [4:0]cl5;
wire [1:0] NHH;

not (NHH[1],HH[1]);
not (NHH[0],HH[0]);

and_gate_2_inputs gate_1(.A(1'b1),.B(1'b1),.S(cl5[0]),);

or_gate_2_inputs gate_2(.A(NHH[1]),.B(HH[0]),.S(cl5[1]),);

and_gate_2_inputs gate_3(.A(HH[1]),.B(HH[0]),.S(cl5[2]),);

and_gate_2_inputs gate_4(.A(1'b1),.B(HH[1]),.S(cl5[3]),);

and_gate_2_inputs gate_5(.A(1'b1),.B(HH[1]),.S(cl5[4]),);

endmodule 