module data_memory(clk,WE,uart_en,WD,address_a, address_b,RD,uart_Value_in,uart_Value_out);

    input clk,WE,uart_en;
	 // A: addr
	 // WD: data a escribir
    input [15:0]address_a,address_b;
	 input [127:0] WD,uart_Value_in;
	 
	 // data leida
    output [127:0]RD,uart_Value_out;
	 
	 memoria data_mem(
						.address_a(address_a),
						.address_b(address_b),
						.clock(clk),
						.data_a(WD),
						.data_b(uart_Value_in),
						.wren_a(WE),
						.wren_b(uart_en),
						.q_a(RD),
						.q_b(uart_Value_out)
						);


endmodule