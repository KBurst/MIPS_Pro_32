module Sub_32(sum, c_out, a, b, c_in);
	output signed [31:0] sum;
	output c_out;
	input signed [31:0] a, b;
	input c_in;
	wire c_in_0_15, c_out;
	
	Add_rca_16_0_delay M1(sum[15:0], c_in_0_15, a[15:0], -b[15:0], c_in);
	Add_rca_16_0_delay M2(sum[31:16], c_out, a[31:16], -b[31:16], ~c_in_0_15);
endmodule