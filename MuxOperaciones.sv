// Operacion: Selecciona si es aritmética o lógica
//	s: Es el número de bit

module MuxOperaciones #(parameter N = 3)
							 (input logic [N-1:0] A,B,
							  input logic [2:0] selector,
							  input logic operacion,
							  output logic [N:0] result,
							  output logic [6:0] outResult);
							  
							  
							  
	logic [N-1:0] outArit, outLogic;
	logic cout;
	// Salidas de cada modulo	
	
	MuxLogico #(N) ML (A,B,selector,outLogic);
	MuxAritmetico #(N) MA (A,B,selector,cout,outArit);
	
	
	
	//assign result = operacion ? outArit : outLogic;
	
	assign result = operacion ?  (selector == 3'b000) ?  {cout,outArit}: {1'b0,outArit}
									  : {1'b0,outLogic};
	
	Decodificador decoResult (result,outResult);	 
																		
endmodule
