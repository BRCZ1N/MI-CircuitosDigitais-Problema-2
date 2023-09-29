module modulo_mapeamento_mux8_1(e, out_mapeado);
	
	input [4:0] e;
	output [7:0] out_mapeado;
	
	and_gate_2_inputs gate_1(.A(1'b1),.B(e[4]),.S(out_mapeado[7]));
	and_gate_2_inputs gate_2(.A(1'b1),.B(e[3]),.S(out_mapeado[6]));
	and_gate_2_inputs gate_3(.A(1'b1),.B(e[2]),.S(out_mapeado[5]));
	and_gate_2_inputs gate_4(.A(1'b1),.B(e[1]),.S(out_mapeado[4]));
	and_gate_2_inputs gate_5(.A(1'b1),.B(e[0]),.S(out_mapeado[3]));
	and_gate_2_inputs gate_6(.A(1'b1),.B(1'b1),.S(out_mapeado[2]));
	and_gate_2_inputs gate_7(.A(1'b1),.B(1'b1),.S(out_mapeado[1]));
	and_gate_2_inputs gate_8(.A(1'b1),.B(1'b1),.S(out_mapeado[0]));
	

endmodule 