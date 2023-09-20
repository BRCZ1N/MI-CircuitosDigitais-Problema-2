module modulo_status_dig_1(A,B,C)

	input STD0_0,STD0_1;
	output STDIG0_0,STDIG0_1,STDIG0_2,STDIG0_3;
	wire NSTD0_0, NSTD0_1;
	wire signal_high;
	
	assign signal_high = 1'b1;
	assign signal_low = 1'b0;
	
	not(NSTD0_0,STD0_0);
	not(NSTD0_1,STD0_1);
	
	//STDIG0_0
	
	assign STDIG0_0 = signal_high;
	
	//STDIG0_1
	
	STDIG0_1 = NSTD0_0;
	
	//STDIG0_2
	
	STDIG0_2 = NSTD0_1;
	
	//STDIG0_3
	
	assign STDIG0_3 = signal_low;
	
	
	
	and(F2U,NA,B,NC);
	
endmodule 