module modulo_status(std0,stdig0);

	input [1:0] std0;
	output [3:0] stdig0;
	wire [1:0] nstd0;
	
	not(nstd0[1],std0[1]);
	not(nstd0[0],std0[0]);
	
	//STDIG0_0;
	
	and(stdig0[3], 1'b1,1'b1);
	
	//STDIG0_1;
	and(stdig0[2],std0[1],1'b1);
	
	//STDIG0_2;
	and(stdig0[1],std0[0],1'b1);
	
	//STDIG0_3
	and(stdig0[0],1'b0,1'b0);
	
	
endmodule 