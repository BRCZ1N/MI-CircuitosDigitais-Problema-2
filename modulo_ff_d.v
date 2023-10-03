module modulo_ff_d(d,clk,clr,q,nq);

	input d,clk,clr;
	output reg q;
	output reg nq;
	
	
	initial begin
    q = 1'b1; 
	end
	
	always @(negedge clk) 
	
	begin 
	
		if(clr == 1'b0) 
		
		begin 
	
			q <= 1'b1;
	
		end 
		
		else 
		
		begin
		
			q <= d;
			nq <= !q;
		
		end
	
	
	end



endmodule 