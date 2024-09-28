module mux2to1(
	input [31:0] data0,
	input [31:0] data1,
   input sel,
   output [31:0] dataOut
);

	assign dataOut = sel ? data0 : data1;
	
endmodule
