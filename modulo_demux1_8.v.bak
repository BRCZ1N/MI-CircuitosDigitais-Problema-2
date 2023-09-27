module modulo_demux1_8 (
sel,i0,i1,i2,
s0,s1,s2,s3,s4,s5,s6,s7,
Ns0,Ns1,Ns2,Ns3,Ns4,Ns5,Ns6,Ns7
);
input sel,i0,i1,i2;
output s0,s1,s2,s3,s4,s5,s6,s7,Ns0,Ns1,Ns2,Ns3,Ns4,Ns5,Ns6,Ns7;
wire
Nsel,out0_00,out0_01,out1_00,out1_01,out2_00,out2_01,out3_00,out3_01,out4_00,out4_01
,
out5_00,out5_01,out6_00,out6_01,out7_00,out7_01,
out0_10,out0_11,out1_10,out1_11,out2_10,out0_21,out3_10,out3_11,out4_10,out4_11,
out5_10,out5_11,out6_10,out6_11,out7_10,out7_11;
not (Nsel, sel);
not (Ni0, i0);
not (Ni1, i1);
not (Ni2, i2);
//Passagem das entradas para as saidas (caso o seletor esteja em nivel logico BAIXO)
//Saida 0
and (out0_00, Ni2, Ni1); and (out0_01, out0_00, Ni0); and (Ns0, out0_01, Nsel);
//Saida 1
and (out1_00, Ni2, Ni1); and (out1_01, out1_00, i0); and (Ns1, out1_01, Nsel);
//Saida 2
and (out2_00, Ni2, i1); and (out2_01, out2_00, Ni0); and (Ns2, out2_01, Nsel);
//Saida 3
and (out3_00, Ni2, i1); and (out3_01, out3_00, i0); and (Ns3, out3_01, Nsel);
//Saida 4
and (out4_00, i2, Ni1); and (out4_01, out4_00, Ni0); and (Ns4, out4_01, Nsel);
//Saida 5
and (out5_00, i2, Ni1); and (out5_01, out5_00, i0); and (Ns5, out5_01, Nsel);
//Saida 6
and (out6_00, i2, i1); and (out6_01, out6_00, Ni0); and (Ns6, out5_01, Nsel);
//Saida 7
and (out7_00, i2, i1); and (out7_01, out6_00, i0); and (Ns7, out7_01, Nsel);
//Passagem das entradas para as saidas (caso o seletor esteja em nivel logico ALTO)
//Saida 0
and (out0_10, Ni2, Ni1); and (out0_11, out0_10, Ni0); and (s0, out0_11, sel);
//Saida 1
and (out1_10, Ni2, Ni1); and (out1_11, out1_10, i0); and (s1, out1_11, sel);
//Saida 2
and (out2_10, Ni2, i1); and (out2_11, out2_10, Ni0); and (s2, out2_11, sel);
//Saida 3
and (out3_10, Ni2, i1); and (out3_11, out3_10, i0); and (s3, out3_11, sel);
//Saida 4
and (out4_10, i2, Ni1); and (out4_11, out4_10, Ni0); and (s4, out4_11, sel);
//Saida 5
and (out5_10, i2, Ni1); and (out5_11, out5_10, i0); and (s5, out5_11, sel);
//Saida 6
and (out6_10, i2, i1); and (out6_11, out6_10, Ni0); and (s6, out5_11, sel);
//Saida 7
and (out7_10, i2, i1); and (out7_11, out6_10, i0); and (s7, out7_11, sel);
endmodule