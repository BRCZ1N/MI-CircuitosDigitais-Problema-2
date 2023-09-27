module modulo_sel_inputs_matriz(sta,sel_m);

	input [1:0] sta;
	output [1:0] sel_m;
	wire [1:0] sel_m_aux;
	wire [1:0] Nsta;
	
	not(Nsta[1],sta[1]);
	not(Nsta[0],sta[0]);
	
	and_gate_2_inputs gate_1(.A(Nsta[1]),.B(Nsta[0]),.S(sel_m_aux[1]),);
	and_gate_2_inputs gate_2(.A(sta[1]),.B(sta[0]),.S(sel_m_aux[0]),);
	or_gate_2_inputs gate_3(.A(sel_m_aux[1]),.B(sel_m_aux[0]),.S(sel_m[1]),);
	
	and_gate_2_inputs gate_4(.A(sta[1]),.B(Nsta[0]),.S(sel_m[0]),);
	
endmodule 