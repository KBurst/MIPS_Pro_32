module Control_32(input [5:0] instruction_special, output reg [1:0] ALUOp,
						output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, 
						ALUSrc, RegWrite);
	always @ (*) begin
		case(instruction_special)
			6'b000000:
				begin
					/* R-Format Instructions */
					RegDst = 1;
					Jump = 0;
					ALUSrc = 0;
					MemtoReg = 0;
					RegWrite = 1;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;
					ALUOp = 2'b10;
				end
			6'b100011:
				begin
					/* Load Instructions */
					RegDst = 0;
					Jump = 0;
					ALUSrc = 1;
					MemtoReg = 1;
					RegWrite = 1;
					MemRead = 1;
					MemWrite = 0;
					Branch = 0;
					ALUOp = 2'b00;
				end
			6'b101011:
				begin
					/* Store Instructions */
					RegDst = 1'bx;
					Jump = 0;
					ALUSrc = 1;
					MemtoReg = 1'bx;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 1;
					Branch = 0;
					ALUOp = 2'b00;
				end
			6'b000100:
				begin
					/* Branch Instructions */
					RegDst = 1'bx;
					Jump = 0;
					ALUSrc = 0;
					MemtoReg = 1'bx;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 0;
					Branch = 1;
					ALUOp = 2'b01;
				end
			6'b000010:
				begin
					/* Jump Instructions*/
					RegDst = 1'b0;
					Jump = 1;
					ALUSrc = 0;
					MemtoReg = 1'b0;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;
					ALUOp = 2'b00;
				end
		endcase
	end
endmodule