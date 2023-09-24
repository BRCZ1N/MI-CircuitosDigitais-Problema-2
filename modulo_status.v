module modulo_status(std0,stdig0);

	input [1:0] std0;
	output [3:0] stdig0;
	wire [1:0] nstd0;
	wire nstd0_and_std1, std0_and_nstd1,nstd0_and_nstd1, std0_and_std1 ;
	not(nstd0[1],std0[1]);
	not(nstd0[0],std0[0]);
	
	//STDIG0_0;
	
	and(stdig0[3], 1'b1,1'b1);
	
	//STDIG0_1;
	and(nstd0_and_nstd1,nstd0[0],nstd0[1]);
	and(std0_and_std1,std0[0],std0[1]);
	or(stdig0[2],nstd0_and_nstd1,std0_and_std1);
	//STDIG0_2;
	and(nstd0_and_std1,nstd0[0],std0[1]);
	and(std0_and_nstd1,std0[0],nstd0[1]);
	or(stdig0[1],nstd0_and_std1,std0_and_nstd1);
	
	
	//STDIG0_3
	and(stdig0[0],std0[1]);
	
	
endmodule 