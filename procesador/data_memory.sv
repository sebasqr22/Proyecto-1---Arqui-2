module data_memory(clk,rst,WE,WD,A,RD, address_b, clock_b, bitVGA);

    input clk,rst,WE,clock_b;
	 // A: addr
	 // WD: data a escribir
    input [31:0]A,WD,address_b;
	 // data leida
    output [31:0]RD;
	 output	[31:0]  bitVGA; // salida para VGA
	 
	 dmem data_mem(
						.address_a(A),
						.address_b(address_b),
						.clock_a(clk),
						.clock_b(clock_b),
						.data_a(WD),
						.data_b(),
						.wren_a(WE),
						.wren_b(1'b0),
						.q_a(RD),
						.q_b(bitVGA)
						);


endmodule