module N_right_arit #(parameter n = 3)(input signed [n-1:0] a, b,
													output signed [n-1:0] y);
	
	assign y = a >>> b;
	
	
endmodule