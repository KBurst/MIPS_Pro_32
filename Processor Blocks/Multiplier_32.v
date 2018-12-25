module Multiplier_32(prod, busy, mc, mp, clk, start);
	/* Parameters */
	parameter RESULT_LENGTH = 64;
	parameter IN_LENGTH = RESULT_LENGTH / 2;
	parameter CNT_LENGTH = $clog2(RESULT_LENGTH);

	/* Module Outputs */
	output signed [RESULT_LENGTH - 1:0] prod;	// Product
	output busy;								// Busy Register

	/* Module Inputs */
	input signed [IN_LENGTH - 1:0] mc, mp;		// Multiplicand and Multiplier
	input clk, start;							// Clock and start

	/* Registers/Wires */
	reg signed [IN_LENGTH - 1:0] A, Q, M;
	reg Q_1;
	reg [CNT_LENGTH:0] count;
	wire signed [IN_LENGTH - 1:0] sum, difference;

	/* Loop with rising edge */
	always @(posedge clk) begin
		if(start) begin
			A <= 32'b0;		// Loads IN_LENGTH bits of Zeros into A
			M <= mc;		  	// Loads Multiplicand to M
			Q <= mp;			// Loads Multiplier to Q
			Q_1 <= 1'b0;	// Loads a zero bit into Q_1
			count <= 6'b0;	// Loads zero of COUNT_LENGTH
		end
		else begin
			case({Q[0], Q_1})
				2'b0_1: 
				{A, Q, Q_1} <= {sum[IN_LENGTH - 1], sum, Q};
				2'b1_0: 
				{A, Q, Q_1} <= {difference[IN_LENGTH -1], difference, Q};
				default: 
				{A, Q, Q_1} <= {A[7], A, Q};
			endcase
			count <= count + 1'b1;	// add one to count
		end
	end

	alu adder(sum, A, M, 1'b0);
	alu subtracter(difference, A, ~M, 1'b1);

	assign prod = {A, Q};
	assign busy = (count < CNT_LENGTH);
endmodule