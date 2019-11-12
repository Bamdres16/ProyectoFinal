module sheftRight#(parameter N = 8)
							
						(input logic [N-1:0]a,
						input logic  [N-1:0]n,
						output logic [N-1:0]shift);
								
		 assign shift = a/((2'b10)**n);
								



endmodule
