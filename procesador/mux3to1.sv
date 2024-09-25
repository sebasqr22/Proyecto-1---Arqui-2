module mux3to1 (data0,data1,data2,sel,dataOut);
    input [31:0] data0,data1,data2;
    input [1:0] sel;
    output [31:0] dataOut;

    assign dataOut = (sel == 2'b00) ? data0 : (sel == 2'b01) ? data1 : (sel == 2'b10) ? data2 : 32'h00000000;
    
endmodule