module test_adder;

	// Inputs
	reg signed [31:0] a;
	reg signed [31:0] b;
	reg signed c_in;

	// Outputs
	wire [31:0] sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	Add_rca_32 uut (
		.sum(sum), 
		.c_out(c_out), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);

	/* a + b */
	initial begin
		// Initialize Inputs
		a = 2;
		b = 8;
		c_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule