module registro #(parameter N = 4)
						(input logic clk,
						input logic [N-1:0]D,
						input logic reset,
						output logic [N-1:0]Q);
		
						
		always_ff @(posedge clk, posedge reset)//->logica basada en flipflops basada en flancos, logica combinacional always_com
		begin
		if (reset) 
			Q <= {N{1'b0}};
		
		else 
		
			 Q <= D;
		end

						
endmodule
