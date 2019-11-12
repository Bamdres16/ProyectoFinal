module testALU #(parameter N = 4);
					
logic [N-1:0] A, B;
logic [N:0] out;
logic [2:0] selector;
logic [6:0] deco;
logic operacion;
	

MuxOperaciones #(4)ALU (A,B,selector,operacion,out,deco);

initial begin
//Prueba para sumar
	operacion = 1'b1; selector = 3'b000; 
	A = 4'b1111; B = 4'b1111; #10;
	assert (out == 5'b11110) else $error("1111 + 1111 failed");
	A = 4'b0001; B = 4'b0001; #10;
	assert (out == 5'b00010) else $error("0001 + 0001 failed");
	A = 4'b1010; B = 4'b1010; #10;
	assert (out == 5'b10100) else $error("1010 + 1010 failed");
	A = 4'b0101; B = 4'b0101; #10;
	assert (out == 5'b01010) else $error("0101 + 0101 failed");
// Prueba de Resta
	selector = 3'b001; 
	A = 4'b1111; B = 4'b1111; #10;
	assert (out == 5'b00000) else $error("1111 - 1111 failed");
	A = 4'b0110; B = 4'b1010; #10;
	assert (out == 5'b01100) else $error("0110 - 1010 failed");
	A = 4'b0111; B = 4'b0010; #10;
	assert (out == 5'b00101) else $error("0111 - 0010 failed");
	A = 4'b0000; B = 4'b1111; #10;
	assert (out == 5'b00001) else $error("0000 - 1111 failed");
	
// Prueba Corrimiento a la Derecha 
	selector = 3'b010;
	A = 4'b1010; B = 4'b0001; #10;
	assert (out == 5'b01101) else $error("Shift Arit Right 1010, 1 time, failed");
	A = 4'b1010; B = 4'b0010; #10;
	assert (out == 5'b01110) else $error("Shift Arit Right 1010, 2 times, failed");
	A = 4'b1010; B = 4'b0011; #10;
	assert (out == 5'b01111) else $error("Shift Arit Right 1010, 3 times, failed");
	A = 4'b0100; B = 4'b0001; #10;
	assert (out == 5'b00010) else $error("Shift Arit Right 1000, 1 time, failed");
	
// Prueba Corrimiento a la Izquierda

	selector = 3'b011;
	A = 4'b1010; B = 4'b0001; #10;
	assert (out == 5'b00100) else $error("Shift Arit Left 1010, 1 time, failed");
	A = 4'b1010; B = 4'b0010; #10;
	assert (out == 5'b01000) else $error("Shift Arit Left 1010, 2 times, failed");
	A = 4'b1010; B = 4'b0011; #10;
	assert (out == 5'b00000) else $error("Shift Arit Left 1010, 3 times, failed");
	A = 4'b0100; B = 4'b0001; #10;
	assert (out == 5'b01000) else $error("Shift Arit Left 1000, 1 time, failed");
	
// Prueba Corrimiento Circular

	selector = 3'b100;
	A = 4'b1010; #10;
	assert (out == 5'b00101) else $error("Shift Arit Circle 1010, failed");
	A = 4'b0101; #10;
	assert (out == 5'b01010) else $error("Shift Arit Circle 0101, failed");
	A = 4'b0001; #10;
	assert (out == 5'b01000) else $error("Shift Arit Circle 0001, failed");
	A = 4'b0100; #10;
	assert (out == 5'b00010) else $error("Shift Arit Circle 0100, failed");
	
// Prueba de AND
	operacion = 1'b0; selector = 3'b000; 
	A = 4'b1111; B = 4'b1111; #10;
	assert (out == 5'b01111) else $error("1111 and 1111 failed");
	A = 4'b0001; B = 4'b0001; #10;
	assert (out == 5'b00001) else $error("0001 and 0001 failed");
	A = 4'b1010; B = 4'b1010; #10;
	assert (out == 5'b01010) else $error("1010 and 1010 failed");
	A = 4'b0101; B = 4'b1101; #10;
	assert (out == 5'b00101) else $error("0101 and 1101 failed");
	
// Prueba de OR
	selector = 3'b001; 
	A = 4'b1010; B = 4'b1111; #10;
	assert (out == 5'b01111) else $error("1010 or 1111 failed");
	A = 4'b0001; B = 4'b1001; #10;
	assert (out == 5'b01001) else $error("0001 or 1001 failed");
	A = 4'b1010; B = 4'b1010; #10;
	assert (out == 5'b01010) else $error("1010 or 1010 failed");
	A = 4'b0101; B = 4'b1101; #10;
	assert (out == 5'b01101) else $error("0101 or 1101 failed");
	
// Prueba de XOR
	selector = 3'b010; 
	A = 4'b1010; B = 4'b1111; #10;
	assert (out == 5'b00101) else $error("1010 xor 1111 failed");
	A = 4'b0001; B = 4'b1001; #10;
	assert (out == 5'b01000) else $error("0001 xor 1001 failed");
	A = 4'b1010; B = 4'b1010; #10;
	assert (out == 5'b00000) else $error("1010 xor 1010 failed");
	A = 4'b0101; B = 4'b1101; #10;
	assert (out == 5'b01000) else $error("0101 xor 1101 failed");
	
// Prueba Corrimiento a la Derecha 
	selector = 3'b011;
	A = 4'b1010; B = 4'b0001; #10;
	assert (out == 5'b00101) else $error("Shift Logic Right 1010, 1 time, failed");
	A = 4'b1010; B = 4'b0010; #10;
	assert (out == 5'b00010) else $error("Shift Logic Right 1010, 2 times, failed");
	A = 4'b1010; B = 4'b0011; #10;
	assert (out == 5'b00001) else $error("Shift Logic Right 1010, 3 times, failed");
	A = 4'b0100; B = 4'b0001; #10;
	assert (out == 5'b00010) else $error("Shift Logic Right 1000, 1 time, failed");
	
// Prueba Corrimiento a la Izquierda

	selector = 3'b100;
	A = 4'b1010; B = 4'b0001; #10;
	assert (out == 5'b00100) else $error("Shift Logic Left 1010, 1 time, failed");
	A = 4'b1010; B = 4'b0010; #10;
	assert (out == 5'b01000) else $error("Shift Logic Left 1010, 2 times, failed");
	A = 4'b1010; B = 4'b0011; #10;
	assert (out == 5'b00000) else $error("Shift Logic Left 1010, 3 times, failed");
	A = 4'b0100; B = 4'b0001; #10;
	assert (out == 5'b01000) else $error("Shift Logic Left 1000, 1 time, failed");
	
// Prueba Corrimiento Circular

	selector = 3'b101;
	A = 4'b1010; #10;
	assert (out == 5'b00101) else $error("Shift Logic Circle 1010, failed");
	A = 4'b0101; #10;
	assert (out == 5'b01010) else $error("Shift Logic Circle 0101, failed");
	A = 4'b0001; #10;
	assert (out == 5'b01000) else $error("Shift Logic Circle 0001, failed");
	A = 4'b0100; #10;
	assert (out == 5'b00010) else $error("Shift Logic Circle 0100, failed");
	
	
	
end 
endmodule
