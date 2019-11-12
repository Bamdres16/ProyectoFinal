module MuxAritmetico #(parameter N = 4)
							(input logic [N-1:0] A,B,
							 input logic [2:0] s,
							 output logic cout,
						    output logic [N-1:0] out);
							 
	logic [N-1:0] out_suma;
	logic [N-1:0] out_resta;
	logic [N-1:0] out_corrAR;
	logic [N-1:0] out_corrAI;
	logic [N-1:0] out_corrAC;
	logic [N-1:0] zeros = {N{1'b0}};
	
	adder #(N) AD (A,B,1'b0,out_suma,cout);
	substractor #(N) SB (A,B,out_resta);
	N_right_arit #(N) AR (A,B,out_corrAR);
	shiftLeft #(N) AI (A,B,out_corrAI);
	rotator #(N) AC (A,out_corrAC);
	
	assign out = s[2] ? (s[1] ? (s[0] ? zeros : zeros) 
										: (s[0] ? zeros : out_corrAC)) 
							 : (s[1] ? (s[0] ? out_corrAI : out_corrAR) 
										: (s[0] ? out_resta : out_suma));
	
endmodule 


