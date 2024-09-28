module mux2to1_128(
	input [127:0] data0,
	input [127:0] data1,
   input sel,
   output [127:0] dataOut
);

	assign dataOut = sel ? data0 : data1;
	
endmodule