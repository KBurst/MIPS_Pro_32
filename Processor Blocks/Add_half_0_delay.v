module Add_half_0_delay(sum, c_out, a, b);
		output sum, c_out;
		input a, b;
 
		xor M1 (sum, a, b);  
		and M2 (c_out, a, b);
endmodule