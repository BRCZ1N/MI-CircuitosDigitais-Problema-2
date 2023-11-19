module modulo_preset_linha_3 (HH,cl3);

input [1:0] HH;
output [4:0]cl3;
wire [1:0] NHH;

not (NHH[1],HH[1]);
not (NHH[0],HH[0]);

and_gate_2_inputs gate_1(.A(1'b1),.B(NHH[0]),.S(cl3[4]),);

and_gate_2_inputs gate_2(.A(1'b0),.B(1'b0),.S(cl3[3]),);

or_gate_2_inputs gate_3(.A(NHH[0]),.B(HH[1]),.S(cl3[2]),);

or_gate_2_inputs gate_4(.A(NHH[0]),.B(NHH[1]),.S(cl3[1]),);

or_gate_2_inputs gate_5(.A(NHH[0]),.B(HH[1]),.S(cl3[0]),);

endmodule 