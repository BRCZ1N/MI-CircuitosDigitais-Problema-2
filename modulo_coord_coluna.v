module modulo_coord_coluna(mdc,cdc)

	input [2:0] mdc;
	output [3:0] cdc;
	wire [2:0] nmdc;
	
	not(nmdc[2],mdc[2]);
	not(nmdc[1],mdc[1]);
	not(nmdc[0],mdlc[0]);
	
	//STDIG0_0;
	
	and(cdc[3], 1'b0,1'b0);
	
	//STDIG0_1;
	and(cdc[2],mdc[2],1'b1);
	
	//STDIG0_2;
	and(cdc[1],mdc[1],1'b1);
	
	//STDIG0_3
	and(cdc[0],mdc[0],1'b1);

endmodule 