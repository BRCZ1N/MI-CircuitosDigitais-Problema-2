module modulo_ff_d(d,clk,clr,q);

	input d,clk,clr;
	output reg q;
	
	
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
		
		end
	
	
	end



endmodule 