module DataMemory_32(input clk, input [31:0] address, input [31:0] WriteData, 
							input MemWrite, input MemRead, output [31:0] ReadData);
	reg [31:0] memory [31:0];
	integer f, i;
	wire [4:0] ram_addr = address[4:0];
	
	initial begin
		$readmemb("/home/ise/Processor_32/data_bin", memory);
		
		f = $fopen("/home/ise/Processor_32/output_bin");
		
		$fmonitor(f,
		"memory[0]  = %b\n", memory[0],
		"memory[1]  = %b\n", memory[1],
		"memory[2]  = %b\n", memory[2],
		"memory[3]  = %b\n", memory[3],
		"memory[4]  = %b\n", memory[4],
		"memory[5]  = %b\n", memory[5],
		"memory[6]  = %b\n", memory[6],
		"memory[7]  = %b\n", memory[7],
		"memory[8]  = %b\n", memory[8],
		"memory[9]  = %b\n", memory[9],
		"memory[10] = %b\n", memory[10],
		"memory[11] = %b\n", memory[11],
		"memory[12] = %b\n", memory[12],
		"memory[13] = %b\n", memory[13],
		"memory[14] = %b\n", memory[14],
		"memory[15] = %b\n", memory[15],
		"memory[16] = %b\n", memory[16],
		"memory[17] = %b\n", memory[17],
		"memory[18] = %b\n", memory[18],
		"memory[19] = %b\n", memory[19],
		"memory[20] = %b\n", memory[20],
		"memory[21] = %b\n", memory[21],
		"memory[22] = %b\n", memory[22],
		"memory[23] = %b\n", memory[23],
		"memory[24] = %b\n", memory[24],
		"memory[25] = %b\n", memory[25],
		"memory[26] = %b\n", memory[26],
		"memory[27] = %b\n", memory[27],
		"memory[28] = %b\n", memory[28],
		"memory[29] = %b\n", memory[29],
		"memory[30] = %b\n", memory[30],
		"memory[31] = %b\n", memory[31]);
		#320;
		$fclose(f);
	end
	
	always @ (posedge clk) begin
		if(MemWrite)
			memory[ram_addr] <= WriteData;
	end
	assign ReadData = (MemRead == 1) ? memory[ram_addr]: 32'b0;
endmodule