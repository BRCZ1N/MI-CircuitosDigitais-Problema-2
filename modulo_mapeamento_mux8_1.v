module modulo_mapeamento_mux8_1(e, out_mapeado);
	
	input [7:0] e;
	output [4:0] out_mapeado;
	
	and_gate_2_inputs gate_1(.A(1'b1),.B(e[7]),.S(out_mapeado[4]));
	and_gate_2_inputs gate_2(.A(1'b1),.B(e[6]),.S(out_mapeado[3]));
	and_gate_2_inputs gate_3(.A(1'b1),.B(e[5]),.S(out_mapeado[2]));
	and_gate_2_inputs gate_4(.A(1'b1),.B(e[4]),.S(out_mapeado[1]));
	and_gate_2_inputs gate_5(.A(1'b1),.B(e[3]),.S(out_mapeado[0]));
	

endmodule 