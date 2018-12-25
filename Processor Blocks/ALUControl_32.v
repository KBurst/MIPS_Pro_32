module ALUControl_32(input [5:0] instruction_function, input [1:0] ALUOp, 
							output reg [3:0] alu_control);
	wire [7:0] ALU_Cinput;
	
	assign ALU_Cinput = {ALUOp, instruction_function};
	
	always @ (ALU_Cinput) begin
		casex (ALU_Cinput)
			8'b00xxxxxx:
				/* Addition */
				alu_control = 4'b0010;
			8'b01xxxxxx:
				/* Subtraction */
				alu_control = 4'b0110;
			8'b10100000:
				/* Addition */
				alu_control = 4'b0010;
			8'b10100010:
				/* Subtraction */
				alu_control = 4'b0110;
			8'b10100100:
				/* And */
				alu_control = 4'b0000;
			8'b10100101:
				/* Or */
				alu_control = 4'b0001;
			8'b10101010:
				/* Set Less Than*/
				alu_control = 4'b0111;
			8'b10100001:
				/* Multiplication */
				alu_control = 4'b1000;
			8'b10100011:
				/* Division */
				alu_control = 4'b1001;
			default:
				alu_control = 4'b0010;
		endcase
	end
endmodule
