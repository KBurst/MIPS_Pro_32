module Add_rca_16_0_delay (sum, c_out, a, b, c_in);
	output[15:0] sum;
	output c_out;
	input[15:0] a, b;
	input c_in;
	wire c_in4, c_in8, c_in12, c_out;

	Add_rca_4 M1 (sum[3:0], c_in4, a[3:0], b[3:0], c_in);
	Add_rca_4 M2 (sum[7:4], c_in8, a[7:4], b[7:4], c_in4);
	Add_rca_4 M3 (sum[11:8], c_in12, a[11:8], b[11:8], c_in8);
	Add_rca_4 M4 (sum[15:12], c_out,	a[15:12], b[15:12], c_in12);
endmodule