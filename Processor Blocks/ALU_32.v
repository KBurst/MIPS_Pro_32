module ALU_32(input signed [31:0] a, input signed [31:0] b, input [3:0] alu_control, 
				  output [31:0] result, output [31:0] buffer, output zero);
				  
	reg signed [31:0] record, buff;
	
	wire signed [31:0] sum, difference, anded, ored, xored;
	wire signed [63:0] product, quotient;
	wire signed busy, carry;
	
	always @ (*) begin
		record = 32'b0;
		buff = 32'b0;
		case(alu_control)
			4'b0010:
				// Add
				record = sum;
			4'b0110:
				// Subtract
				record = difference;
			4'b0000:
				// And
				record = anded;
			4'b0001:
				// Or
				record = ored;
			4'b0011:
				// Xor
				record = xored;
			4'b0111:
				// Set less than
				record = {31'b0, difference[31]};
			4'b1000:
				// Multiply
				{buff, record} = a * b;
			4'b1001:
				// Divide
				record = a / b;
			default:
				record = a + b;
		endcase
	end
	
	Add_rca_32 add_ab(sum, carry, a, b, 1'b0);
	Sub_32 sub_ab(difference, carry, a, b, 1'b0);
	And_32 and_ab(a, b, anded);
	Or_32 or_ab(a, b, ored);
	Xor_32 xor_ab(a, b, xored);
	// Multiplier_32 mult_ab(product, busy, a, b, clock, start);

	assign result = record;
	assign buffer = buff;
	assign zero = (record == 32'b0) ? 1'b1 : 1'b0;
	
endmodule