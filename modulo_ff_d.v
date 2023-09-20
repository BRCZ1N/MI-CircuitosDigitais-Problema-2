module modulo_ff_d(d,clock,clr,prst,q)

	input d,clock,clr,prst;
	output q;
	
	reg reg_q;
	
	always @(negedge clock or negedge clr) begin 
	
		if(clr) begin 
	
			q <= 1'b0;
	
	
		end 
		
		else begin
		
			q <= q_reg;
		
		end
	
	
	end



endmodule 