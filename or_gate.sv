module or_gate #(parameter N = 4)
					 (input logic [N-1:0] a,b,
					 output logic [N-1:0] or_out);
		assign or_out = a | b;
endmodule
