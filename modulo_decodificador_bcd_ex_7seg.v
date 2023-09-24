module modulo_decodificador_bcd_ex_7Seg(D7SEG, OUT_SEGS);

	input [3:0] D7SEG;
	output [7:0] OUT_SEGS;
	wire [3:0] ND7SEG;
	
	not(ND7SEG[3],D7SEG[3]);
	not(ND7SEG[2],D7SEG[2]);
	not(ND7SEG[1],D7SEG[1]);
	not(ND7SEG[0],D7SEG[0]);
	
	wire and_gate_1, and_gate_2, and_gate_3, and_gate_4, and_gate_5, and_gate_6, and_gate_7, and_gate_8, and_gate_9, and_gate_10, and_gate_11;
	wire and_gate_12, and_gate_13, and_gate_14, and_gate_15, and_gate_16, and_gate_17, and_gate_18, and_gate_19, and_gate_20, and_gate_21;
	wire and_gate_22, and_gate_23, and_gate_24, and_gate_25, and_gate_26, and_gate_27;
	
	
	//A
	
	and_gate_4_inputs gate_1(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(ND7SEG[1]),.D(ND7SEG[0]),.S(and_gate_1),);
	
	and_gate_3_inputs gate_2(.A(D7SEG[2]),.B(ND7SEG[1]),.C(ND7SEG[0]),.S(and_gate_2),);
	
	and_gate_3_inputs gate_3(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate_3),);
	
	or_gate_3_inputs gate_4(.A(and_gate_1),.B(and_gate_2),.C(and_gate_3),.S(OUT_SEGS[7]),);	
	
	
	//B
	
	and_gate_4_inputs gate_5(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[1]),.D(D7SEG[0]),.S(and_gate_4),);
	
	and_gate_3_inputs gate_6(.A(D7SEG[2]),.B(D7SEG[1]),.C(ND7SEG[0]),.S(and_gate_5),);
	
	and_gate_3_inputs gate_7(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate_6),);
	
	or_gate_4_inputs gate_8(.A(and_gate_4),.B(and_gate_5),.C(and_gate_6),.S(OUT_SEGS[6]),);
	
	//C
	
	and_gate_4_inputs gate_7(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(D7SEG[1]),.D(ND7SEG[0]),.S(and_gate_7),);
	
	and_gate_3_inputs gate_8(.A(D7SEG[3]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate_8),);
	
	and_gate_3_inputs gate_9(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[0]),.S(and_gate_9),);
	
	and_gate_3_inputs gate_10(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate_10),);
	
	or_gate_4_inputs gate_11(.A(and_gate_7),.B(and_gate_8),.C(and_gate_9),.D(and_gate_10),.S(OUT_SEGS[5]),);
	
	
	//D
	
	and_gate_4_inputs gate_11(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(ND7SEG[1]),.D(D7SEG[0]),.S(and_gate_11),);
	
	and_gate_4_inputs gate_12(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[1]),.D(ND7SEG[0]),.S(and_gate_12),);
	
	and_gate_3_inputs gate_13(.A(D7SEG[2]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate_13),);
	
	and_gate_2_inputs gate_14(.A(D7SEG[3]),.B(D7SEG[1]),.S(and_gate_14),);
	
	and_gate_3_inputs gate_15(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[0]),.S(and_gate_15),);
	
	or_gate_5_inputs gate_16(.A(and_gate_11),.B(and_gate_12),.C(and_gate_13),.D(and_gate_14),.E(and_gate_15),.S(OUT_SEGS[4]),);
	
	
	//E
	
	and_gate_2_inputs gate_16(.A(ND7SEG[3]),.B(D7SEG[0]),.S(and_gate_16),);
	
	and_gate_3_inputs gate_17(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[1]),.S(and_gate_17),);
	
	and_gate_3_inputs gate_18(.A(ND7SEG[2]),.B(ND7SEG[1]),.C(D7SEG[0]),.S(and_gate_18),);
	
	and_gate_3_inputs gate_19(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate_19),);
	
	or_gate_4_inputs gate_20(.A(and_gate_16),.B(and_gate_17),.C(and_gate_18),.D(and_gate_19),.S(OUT_SEGS[3]),);
	
	
	//F
	
	and_gate_3_inputs gate_21(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[0]),.S(and_gate_20),);
	
	and_gate_3_inputs gate_22(.A(ND7SEG[3]),.B(ND7SEG[2]),.C(D7SEG[1]),.S(and_gate_21),);
	
	and_gate_3_inputs gate_23(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[0]),.S(and_gate_22),);
	
	and_gate_3_inputs gate_24(.A(D7SEG[2]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate_23),);
	
	or_gate_4_inputs gate_25(.A(and_gate_20),.B(and_gate_21),.C(and_gate_22),.D(and_gate_23),.S(OUT_SEGS[2]),);
	
	
	//G
	
	and_gate_3_inputs gate_24(.A(ND7SEG[3]),.B(D7SEG[2]),.C(ND7SEG[1]),.S(and_gate_24),);
	
	and_gate_3_inputs gate_25(.A(D7SEG[2]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate_25),);
	
	and_gate_3_inputs gate_26(.A(D7SEG[3]),.B(D7SEG[1]),.C(D7SEG[0]),.S(and_gate_26),);
	
	and_gate_3_inputs gate_27(.A(D7SEG[3]),.B(D7SEG[2]),.C(D7SEG[1]),.S(and_gate_27),);
	
	or_gate_4_inputs gate_28(.A(and_gate_24),.B(and_gate_25),.C(and_gate_26),.D(and_gate_27),.S(OUT_SEGS[1]),);
	
	
	//DP
	
	
	and_gate_2_inputs gate_29(.A(1'b1),.B(1'b1),.S(OUT_SEGS[0]),);
	
	

endmodule 