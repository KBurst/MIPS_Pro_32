module test_multiplier();

	reg clk, start;
	reg signed [32:0] a, b;

	wire signed [63:0] ab;
	wire busy;

	Multiplier_32 multiplier1(ab, busy, a, b, clk, start);

	initial begin
		clk = 0;
		$display("first example: a = 3 b = 17");
		a = 3; b = 17; start = 1; #50 start = 0;
		#320 $display("first example done");
		$display("second example: a = 7 b = 7");
		a = -7; b = -7; start = 1; #50 start = 0;
		#320 $display("second example done");
		
		$finish;
	end

	always #5 clk = !clk;

	always @(posedge clk) $strobe("ab: %d busy: %d at time=%t", ab, busy, $stime);

endmodule