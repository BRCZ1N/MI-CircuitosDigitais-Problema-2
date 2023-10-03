module sel_clock(sel_state,bt,clock_sel);
	
	input sel_state,bt;
	output clock_sel;
	
	or_gate_2_inputs gate_1(.A(sel_state),.B(bt),.S(clock_sel));
	

endmodule 