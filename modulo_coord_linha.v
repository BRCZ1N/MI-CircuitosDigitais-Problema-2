module modulo_coord_linha(mdl,cdl)

	input [2:0] mdl;
	output [3:0] cdl;
	wire [2:0] nmdl;
	
	not(nmdl[2],mdl[2]);
	not(nmdl[1],mdl[1]);
	not(nmdl[0],mdl[0]);
	
	//STDIG0_0;
	
	and(cdl[3], 1'b0,1'b0);
	
	//STDIG0_1;
	and(cdl[2],mdl[2],1'b1);
	
	//STDIG0_2;
	and(cdl[1],mdl[1],1'b1);
	
	//STDIG0_3
	and(cdl[0],mdl[0],1'b1);

endmodule 