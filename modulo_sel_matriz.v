module modulo_sel_matriz(std,out_sel);

	input [1:0] std;
	output out_sel;
	wire [1:0] Nstd;
	
	not(Nstd[1],std[1]);
	not(Nstd[0],std[0]);
	
	and_gate_2_inputs gate_1(.A(std[1]),.B(Nstd[0]),.S(out_sel),);
	

endmodule