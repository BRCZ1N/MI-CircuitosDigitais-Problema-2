module modulo_preset_linha_4 (HH,cl4);

input [1:0] HH;
output [4:0]cl4;
wire [1:0] NHH;

not (NHH[1],HH[1]);
not (NHH[0],HH[0]);

and_gate_2_inputs gate_1(.A(1'b1),.B(1'b1),.S(cl4[4]),);

and_gate_2_inputs gate_2(.A(1'b1),.B(NHH[0]),.S(cl4[3]),);

and_gate_2_inputs gate_3(.A(1'b1),.B(1'b1),.S(cl4[2]),);

or_gate_2_inputs gate_4(.A(HH[0]),.B(HH[1]),.S(cl4[1]),);

or_gate_2_inputs gate_5(.A(NHH[1]),.B(HH[0]),.S(cl4[0]),);

endmodule 