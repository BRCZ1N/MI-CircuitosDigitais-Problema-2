module modulo_demux1_36(A,input_sel,out);

	input A;
	input [5:0] input_sel;
	output [35:0] out;
	wire  [5:0] Ninput_sel;
	
	not(Ninput_sel[0],input_sel[0]);
	not(Ninput_sel[1],input_sel[1]);
	not(Ninput_sel[2],input_sel[2]);
	not(Ninput_sel[3],input_sel[3]);
	not(Ninput_sel[4],input_sel[4]);
	not(Ninput_sel[5],input_sel[5]);
	
	and_gate_7_inputs gate_1(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[35]),);
	and_gate_7_inputs gate_2(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[34]),);
	and_gate_7_inputs gate_3(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[33]),);
	and_gate_7_inputs gate_4(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[32]),);
	and_gate_7_inputs gate_5(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[31]),);
	and_gate_7_inputs gate_6(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[30]),);
	and_gate_7_inputs gate_7(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[29]),);
	and_gate_7_inputs gate_8(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[28]),);
	and_gate_7_inputs gate_9(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[27]),);
	and_gate_7_inputs gate_10(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[26]),);
	and_gate_7_inputs gate_11(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[25]),);
	and_gate_7_inputs gate_12(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[24]),);
	and_gate_7_inputs gate_13(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[23]),);
	and_gate_7_inputs gate_14(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[22]),);
	and_gate_7_inputs gate_15(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[21]),);
	and_gate_7_inputs gate_16(.A(Ninput_sel[5]),.B(Ninput_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[20]),);
	and_gate_7_inputs gate_17(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[19]),);
	and_gate_7_inputs gate_18(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[18]),);
	and_gate_7_inputs gate_19(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[17]),);
	and_gate_7_inputs gate_20(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[16]),);
	and_gate_7_inputs gate_21(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[15]),);
	and_gate_7_inputs gate_22(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[14]),);
	and_gate_7_inputs gate_23(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[13]),);
	and_gate_7_inputs gate_24(.A(Ninput_sel[5]),.B(input_sel[4]),.C(Ninput_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[12]),);
	and_gate_7_inputs gate_25(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[11]),);
	and_gate_7_inputs gate_26(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[10]),);
	and_gate_7_inputs gate_27(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[9]),);
	and_gate_7_inputs gate_29(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[8]),);
	and_gate_7_inputs gate_30(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[7]),);
	and_gate_7_inputs gate_31(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[6]),);
	and_gate_7_inputs gate_32(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[5]),);
	and_gate_7_inputs gate_33(.A(Ninput_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[4]),);
	and_gate_7_inputs gate_34(.A(input_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[3]),);
	and_gate_7_inputs gate_35(.A(input_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(Ninput_sel[1]),.F(input_sel[0]),.G(A),.S(out[2]),);
	and_gate_7_inputs gate_36(.A(input_sel[5]),.B(Ninput_sel[4]),.C(Ninput_sel[3]),.D(Ninput_sel[2]),.E(input_sel[1]),.F(Ninput_sel[0]),.G(A),.S(out[1]),);
	and_gate_7_inputs gate_37(.A(input_sel[5]),.B(input_sel[4]),.C(input_sel[3]),.D(input_sel[2]),.E(input_sel[1]),.F(input_sel[0]),.G(A),.S(out[0]),);
	

endmodule 
