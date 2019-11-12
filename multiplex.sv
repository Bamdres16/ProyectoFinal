module multiplex (input logic A, input logic B, input logic S, output logic f);

	

	assign f = S? A:B;
	
	
	
	
	
endmodule
