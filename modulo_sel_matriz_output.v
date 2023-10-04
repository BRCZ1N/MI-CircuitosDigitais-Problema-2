module modulo_sel_matriz_output(std,sel_output_matriz) ; 
 
	input [1:0] std;
	output sel_output_matriz;
	
	and_gate_2_inputs gate_1(.A(1'b1),.B(std[1]),.S(sel_output_matriz),);
	

endmodule 