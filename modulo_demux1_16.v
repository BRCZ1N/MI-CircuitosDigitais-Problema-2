module modulo_demux1_16(S,E,Y)

	input [3:0]S, E;
	output [15:0]Y;
	wire  [3:0]NS;
	
	not(NS[0],S[0]);
	not(NS[1],S[1]);
	not(NS[2],S[2]);
	not(NS[3],S[3]);
	//p0
	wire NS1_and_NS2_and_NS3, NS4_and_E;
	and(NS1_and_NS2_and_NS3,NS[0],NS[1],NS[2]);
	and(NS4_and_E, NS[3], E);
	and(Y[0],NS1_and_NS2_and_NS3,NS4_and_E);


   //p1

	wire S4_and_E;
	and(S4_and_E, S[3], E);
	and(Y[1],NS1_and_NS2_and_NS3,S4_and_E);
	
	//p2
	

	wire NS1_and_NS2_and_S3;
	and(NS1_and_NS2_and_S3,NS[0],NS[1],S[2]);
	and(Y[2],NS1_and_NS2_and_NS3,NS4_and_E);
	
	//p3
	and(Y[3],NS1_and_NS2_and_S3,S4_and_E);
	
	
	//p4
	
	wire NS1_and_S2_and_NS3;
	and(NS1_and_S2_and_NS3,NS[0],S[1],NS[2]);
	and((Y[4],NS1_and_S2_and_NS3,NS4_and_E);
	
	//p5
	
	and(Y[5],NS1_and_S2_and_NS3,S4_and_E);
	
	//p6
	
	wire NS1_and_S2_and_S3;
	
	
	and(NS1_and_S2_and_S3,NS[0],S[1],S[2]);
	and(Y[6],NS1_and_S2_and_S3,NS4_and_E);

	//p7
	and(Y[7],NS1_and_S2_and_S3,S4_and_E);
	
	//p8
	wire S1_and_NS2_and_NS3;
	and(S1_and_NS2_and_NS3,S[0],NS[1],NS[2]);
	and(Y[8],S1_and_NS2_and_NS3,NS4_and_E);
	
	//p9
	
	and(Y[9],S1_and_NS2_and_NS3, S4_and_E); 
	//p10
	wire S1_and_NS2_and_S3;
	and(S1_and_NS2_and_S3,S[0],NS[1],S[2]); 
	and(Y[10], S1_and_NS2_and_S3,NS4_and_E);
	//p11
	
	and(Y[11], S1_and_NS2_and_S3,S4_and_E);
	
	
	//p12
	wire S1_and_S2_and_NS3;
	and(S1_and_S2_and_NS3,S[0],S[1],NS[2]);
	and(Y[12],S1_and_S2_and_NS3,NS4_and_E);
	
	
	//p13
	and(Y[13],S1_and_S2_and_NS3, S4_and_E);
	
	//p14
	wire S1_and_S2_and_S3;
	and(S1_and_S2_and_S3,S[0],S[1],S[2]);
	and(Y[14],S1_and_S2_and_S3, NS4_and_E);
	
	//p15
	
	and(Y[15],S1_and_S2_and_S3, S4_and_E);
	
endmodule 