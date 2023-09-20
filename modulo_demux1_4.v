module modulo_demux1_4(S,E,Y)

	
	input [1:0]S, E;
	output [3:0]Y;
	wire  [1:0]NS;
	
	
	
	not(NS[0],S[0]);
	not(NS[1],S[1]);
		
	
	
	
	//p0
	
	and(Y[0],NS[0],NS[1],E);
	
	//p1
	
	and(Y[1],NS[0],S[1],E);
	
	//p2
	
	and(Y[2],S[0],NS[1],E);
	
	//p3
	and(Y[3],S[0],S[1],E);
	
endmodule 