module rotator#(parameter N = 4)
					(input logic[N-1:0]A,
					output logic[N-1:0]Out);
	
		assign Out =  {A[0],A} >> 1;
						//Toma el ultimo bit de A si A fuera 110, entonces toma A[0] = 0, lo concatena adelante de A -> 0110 y lo corre a la derecha 1 Out = 0011
					
endmodule
