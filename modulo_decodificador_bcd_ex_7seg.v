module modulo_decodificador_bcd_ex_7seg(D7SEG, OUT_SEGS);

	input [3:0] D7SEG;
	output [7:0] OUT_SEGS;
	wire [3:0] ND7SEG;
	wire[26:0] and_gate;
	
	not(ND7SEG[3],D7SEG[3]);
	not(ND7SEG[2],D7SEG[2]);
	not(ND7SEG[1],D7SEG[1]);
	not(ND7SEG[0],D7SEG[0]);
	
	//A
	
	and_gate_4_inputs gate_1(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(ND7SEG[1]),.D(D7SEG[0]),.S(and_gate[26]),);
	and_gate_3_inputs gate_2(.A(D7SEG[2]),.B(ND7SEG[1]),.C(ND7SEG[0]),.S(and_gate[25]),);
	and_gate_3_inputs gate_3(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate[24]),);
	or_gate_3_inputs gate_4(.A(and_gate[26]),.B(and_gate[25]),.C(and_gate[24]),.S(OUT_SEGS[7]),);	
	
	
	//B
	
	and_gate_4_inputs gate_5(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[1]),.D(D7SEG[0]),.S(and_gate[23]),);
	and_gate_3_inputs gate_6(.A(D7SEG[2]),.B(D7SEG[1]),.C(ND7SEG[0]),.S(and_gate[22]),);
	and_gate_3_inputs gate_7(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate[21]),);
	or_gate_4_inputs gate_8(.A(and_gate[23]),.B(and_gate[22]),.C(and_gate[21]),.S(OUT_SEGS[6]),);
	
	//C
	
	and_gate_4_inputs gate_9(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(D7SEG[1]),.D(ND7SEG[0]),.S(and_gate[20]),);
	and_gate_3_inputs gate_10(.A(D7SEG[3]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate[19]),);
	and_gate_3_inputs gate_11(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[0]),.S(and_gate[18]),);
	and_gate_3_inputs gate_12(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate[17]),);
	or_gate_4_inputs gate_13(.A(and_gate[20]),.B(and_gate[19]),.C(and_gate[18]),.D(and_gate[17]),.S(OUT_SEGS[5]),);
	
	
	//D
	
	and_gate_4_inputs gate_14(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(ND7SEG[1]),.D(D7SEG[0]),.S(and_gate[16]),);
	and_gate_4_inputs gate_15(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[1]),.D(ND7SEG[0]),.S(and_gate[15]),);
	and_gate_3_inputs gate_16(.A(D7SEG[2]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate[14]),);
	and_gate_2_inputs gate_17(.A(D7SEG[3]),.B(D7SEG[1]),.S(and_gate[13]),);
	and_gate_3_inputs gate_18(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[0]),.S(and_gate[12]),);
	or_gate_5_inputs gate_19(.A(and_gate[16]),.B(and_gate[15]),.C(and_gate[14]),.D(and_gate[13]),.E(and_gate[12]),.S(OUT_SEGS[4]),);
	
	
	//E
	
	and_gate_2_inputs gate_20(.A(ND7SEG[3]),.B(D7SEG[0]),.S(and_gate[11]),);
	and_gate_3_inputs gate_21(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[1]),.S(and_gate[10]),);
	and_gate_3_inputs gate_22(.A(ND7SEG[2]),.B(ND7SEG[1]),.C(D7SEG[0]),.S(and_gate[9]),);
	and_gate_3_inputs gate_23(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate[8]),);
	or_gate_4_inputs gate_24(.A(and_gate[11]),.B(and_gate[10]),.C(and_gate[9]),.D(and_gate[8]),.S(OUT_SEGS[3]),);
	
	
	//F
	
	and_gate_3_inputs gate_25(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(D7SEG[0]),.S(and_gate[7]),);
	and_gate_3_inputs gate_26(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(D7SEG[1]),.S(and_gate[6]),);
	and_gate_3_inputs gate_27(.A(D7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[0]),.S(and_gate[5]),);
	and_gate_3_inputs gate_28(.A(D7SEG[2]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate[4]),);
	or_gate_4_inputs gate_29(.A(and_gate[7]),.B(and_gate[6]),.C(and_gate[5]),.D(and_gate[4]),.S(OUT_SEGS[2]),);
	
	
	//G
	and_gate_3_inputs gate_30(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(ND7SEG[1]),.S(and_gate[3]),);
	and_gate_3_inputs gate_31(.A(D7SEG[2]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate[2]),);
	and_gate_3_inputs gate_32(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[0]),.S(and_gate[1]),);
	and_gate_3_inputs gate_33(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate[0]),);
	or_gate_4_inputs gate_34(.A(and_gate[3]),.B(and_gate[2]),.C(and_gate[1]),.D(and_gate[0]),.S(OUT_SEGS[1]),);
	
	
	//DP
	
	and_gate_2_inputs gate_35(.A(1'b1),.B(1'b1),.S(OUT_SEGS[0]),);
	
	

endmodule 