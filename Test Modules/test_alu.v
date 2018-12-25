module test_alu;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] alu_control;
	reg clock;
	reg start;

	// Outputs
	wire [31:0] result;
	wire [31:0] buffer;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU_32 uut (
		.a(a), 
		.b(b), 
		.alu_control(alu_control), 
		.start(start), 
		.result(result), 
		.buffer(buffer), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		a = 100000000;
		b = 2000;
		alu_control = 4'b0001;
		start = 1;
		#50 start = 0;
		#320;

		// Wait 100 ns for global reset to finish
		// #100;
        
		// Add stimulus here

	end
      
endmodule