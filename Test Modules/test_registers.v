module test_registers;

	// Inputs
	reg clk;
	reg RegWrite;
	reg [4:0] ReadReg1;
	reg [4:0] ReadReg2;
	reg [4:0] WriteReg;
	reg [31:0] WriteRegData;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;

	// Instantiate the Unit Under Test (UUT)
	Registers_32 uut (
		.clk(clk), 
		.RegWrite(RegWrite), 
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.WriteReg(WriteReg), 
		.WriteRegData(WriteRegData), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		RegWrite = 1;
		ReadReg1 = 7;
		ReadReg2 = 8;
		WriteReg = 3;
		WriteRegData = 10;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule