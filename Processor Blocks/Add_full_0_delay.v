module Add_full_0_delay(sum, c_out, a, b, c_in);
	output sum, c_out;
	input a, b, c_in;
	wire w_1;
	wire w_2; 
	wire w_3;  
	Add_half_0_delay M1 (w_1, w_2, a, b);
	Add_half_0_delay M2 (sum, w_3, w_1, c_in);
	or M3(c_out, w_2, w_3);
endmodule

