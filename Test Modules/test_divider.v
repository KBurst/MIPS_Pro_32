module test_divider;
	
	/* Parameters */
	parameter BITS = 32;
	parameter INPUT_LENGTH = BITS - 1;
	
	// Inputs
	reg signed [INPUT_LENGTH:0] dividend;
	reg signed [INPUT_LENGTH:0] divisor;
	reg clock;
	reg start;
	
	/* Outputs */
	wire signed [INPUT_LENGTH:0] quotient;

	// Instantiate the Unit Under Test (UUT)
	Divider_32 uut (
		.quotient(quotient), 
		.dividend(dividend), 
		.divisor(divisor), 
		.clock(clock), 
		.start(start)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		$display("first example: a = 20 b = 5");
		dividend = -440; 
		divisor = -5; 
		start = 1; 
		#40 start = 0;
		#330 $display("Result: %d", quotient);
		
		$finish;
	end
	
	always #5 clock = !clock;
      
endmodule