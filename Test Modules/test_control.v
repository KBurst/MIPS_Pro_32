module test_control;

	// Inputs
	reg [5:0] instruction_special;

	// Outputs
	wire [1:0] ALUOp;
	wire RegDst;
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;

	// Instantiate the Unit Under Test (UUT)
	Control_32 uut (
		.instruction_special(instruction_special), 
		.ALUOp(ALUOp), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch)
	);

	initial begin
		// Initialize Inputs
		instruction_special = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule