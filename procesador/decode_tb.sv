`timescale 1ns/1ns

module decode_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk;
    reg rst;
    reg RegWriteW;
    reg [5:0] RDW; // Adjusted
    reg [31:0] InstrD;
    reg [31:0] PCD;
    reg [31:0] PCPlus4D;
    reg [31:0] ResultW;

    // Outputs
    wire RegWriteE;
    wire ALUSrcE;
    wire MemWriteE;
    wire ResultSrcE;
    wire BranchE;
	 wire vectorialE;
    wire [2:0] ALUControlE;
    wire [31:0] RD1_E;
    wire [31:0] RD2_E;
    wire [31:0] Imm_Ext_E;
    wire [5:0] RS1_E;
    wire [5:0] RS2_E;
    wire [5:0] RD_E;
    wire [31:0] PCE;
    wire [31:0] PCPlus4E;

    // Instantiate the DUT
    decode_cycle dut (
        .clk(clk), 
        .rst(rst), 
        .RegWriteW(RegWriteW),
        .RDW(RDW), 
        .InstrD(InstrD), 
        .PCD(PCD), 
        .PCPlus4D(PCPlus4D), 
        .ResultW(ResultW),
        .RegWriteE(RegWriteE), 
        .ALUSrcE(ALUSrcE), 
        .MemWriteE(MemWriteE), 
        .ResultSrcE(ResultSrcE),
        .BranchE(BranchE),
		  .vectorialE(vectorialE),
        .ALUControlE(ALUControlE), 
        .RD1_E(RD1_E), 
        .RD2_E(RD2_E), 
        .Imm_Ext_E(Imm_Ext_E), 
        .RD_E(RD_E), 
        .PCE(PCE), 
        .PCPlus4E(PCPlus4E),
        .RS1_E(RS1_E),
        .RS2_E(RS2_E)
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
        RegWriteW = 0;
        RDW = 6'b000000;
        InstrD = 32'b0;
        PCD = 32'b0;
        PCPlus4D = 32'b0;
        ResultW = 32'b0;

        #20; // Wait for 2 clock cycles

        // Release reset
        rst = 0;

        // Test case 1: PCSrcE = 0, PCTargetE = 32'h00001000
        #50; // Wait for 5 clock cycles
        RegWriteW = 1;
        RDW = 6'b000001;
        InstrD = 32'b00000011111001000001100010000011;
        PCD = 32'b00000011111001000001100010000011;
        PCPlus4D = 32'b00000011111001000000000001100000;
        ResultW = 32'h00000002;
		  
		  #50; // Wait for 5 clock cycles
		  RegWriteW = 0;
		  RDW = 6'b000001;
		  InstrD = 32'b00000011111001000000000001100000;
        PCD = 32'b00000011111001000000000001100000;
        PCPlus4D = 32'b00000011111001000000000001100000;
        ResultW = 32'h00000004;
		  

        #300; // Wait 
        $finish;
    end

endmodule