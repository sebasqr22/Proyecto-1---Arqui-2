module PC_module(
	input clk, rst,
	input [31:0] PC_next,
	output reg [31:0] PC
);

	always @(posedge clk or posedge rst) 
	begin
		if (rst)
			PC<= {32{1'b0}};
		else
			PC <= PC_next;
	end
endmodule