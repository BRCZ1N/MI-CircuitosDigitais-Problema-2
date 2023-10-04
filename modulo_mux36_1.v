module modulo_mux36_1(A,input_sel,out);

	input [35:0] A;
	input [5:0] input_sel;
	output out;
	wire  [5:0] Ninput_sel;
	wire [35:0] wire_mux;
	wire [6:0] wire_mux_or;
	wire [1:0] wire_mux_or_2;
	
	not(Ninput_sel[0],input_sel[0]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[3],input_sel[3]);
	not(Ninput_sel[4],input_sel[4]);
	not(Ninput_sel[5],input_sel[5]);
	
	and_gate_7_inputs gate_1(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[35]),.S(wire_mux[35]),);
	and_gate_7_inputs gate_2(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[34]),.S(wire_mux[34]),);
	and_gate_7_inputs gate_3(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[33]),.S(wire_mux[33]),);
	and_gate_7_inputs gate_4(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[32]),.S(wire_mux[32]),);
	and_gate_7_inputs gate_5(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[31]),.S(wire_mux[31]),);
	and_gate_7_inputs gate_6(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[30]),.S(wire_mux[30]),);
	and_gate_7_inputs gate_7(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[29]),.S(wire_mux[29]),);
	and_gate_7_inputs gate_8(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[28]),.S(wire_mux[28]),);
	and_gate_7_inputs gate_9(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[27]),.S(wire_mux[27]),);
	and_gate_7_inputs gate_10(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[26]),.S(wire_mux[26]),);
	and_gate_7_inputs gate_11(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[25]),.S(wire_mux[25]),);
	and_gate_7_inputs gate_12(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[24]),.S(wire_mux[24]),);
	and_gate_7_inputs gate_13(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[23]),.S(wire_mux[23]),);
	and_gate_7_inputs gate_14(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[22]),.S(wire_mux[22]),);
	and_gate_7_inputs gate_15(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[21]),.S(wire_mux[21]),);
	and_gate_7_inputs gate_16(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[20]),.S(wire_mux[20]),);
	and_gate_7_inputs gate_17(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[19]),.S(wire_mux[19]),);
	and_gate_7_inputs gate_18(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[18]),.S(wire_mux[18]),);
	and_gate_7_inputs gate_19(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[17]),.S(wire_mux[17]),);
	and_gate_7_inputs gate_20(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[16]),.S(wire_mux[16]),);
	and_gate_7_inputs gate_21(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[15]),.S(wire_mux[15]),);
	and_gate_7_inputs gate_22(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[14]),.S(wire_mux[14]),);
	and_gate_7_inputs gate_23(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[13]),.S(wire_mux[13]),);
	and_gate_7_inputs gate_24(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[12]),.S(wire_mux[12]),);
	and_gate_7_inputs gate_25(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[11]),.S(wire_mux[11]),);
	and_gate_7_inputs gate_26(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[10]),.S(wire_mux[10]),);
	and_gate_7_inputs gate_27(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[9]),.S(wire_mux[9]),);
	and_gate_7_inputs gate_29(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[8]),.S(wire_mux[8]),);
	and_gate_7_inputs gate_30(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[7]),.S(wire_mux[7]),);
	and_gate_7_inputs gate_31(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[6]),.S(wire_mux[6]),);
	and_gate_7_inputs gate_32(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[5]),.S(wire_mux[5]),);
	and_gate_7_inputs gate_33(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[4]),.S(wire_mux[4]),);
	and_gate_7_inputs gate_34(.A(input_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A[3]),.S(wire_mux[3]),);
	and_gate_7_inputs gate_35(.A(input_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A[2]),.S(wire_mux[2]),);
	and_gate_7_inputs gate_36(.A(input_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A[1]),.S(wire_mux[1]),);
	and_gate_7_inputs gate_37(.A(input_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A[0]),.S(wire_mux[0]),);
	
	
	or_gate_5_inputs gate_38(.A(wire_mux[35]),.B(wire_mux[34]),.C(wire_mux[33]),.D(wire_mux[32]),.E(wire_mux[31]),.S(wire_mux_or[6]),);
	or_gate_5_inputs gate_39(.A(wire_mux[30]),.B(wire_mux[29]),.C(wire_mux[28]),.D(wire_mux[27]),.E(wire_mux[26]),.S(wire_mux_or[5]),);
	or_gate_5_inputs gate_40(.A(wire_mux[25]),.B(wire_mux[24]),.C(wire_mux[23]),.D(wire_mux[22]),.E(wire_mux[21]),.S(wire_mux_or[4]),);
	or_gate_5_inputs gate_41(.A(wire_mux[20]),.B(wire_mux[19]),.C(wire_mux[18]),.D(wire_mux[17]),.E(wire_mux[16]),.S(wire_mux_or[3]),);
	or_gate_5_inputs gate_42(.A(wire_mux[15]),.B(wire_mux[14]),.C(wire_mux[13]),.D(wire_mux[12]),.E(wire_mux[11]),.S(wire_mux_or[2]),);
	or_gate_5_inputs gate_43(.A(wire_mux[10]),.B(wire_mux[9]),.C(wire_mux[8]),.D(wire_mux[7]),.E(wire_mux[6]),.S(wire_mux_or[1]),);
	or_gate_5_inputs gate_44(.A(wire_mux[5]),.B(wire_mux[4]),.C(wire_mux[3]),.D(wire_mux[2]),.E(wire_mux[1]),.S(wire_mux_or[0]),);
	
	or_gate_4_inputs gate_45(.A(wire_mux_or[6]),.B(wire_mux_or[5]),.C(wire_mux_or[4]),.D(wire_mux_or[3]),.S(wire_mux_or_2[1]),);
	or_gate_4_inputs gate_46(.A(wire_mux_or[2]),.B(wire_mux_or[1]),.C(wire_mux_or[0]),.D(wire_mux[0]),.S(wire_mux_or_2[0]),);
	
	or_gate_2_inputs gate_47(.A(wire_mux_or_2[1]),.B(wire_mux_or_2[0]),.S(out),);
	

endmodule 
