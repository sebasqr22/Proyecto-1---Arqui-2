module writeback_cycle(clk, rst, ResultSrcW, PCPlus4W, ALU_ResultW, ReadDataW, ResultW);

	
	input clk, rst, ResultSrcW;
	input [31:0] PCPlus4W, ALU_ResultW, ReadDataW;

	output [31:0] ResultW;

	
	
	mux2to1 result_mux (    
						 .data0(ReadDataW),
						 .data1(ALU_ResultW),
						 .sel(ResultSrcW),
						 .dataOut(ResultW)
						 );
endmodule