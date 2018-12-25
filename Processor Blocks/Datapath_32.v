module Datapath_32(input clk, input RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite,
						 ALUSrc, RegWrite, input [1:0] ALUOp, output [5:0] opcode);
	
	reg [31:0] pc_current;
	wire [31:0] pc_next, pc2;
	wire [31:0] instruction;
	wire [4:0] rs_addr, rt_addr, rd_addr;
	wire signed [31:0] rs, rt, rd;
	wire [31:0] ins_extend, read_data2;
	wire [3:0] ALU_control;
	wire [31:0] ALU_out;
	wire zero_flag;
	wire [31:0] pc_beq;
	wire beq_control;
	wire [27:0] jump_shift;
	wire [31:0] PCALU_result;
	wire [31:0] mem_read_data;
	
	initial begin
		pc_current <= 32'd0;
	end
	always @ (posedge clk) begin
		pc_current <= pc_next;
	end
	
	// Adds 4 to current program counter.
	assign pc2 = pc_current + 16'd4;
	
	/* Instruction Memory */
	InstructionMemory_32 im(.pc(pc_current), .instruction(instruction));
	
	// Jump shift left 2
	assign jump_shift = {instruction[25:0], 2'b00};
	
	// Multiplexer RegDest
	assign rd_addr = (RegDst == 1'b1) ? instruction [20:16] : instruction [15:11];
	
	// Register File
	assign rs_addr = instruction[25:21];
	assign rt_addr = instruction[20:16];
	
	/* General Purpose Block */
	Registers_32 Registers(.clk(clk), .RegWrite(RegWrite), .ReadReg1(rs_addr), 
								  .ReadReg2(rt_addr), .WriteReg(rd_addr), .WriteRegData(rd), 
								  .ReadData1(rs), .ReadData2(rt));
	
	// Immediate Extend
	assign ins_extend = {{16{instruction[15]}}, instruction[15:0]};
	
	/* ALU Control Unit */
	ALUControl_32 ALUControl(.instruction_function(instruction[5:0]), 
									 .ALUOp(ALUOp), .alu_control(ALU_control));
									 
	// Mux ALUSrc
	assign read_data2 = (ALUSrc == 1) ? ins_extend : rt;
	
	/* ALU */
	ALU_32 ALU(.a(rs), .b(read_data2), .alu_control(ALU_control), 
				  .result(ALU_out), .buffer(), .zero(zero_flag));
	
	assign PCALU_result = {ins_extend[29:0], 2'b00} + pc2;
	
	// Branch Control
	assign beq_control = Branch & zero_flag;
	
	// PC Branch
	assign pc_beq = (beq_control == 1'b1) ? PCALU_result : pc2;
	assign pc_next = (Jump == 1'b1) ? {pc2[31:28], jump_shift} : pc_beq;
	
	DataMemory_32 DataMemory(.clk(clk), .address(ALU_out), .WriteData(rt), 
									 .MemWrite(MemWrite), .MemRead(MemRead), 
									 .ReadData(mem_read_data));
	assign rd = (MemtoReg == 1'b1) ? mem_read_data : ALU_out;
	
	assign opcode = instruction[31:26];
	
endmodule