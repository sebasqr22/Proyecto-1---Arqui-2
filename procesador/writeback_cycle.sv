module writeback_cycle(clk, rst, ResultSrcW, ALU_ResultW, ReadDataW, ResultW,count_out);

	
	input clk, rst;
	input [1:0]ResultSrcW;
	input [127:0] ALU_ResultW, ReadDataW;
	output reg [6:0] count_out;
	output [127:0] ResultW;

	
	
	mux2to1 result_mux (    
						 .data0(ReadDataW),
						 .data1(ALU_ResultW),
						 .sel(ResultSrcW),
						 .dataOut(ResultW)
						 );
						 
	
						 
	always@(posedge clk or posedge rst)begin
		if (rst) begin
            count_out <= 6'b00000; // Reset del contador a 0
        end else begin
                count_out <= count_out + 1; // Incrementa el contador
            end
        end
	
						 
endmodule