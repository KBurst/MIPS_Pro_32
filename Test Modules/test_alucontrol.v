module test_alucontrol;

	// Inputs
	reg [5:0] instruction_function;
	reg [1:0] ALUOp;

	// Outputs
	wire [3:0] alu_control;

	// Instantiate the Unit Under Test (UUT)
	ALUControl_32 uut (
		.instruction_function(instruction_function), 
		.ALUOp(ALUOp), 
		.alu_control(alu_control)
	);

	initial begin
		// Initialize Inputs
		instruction_function = 0;
		ALUOp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule