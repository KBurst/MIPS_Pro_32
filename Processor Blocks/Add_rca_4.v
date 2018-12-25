module Add_rca_4 (sum, c_out, a, b, c_in);
	output[3:0] sum;
	output c_out;
	input[3:0] a, b;
	input c_in;
	wire c_in2; 
	wire c_in3;
	wire c_in4;
	Add_full_0_delay M1(sum[0], c_in2, a[0], b[0], c_in);
	Add_full_0_delay M2(sum[1], c_in3, a[1], b[1], c_in2);
	Add_full_0_delay M3(sum[2], c_in4, a[2], b[2], c_in3);
	Add_full_0_delay M4(sum[3], c_out, a[3], b[3], c_in4);
endmodule