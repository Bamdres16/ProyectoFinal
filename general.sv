module general(A, B, S, F);

	input logic A;
	input logic B;
	input logic S;
	output logic F;
	
	//Cables intermedios entre salida de las compuertas y la entrada del mux.
	logic salida_end;
	logic salida_or;

	
	
	and_gate FA (.A0(A), .B0(B), .Out(salida_end));
	
	or_gate  BA (.A0(A), .B0(B), .or_out(salida_or));
	
	
	multiplex DA (.A(salida_end), .B(salida_or), .S(S), .f(F));
						
	
	
	

endmodule
