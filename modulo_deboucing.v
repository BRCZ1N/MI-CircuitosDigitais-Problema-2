module modulo_deboucing(push_button,clr, clk_div, signal_bouncing,q);

	input push_button,clk_div,clr;
	output signal_bouncing;
	output [1:0] q;
	
	modulo_ff_d ff_1(.d(push_button),.clk(clk_div),.clr(clr),.q(q[0]),.nq());
	
	modulo_ff_d ff_2(.d(q[0]),.clk(clk_div),.clr(clr),.q(),.nq(q[1]));
	
	and_gate_2_inputs gate_1(.A(q[0]), .B(q[1]), .S(signal_bouncing));
	

endmodule 
