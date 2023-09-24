module modulo_status_dig_2(std1,stdig1);

	input [1:0] std1;
	output [3:0] stdig1;
	wire [1:0] nstd1;
	
	not(nstd1[1],std1[1]);
	not(nstd1[0],std1[0]);
	
	//STDIG0_0;
	
	and(stdig1[3], 1'b1,1'b1);
	
	//STDIG0_1;
	and(stdig1[2],std1[1],1'b1);
	
	//STDIG0_2;
	and(stdig1[1],std1[0],1'b1);
	
	//STDIG0_3
	and(stdig1[0],1'b1,1'b1);
	

endmodule 