module ProcessorFinal_32(input clk);
	
	wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	wire [1:0] ALUOp;
	wire [5:0] opcode;
	
	Datapath_32 Datapath(.clk(clk), .RegDst(RegDst), .Jump(Jump), .Branch(Branch), .MemRead(MemRead), 
								.MemtoReg(MemtoReg), .MemWrite(MemWrite),.ALUSrc(ALUSrc), .RegWrite(RegWrite), 
								.ALUOp(ALUOp), .opcode(opcode));
								
	Control_32 Control(.instruction_special(opcode), .ALUOp(ALUOp),.RegDst(RegDst), 
							 .Jump(Jump), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), 
							 .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
							 
endmodule