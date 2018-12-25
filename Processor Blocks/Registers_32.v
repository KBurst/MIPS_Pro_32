module Registers_32(input clk, input RegWrite, 
						  input [4:0] ReadReg1, ReadReg2, WriteReg,
						  input [31:0] WriteRegData,
						  output [31:0] ReadData1, ReadData2);
	
	reg [31:0] reg_array [31:0];
	integer i;
	
	initial begin
		for(i = 0; i < 32; i = i + 1)
			reg_array[i] <= 32'b0;
	end
	always @ (posedge clk) begin
		if(RegWrite) begin
			reg_array[WriteReg] <= WriteRegData;
		end
	end
	
	assign ReadData1 = reg_array[ReadReg1];
	assign ReadData2 = reg_array[ReadReg2];
	
endmodule