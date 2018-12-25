module test_processor;

	// Inputs
	reg clk;
	// Outputs

	// Instantiate the Unit Under Test (UUT)
	ProcessorFinal_32 uut(.clk(clk));

	initial begin
		// Initialize Inputs
		clk <= 0;
		#320;
		$finish;
	end
	
	always begin
		#5 clk = ~clk;
	end
      
endmodule