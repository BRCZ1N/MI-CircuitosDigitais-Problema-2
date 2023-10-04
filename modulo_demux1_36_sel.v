module modulo_demux1_36_sel(mdc,mdl,out_sel);

	input [2:0] mdc;
	input [2:0] mdl;
	wire [2:0] nmdc;
	wire [2:0] nmdl;
	output [5:0] out_sel;
	
	wire [4:0] sel_ends_1;
	wire [5:0] sel_ends_2;
	wire [7:0] sel_ends_3;
	wire [10:0] sel_ends_4;
	wire [8:0] sel_ends_5;
	wire [4:0] sel_ends_6;
	
	wire [1:0] wire_sel_2;
	wire [1:0] wire_sel_3;
	wire [2:0] wire_sel_4;
	wire [1:0] wire_sel_5;
	wire wire_sel_6;
	
	not(nmdc[2], mdc[2]);
	not(nmdc[1], mdc[1]);
	not(nmdc[0], mdc[0]);
	
	not(nmdl[2], mdl[2]);
	not(nmdl[1], mdl[1]);
	not(nmdl[0], mdl[0]);
	
	
	and_gate_3_inputs gate_2(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_1[3]),);
	and_gate_2_inputs gate_3(.A(mdc[2]),.B(mdl[2]),.S(sel_ends_1[2]),);
	and_gate_2_inputs gate_4(.A(mdc[2]),.B(mdc[0]),.S(sel_ends_1[1]),);
	and_gate_2_inputs gate_5(.A(mdc[2]),.B(mdc[1]),.S(sel_ends_1[0]),);
	
	or_gate_4_inputs gate_50(.A(sel_ends_1[3]),.B(sel_ends_1[2]),.C(sel_ends_1[1]),.D(sel_ends_1[0]),.S(out_sel[5]),);
	
	and_gate_3_inputs gate_6(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_2[5]),);
	and_gate_2_inputs gate_7(.A(mdc[1]),.B(mdl[1]),.S(sel_ends_2[4]),);
	and_gate_2_inputs gate_8(.A(mdc[1]),.B(mdl[2]),.S(sel_ends_2[3]),);
	and_gate_2_inputs gate_9(.A(mdc[1]),.B(mdc[0]),.S(sel_ends_2[2]),);
	and_gate_2_inputs gate_10(.A(mdc[2]),.B(nmdl[2]),.S(sel_ends_2[1]),);
	and_gate_2_inputs gate_11(.A(mdc[2]),.B(mdc[0]),.S(sel_ends_2[0]),);
	
	or_gate_3_inputs gate_51(.A(sel_ends_2[5]),.B(sel_ends_2[4]),.C(sel_ends_2[3]),.S(wire_sel_2[1]),);
	or_gate_3_inputs gate_52(.A(sel_ends_2[2]),.B(sel_ends_2[1]),.C(sel_ends_2[0]),.S(wire_sel_2[0]),);
	or_gate_2_inputs gate_53(.A(wire_sel_2[1]),.B(wire_sel_2[0]),.S(out_sel[4]),);
	
	and_gate_3_inputs gate_12(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_3[7]),);
	and_gate_3_inputs gate_13(.A(nmdc[1]),.B(mdc[0]),.C(mdl[0]),.S(sel_ends_3[6]),);
	and_gate_3_inputs gate_14(.A(nmdc[1]),.B(mdc[0]),.C(mdl[1]),.S(sel_ends_3[5]),);
	and_gate_2_inputs gate_15W(.A(mdc[0]),.B(mdl[2]),.S(sel_ends_3[4]),);
	and_gate_4_inputs gate_16(.A(mdc[1]),.B(nmdc[0]),.C(nmdl[2]),.D(nmdl[1]),.S(sel_ends_3[3]),);
	and_gate_3_inputs gate_17(.A(mdc[0]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_3[2]),);
	and_gate_2_inputs gate_18(.A(mdc[2]),.B(nmdl[2]),.S(sel_ends_3[1]),);
	and_gate_2_inputs gate_19(.A(mdc[2]),.B(mdc[1]),.S(sel_ends_3[0]),);
	
	or_gate_4_inputs gate_54(.A(sel_ends_3[7]),.B(sel_ends_3[6]),.C(sel_ends_3[5]),.D(sel_ends_3[4]),.S(wire_sel_3[1]),);
	or_gate_4_inputs gate_55(.A(sel_ends_3[3]),.B(sel_ends_3[2]),.C(sel_ends_3[1]),.D(sel_ends_3[0]),.S(wire_sel_3[0]),);
	or_gate_2_inputs gate_56(.A(wire_sel_3[1]),.B(wire_sel_3[0]),.S(out_sel[3]),);
	
	
	and_gate_4_inputs gate_20(.A(nmdc[2]),.B(nmdc[1]),.C(nmdc[0]),.D(mdl[2]),.S(sel_ends_4[10]),);
	and_gate_4_inputs gate_21(.A(mdc[0]),.B(nmdl[2]),.C(nmdl[1]),.D(nmdl[0]),.S(sel_ends_4[9]),);
	and_gate_3_inputs gate_22(.A(mdc[1]),.B(nmdl[2]),.C(nmdl[1]),.S(sel_ends_4[8]),);
	and_gate_4_inputs gate_23(.A(mdc[1]),.B(mdc[0]),.C(nmdl[2]),.D(nmdl[0]),.S(sel_ends_4[7]),); 
	and_gate_3_inputs gate_24(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_4[6]),);
	and_gate_2_inputs gate_25(.A(mdc[2]),.B(nmdl[2]),.S(sel_ends_4[5]),);
	and_gate_2_inputs gate_26(.A(mdc[2]),.B(mdc[0]),.S(sel_ends_4[4]),);
	and_gate_2_inputs gate_27(.A(mdc[2]),.B(mdc[1]),.S(sel_ends_4[3]),);
	and_gate_4_inputs gate_28(.A(nmdc[2]),.B(nmdc[1]),.C(mdl[2]),.D(mdl[0]),.S(sel_ends_4[2]),);
	and_gate_4_inputs gate_29(.A(nmdc[2]),.B(nmdc[1]),.C(mdl[2]),.D(mdl[1]),.S(sel_ends_4[1]),);
	and_gate_4_inputs gate_30(.A(nmdc[2]),.B(nmdc[0]),.C(mdl[2]),.D(mdl[1]),.S(sel_ends_4[0]),);
	
	or_gate_3_inputs gate_57(.A(sel_ends_4[10]),.B(sel_ends_4[9]),.C(sel_ends_4[8]),.S(wire_sel_4[2]),);
	or_gate_4_inputs gate_58(.A(sel_ends_4[7]),.B(sel_ends_4[6]),.C(sel_ends_4[5]),.D(sel_ends_4[4]),.S(wire_sel_4[1]),);
	or_gate_4_inputs gate_59(.A(sel_ends_4[3]),.B(sel_ends_4[2]),.C(sel_ends_4[1]),.D(sel_ends_4[0]),.S(wire_sel_4[0]),);
	or_gate_3_inputs gate_60(.A(wire_sel_4[2]),.B(wire_sel_4[1]),.C(wire_sel_4[0]),.S(out_sel[2]),);
 
	and_gate_3_inputs gate_31(.A(nmdc[1]),.B(nmdc[0]),.C(mdl[1]),.S(sel_ends_5[8]),);
	and_gate_4_inputs gate_32(.A(nmdc[1]),.B(mdc[0]),.C(nmdl[1]),.D(nmdl[0]),.S(sel_ends_5[7]),);
	and_gate_3_inputs gate_33(.A(nmdc[1]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_5[6]),);
	and_gate_3_inputs gate_34(.A(mdc[1]),.B(nmdc[0]),.C(nmdl[1]),.S(sel_ends_5[5]),);
	and_gate_3_inputs gate_35(.A(mdc[1]),.B(nmdl[1]),.C(mdl[0]),.S(sel_ends_5[4]),);
	and_gate_4_inputs gate_36(.A(mdc[1]),.B(mdc[0]),.C(mdl[1]),.D(nmdl[0]),.S(sel_ends_5[3]),);
	and_gate_2_inputs gate_37(.A(mdc[2]),.B(mdc[0]),.S(sel_ends_5[2]),);
	and_gate_3_inputs gate_38(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_5[1]),);
	and_gate_2_inputs gate_39(.A(mdc[2]),.B(mdl[1]),.S(sel_ends_5[0]),);
	
	or_gate_4_inputs gate_61(.A(sel_ends_5[8]),.B(sel_ends_5[7]),.C(sel_ends_5[6]),.D(sel_ends_5[5]),.S(wire_sel_5[1]),);
	or_gate_4_inputs gate_62(.A(sel_ends_5[4]),.B(sel_ends_5[3]),.C(sel_ends_5[2]),.D(sel_ends_5[1]),.S(wire_sel_5[0]),);
	or_gate_3_inputs gate_63(.A(wire_sel_5[1]),.B(wire_sel_5[0]),.C(sel_ends_5[0]),.S(out_sel[1]),);
	
	and_gate_2_inputs gate_40(.A(nmdc[0]),.B(mdl[0]),.S(sel_ends_6[4]),);
	and_gate_2_inputs gate_41(.A(mdc[0]),.B(nmdl[0]),.S(sel_ends_6[3]),);
	and_gate_2_inputs gate_42(.A(mdc[2]),.B(mdc[1]),.S(sel_ends_6[2]),);
	and_gate_3_inputs gate_43(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(sel_ends_6[1]),);
	and_gate_2_inputs gate_44(.A(mdc[2]),.B(mdl[0]),.S(sel_ends_6[0]),);
	
	or_gate_5_inputs gate_64(.A(sel_ends_6[4]),.B(sel_ends_6[3]),.C(sel_ends_6[2]),.D(sel_ends_6[1]),.E(sel_ends_6[0]),.S(out_sel[0]),);
		
	
endmodule 
