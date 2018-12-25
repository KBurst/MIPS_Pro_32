module Divider_32(quotient, dividend, divisor, clock, start);
	
	/*
		dvdnd_piece = dividend[32];
		dvsr_piece = divisor;
		quotient;
		counter = 0;
		isNegative;
		
		if(dividend < 0 && divisor < 0)
			isNegative = false;
			dividend = -dividend;
			divisor = -divisor;
			
		if(dividend < 0)
			isNegative = true;
			dividend = -dividend;
		if(divisor < 0)
			isNegative = true;
			divisor = -divisor;
		
		
		for(int i = 1; i < 32; i++)
			if(dvsr_piece > dvdnd_piece)
				quotient = {quotient, 0}
				dvdnd_piece = {dvdnd_piece, dividend[32 - i]}
			else
				quotient = {quotient, 1}
				dvdnd_piece = dvdnd_piece - dvsr_piece;
		if(isNegative == true)
			quotient = -quotient;
	*/
	parameter BITS = 32;
	parameter INPUT_LENGTH = BITS - 1;
	parameter COUNT_LENGTH = $clog2(BITS);
	
	input clock, start;
	input signed [INPUT_LENGTH:0] dividend, divisor;
	output signed [INPUT_LENGTH:0] quotient;
	
	reg signed [INPUT_LENGTH:0] dividend_piece, divisor_piece, dividend_hold, quotient_piece;
	
	reg signed [INPUT_LENGTH - 1:0] zeroes;
	
	reg isNegative;
	// reg [COUNT_LENGTH - 1:0] count;
	integer count;
	
	always @ (posedge clock) begin
		if(start) begin
			count <= 1;
			zeroes <= 31'b0;
			quotient_piece <= 32'b0;
			if(dividend < 0 && divisor < 0) begin
				isNegative <= 0;
				divisor_piece <= -divisor;
				dividend_piece <= -dividend;
			end else if(dividend < 0 && divisor > 0) begin
				isNegative <= 1;
				dividend_piece <= -dividend;
				divisor_piece <= divisor;
			end else if(dividend > 0 && divisor < 0) begin
				isNegative <= 1;
				divisor_piece <= -divisor;
				dividend_piece <= dividend;
			end else begin
				isNegative <= 0;
				dividend_piece <= dividend;
				divisor_piece <= divisor;
			end
			dividend_hold <= {zeroes, dividend_piece[INPUT_LENGTH]};
		end
		else begin
			count <= count + 1;
			if(divisor_piece > dividend_hold) begin
				quotient_piece <= quotient_piece * 2;
				dividend_hold <= {dividend_hold, dividend_piece[INPUT_LENGTH - count]};
			end
			if(divisor_piece <= dividend_hold) begin
				quotient_piece <= quotient_piece * 2 + 1;
				dividend_hold <= (dividend_hold - divisor_piece) * 2 + dividend_piece[INPUT_LENGTH - count];
			end
			if(count > 32) begin
				if(isNegative) begin
					quotient_piece = -quotient_piece;
				end
				else begin
					quotient_piece = quotient_piece;
				end
			end
		end
	end
	
	assign quotient = quotient_piece;
	
endmodule