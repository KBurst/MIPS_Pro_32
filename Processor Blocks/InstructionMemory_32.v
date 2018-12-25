module InstructionMemory_32(input [31:0] pc, output [31:0] instruction);
	reg [31:0] memory [31:0];
	wire [4:0] rom_addr = pc[5:1];
	
	initial begin
		$readmemb("/home/ise/Processor_32/expression_bin", memory, 0, 31);
	end
	
	assign instruction = memory[rom_addr];
	
endmodule