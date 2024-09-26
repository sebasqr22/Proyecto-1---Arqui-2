module writeback_cycle(clk, rst, ResultSrcW, PCPlus4W, ALU_ResultW, ReadDataW, ResultW);

	
	input clk, rst;
	input [1:0]ResultSrcW;
	input [31:0] PCPlus4W,
	input [127:0]ALU_ResultW, ReadDataW;

	output [127:0] ResultW;

	
	
	mux3to1 result_mux (    
						 .data0(ALU_ResultW),
						 .data1(ReadDataW),
						 .data2({96'h0 ,PCPlus4W}),
						 .sel(ResultSrcW),
						 .dataOut(ResultW)
						 );
endmodule