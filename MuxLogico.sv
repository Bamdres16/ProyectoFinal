module MuxLogico #(parameter N = 4)
						(input logic [N-1:0] A, B,
						 input logic [2:0] s,
						 output logic [N-1:0] out);
	logic [N-1:0] out_and;
	logic [N-1:0] out_or;
	logic [N-1:0] out_xor;
	logic [N-1:0] out_corrLR;
	logic [N-1:0] out_corrLI;
	logic [N-1:0] out_corrLC;
	logic [N-1:0] zeros = {N{1'b0}};
	and_gate #(N) AG (A , B, out_and);
	or_gate  #(N) OG (A, B, out_or);
	xor_gate #(N) XG (A, B, out_xor);
	sheftRight #(N) RG (A, B, out_corrLR);
	shiftLeft #(N) IG (A, B, out_corrLI);
	rotator #(N) CG (A, out_corrLC);
	
	
	assign out = s[2] ? (s[1] ? (s[0] ? zeros : zeros) 
										: (s[0] ? out_corrLC : out_corrLI)) 
							 : (s[1] ? (s[0] ? out_corrLR : out_xor) 
										: (s[0] ? out_or : out_and));
	
endmodule 