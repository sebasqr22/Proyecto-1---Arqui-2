`timescale 1ns/1ns

module fetch_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk;
    reg rst;
    reg PCSrcE;
    reg [31:0] PCTargetE;

    // Outputs
    wire [31:0] InstrD;
    wire [31:0] PCD;
    wire [31:0] PCPlus4D;

    // Instantiate the DUT
    fetch_cycle dut (
        .clk(clk),
        .rst(rst),
        .PCSrcE(PCSrcE),
        .PCTargetE(PCTargetE),
        .InstrD(InstrD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D)
    );

    // Clock generation
    always begin
        #((CLK_PERIOD / 2));
        clk <= ~clk;
    end

    // Reset initialization
    initial begin
        clk = 0;
        rst = 1;
        PCSrcE = 1;
        PCTargetE = 32'h00000000;

        #20; // Wait for 2 clock cycles

        // Release reset
        rst = 0;

        // Test case 1: PCSrcE = 0, PCTargetE = 32'h00001000
        #50; // Wait for 5 clock cycles
        PCSrcE = 1;
        PCTargetE = 32'h00000001;
        

        #500; // Wait for 10 clock cycles and then stop simulation
        $finish;
    end

endmodule
