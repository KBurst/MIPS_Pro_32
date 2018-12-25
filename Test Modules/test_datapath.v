module test_datapath;

	// Inputs
	reg clk;
	reg RegDst;
	reg Jump;
	reg Branch;
	reg MemRead;
	reg MemtoReg;
	reg MemWrite;
	reg ALUSrc;
	reg RegWrite;
	reg [1:0] ALUOp;

	// Outputs
	wire [5:0] opcode;

	// Instantiate the Unit Under Test (UUT)
	Datapath_32 uut (
		.clk(clk), 
		.RegDst(RegDst), 
		.Jump(Jump), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.ALUOp(ALUOp), 
		.opcode(opcode)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		RegDst = 1;
		Jump = 0;
		Branch = 0;
		MemRead = 0;
		MemtoReg = 0;
		MemWrite = 0;
		ALUSrc = 0;
		RegWrite = 1;
		ALUOp = 2'b10;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule