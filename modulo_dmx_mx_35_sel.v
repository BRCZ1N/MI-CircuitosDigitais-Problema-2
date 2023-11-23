module modulo_dmx_mx_35_sel(mdc,mdl,SEL35E);

	input [2:0] mdc;
	input [2:0] mdl;
	wire [2:0] Nmdc;
	wire [2:0] Nmdl;
	output [5:0] SEL35E;
	
	not(Nmdc[2], mdc[2]);
	not(Nmdc[1], mdc[1]);
	not(Nmdc[0], mdc[0]);
	
	not(Nmdl[2], mdl[2]);
	not(Nmdl[1], mdl[1]);
	not(Nmdl[0], mdl[0]);
	
	wire [4:0] terms1;
	wire [6:0] terms2;
	wire [8:0] terms3;
	wire [11:0] terms4;
	wire [8:0] terms5;
	wire [4:0] terms6;
	
	wire [1:0] sel35E5Wire;
	wire [1:0] sel35E4Wire;
	wire [2:0] sel35E3Wire;
	wire [2:0] sel35E2Wire;
	wire [2:0] sel35E1Wire;
	wire [1:0] sel35E0Wire;

// Termo 1: mdc[2]mdc[0]
and gate1(terms1[0], mdc[2], mdc[0]);

// Termo 2: mdc[2]mdc[1]
and gate2(terms1[1], mdc[2], mdc[1]);

// Termo 3: mdl[2]mdl[1]mdc[1]
and gate3(terms1[2], mdl[2], mdl[1], mdc[1]);

// Termo 4: mdl[2]mdl[1]mdc[2]
and gate4(terms1[3], mdl[2], mdl[1], mdc[2]);

// Termo 5: mdl[2]mdl[1]mdl[0]
and gate5(terms1[4], mdl[2], mdl[1], mdl[0]);

// Expressão final: SEL35E1 = Termo 1 + Termo 2 + Termo 3 + Termo 4 + Termo 5
or or_gate_1e5(sel35E5Wire[1], terms1[0], terms1[1]);
or or_gate_2e5(sel35E5Wire[0], terms1[2], terms1[3], terms1[4]);
or or_gate_3e5(SEL35E[5], sel35E5Wire[1], sel35E5Wire[0]);

// Termo 1: mdc[2]mdc[0]
and gate6(terms2[0], mdc[2], mdc[0]);

// Termo 2: mdc[2]mdc[1]
and gate7(terms2[1], mdc[2], mdc[1]);

// Termo 3: mdl[1]mdl[0]mdc[0]
and gate8(terms2[2], mdl[1], mdl[0], mdc[0]);

// Termo 4: mdl[1]mdl[0]mdc[1]
and gate9(terms2[3], mdl[1], mdl[0], mdc[1]);

// Termo 5: mdl[1]mdl[0]mdc[2]
and gate10(terms2[4], mdl[1], mdl[0], mdc[2]);

// Termo 6: mdl[2]' (negando mdl[2])
and gate_11(terms2[5], mdl[2], Nmdl[1]);

// Termo 7: mdl[2]mdc[2]'mdc[1]' (mdl[2] and (not mdc[2]) and (not mdc[1]))
and gate_12(terms2[6], mdl[2], Nmdc[2], Nmdc[1]);

// Expressão final: SEL35E2 = Termo 1 + Termo 2 + Termo 3 + Termo 4 + Termo 5 + Termo 6 + Termo 7

or or_gate_1e4(sel35E4Wire[1], terms2[0], terms2[1], terms2[2], terms2[3]);
or or_gate_2e4(sel35E4Wire[0], terms2[4], terms2[5],terms2[6]);
or or_gate_3e4(SEL35E[4], sel35E4Wire[1], sel35E4Wire[0]);


// Termo 1: mdc[2]mdc[0]
and gate13(terms3[0], mdc[2], mdc[0]);

// Termo 2: mdc[2]mdc[1]
and gate14(terms3[1], mdc[2], mdc[1]);

// Termo 3: Nmdl[1]mdl[0]mdc[1]mdc[0]
and gate15(terms3[2], Nmdl[1], mdl[0], mdc[1], mdc[0]);

// Termo 4: Nmdl[1]mdl[0]mdc[2]
and gate16(terms3[3], Nmdl[1], mdl[0], mdc[2]);

// Termo 5: Nmdl[2]mdl[1]Nmdl[0]
and gate17(terms3[4], Nmdl[2], mdl[1], Nmdl[0]);

// Termo 6: mdl[1]Nmdc[2]Nmdc[1]Nmdc[0]
and gate18(terms3[5], mdl[1], Nmdc[2], Nmdc[1], Nmdc[0]);

// Termo 7: Nmdl[2]mdl[1]Nmdc[2]
and gate19(terms3[6], mdl[2], Nmdl[1], mdc[2]);

// Termo 8: Nmdl[2]mdl[0]
and gate20(terms3[7], mdl[2], mdl[0]);

// Termo 9: mdl[1],Nmdl[0],Nmdc[2],Nmdc[1]
and gate21(terms3[8], mdl[1],Nmdl[0],Nmdc[2],Nmdc[1]);

// Expressão final: SEL35E3 = Termo 1 + Termo 2 + Termo 3 + Termo 4 + Termo 5 + Termo 6 + Termo 7 + Termo 8

or or_gate_1e3(sel35E3Wire[2], terms3[0], terms3[1], terms3[2]);
or or_gate_2e3(sel35E3Wire[1], terms3[3], terms3[4], terms3[5]);
or or_gate_3e3(sel35E3Wire[0], terms3[6], terms3[7],terms3[8]);
or or_gate_4e3(SEL35E[3],sel35E3Wire[2],sel35E3Wire[1],sel35E3Wire[0]);

// Termo 1: Nmdl[2]Nmdl[0]Nmdc[2]
and gate22(terms4[0], Nmdl[2], Nmdl[0], mdc[2]);

// Termo 2: Nmdl[2]Nmdl[1]Nmdl[0]mdc[1]
and gate23(terms4[1], Nmdl[2], mdl[1], Nmdl[0], mdc[1]);

// Termo 3: mdc[2]mdc[0]
and gate24(terms4[2], mdc[2], mdc[0]);

// Termo 4: mdc[2]mdc[1]
and gate25(terms4[3], mdc[2], mdc[1]);

// Termo 5: mdl[2]mdl[0]mdc[2]
and gate26(terms4[4], mdl[2], mdl[0], mdc[2]);

// Termo 6: mdl[2]mdl[1]mdl[0]
and gate27(terms4[5], mdl[2], mdl[1], mdl[0]);

// Termo 7: Nmdl[2]Nmdl[1]Nmdl[0]mdc[2]Nmdc[1]
and gate28(terms4[6], Nmdl[2], Nmdl[1], mdl[0], Nmdc[2], Nmdc[1]);

// Termo 8: Nmdl[2]Nmdl[1]Nmdl[0]mdc[2]Nmdc[0]
and gate29(terms4[7], Nmdl[2], Nmdl[1], mdl[0], Nmdc[2], Nmdc[0]);

// Termo 9: Nmdl[2]Nmdl[0]mdc[2]Nmdc[1]Nmdc[0]
and gate30(terms4[8], Nmdl[2], mdl[0], Nmdc[2], Nmdc[1], Nmdc[0]);

// Termo 10: mdl[2]Nmdl[1]Nmdl[0]Nmdc[2]
and gate31(terms4[9], mdl[2], Nmdl[1], Nmdl[0], Nmdc[2]);

// Termo 11: mdl[2]Nmdl[1]Nmdl[0]Nmdc[2]
and gate32(terms4[10], mdl[2], Nmdl[1], mdc[1], mdc[0]);

// Termo 12: mdl[2]Nmdl[1]Nmdl[0]Nmdc[2]
and gate33(terms4[11], mdl[2], Nmdl[0], Nmdc[2], Nmdc[1]);

// Expressão final: SEL35E4 = Termo 1 + Termo 2 + Termo 3 + Termo 4 + Termo 5 + Termo 6 + Termo 7 + Termo 8 + Termo 9 + Termo 10

or or_gate_1e2(sel35E2Wire[2], terms4[0], terms4[1], terms4[2], terms4[3]);
or or_gate_2e2(sel35E2Wire[1], terms4[5], terms4[6], terms4[7], terms4[8]);
or or_gate_3e2(sel35E2Wire[0], terms4[9],terms4[10], terms4[11]);

or or_gate_2(SEL35E[2], sel35E2Wire[2], sel35E2Wire[1], sel35E2Wire[0] );

// Termo 1: Nmdl[1]Nmdl[0]Nmdc[1]
and gate34(terms5[0], Nmdl[1], Nmdl[0], mdc[1]);

// Termo 2: mdc[2]mdc[0]
and gate35(terms5[1], mdc[2], mdc[0]);

// Termo 3: Nmdl[1]Nmdl[0]mdc[1]Nmdc[0]
and gate36(terms5[2], Nmdl[1], mdl[0], Nmdc[1], mdc[0]);

// Termo 4: Nmdl[1]mdc[1]Nmdc[0]
and gate37(terms5[3], Nmdl[1], mdc[1], Nmdc[0]);

// Termo 5: Nmdl[1]mdl[0]Nmdc[1]
and gate38(terms5[4], mdl[1], Nmdl[0], Nmdc[1]);

// Termo 6: Nmdl[1]mdc[1]Nmdc[0]
and gate39(terms5[5], mdl[1], Nmdc[1], Nmdc[0]);

// Termo 7: Nmdl[1]mdl[0]mdc[1]mdc[0]
and gate40(terms5[6], mdl[1], mdl[0], mdc[1], mdc[0]);

// Termo 8: mdc[2]mdc[1]
and gate41(terms5[7], mdc[2], mdc[1]);

// Termo 9: mdl[2]mdl[1]mdl[0]
and gate42(terms5[8], mdl[2], mdl[1], mdl[0]);

// Expressão final: SEL35E5 = Termo 1 + Termo 2 + Termo 3 + Termo 4 + Termo 5 + Termo 6 + Termo 7 + Termo 8 + Termo 9

or or_gate_1e1(sel35E1Wire[2], terms5[0], terms5[1], terms5[2], terms5[3]);
or or_gate_2e1(sel35E1Wire[1], terms5[4], terms5[5], terms5[6]);
or or_gate_3e1(sel35E1Wire[0], terms5[7], terms5[8]);

or or_gate_3(SEL35E[1], sel35E1Wire[2], sel35E1Wire[1], sel35E1Wire[0] );

// Termo 1: Nmdl[0]Nmdc[0]
and gate43(terms6[0], Nmdl[0], mdc[0]);

// Termo 2: mdc[2]mdc[1]
and gate44(terms6[1], mdc[2], mdc[1]);

// Termo 3: mdl[0]Nmdc[2]Nmdc[0]
and gate45(terms6[2], mdl[0], Nmdc[0]);

// Termo 4: mdc[2]mdc[0]
and gate46(terms6[3], mdc[2], mdc[0]);

// Termo 5: mdl[1]mdl[0]Nmdc[0]
and gate47(terms6[4], mdl[2], mdl[1], mdc[0]);

or or_gate_1e0(sel35E0Wire[1], terms6[0], terms6[1], terms6[2]);
or or_gate_2e0(sel35E0Wire[0], terms6[3], terms6[4]);

or or_gate_4(SEL35E[0], sel35E0Wire[1], sel35E0Wire[0]);

endmodule



