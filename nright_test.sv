module nright_test ();

logic [3:0] A, B, C;

N_right_arit #(4) Corr(A,B,C);

initial begin

	A = 4'sb1001; B = 4'b0010; #10;
	A = 4'sb0001; B = 4'b0010; #10;
	A = 4'sb0100; B = 4'b0010; #10;

end

endmodule
