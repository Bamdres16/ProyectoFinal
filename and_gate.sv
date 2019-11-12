module and_gate #(parameter N = 4)
					(input logic [N-1:0]a,b,
					output logic [N-1:0]and_out);
		assign and_out = a & b;
endmodule
