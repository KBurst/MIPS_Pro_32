module alu(out, a, b, cin);
	parameter IN_LENGTH = 32;
	
	output [IN_LENGTH - 1:0] out;
	input [IN_LENGTH - 1:0] a;
	input [IN_LENGTH - 1:0] b;
	input cin;

	assign out = a + b + cin;

endmodule