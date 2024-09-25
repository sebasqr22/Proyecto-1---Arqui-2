`timescale 1ns/1ns

module execute_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk;
    reg rst;
    reg RegWriteE;
    reg ALUSrcE;
    reg MemWriteE;
    reg ResultSrcE;
    reg BranchE;
    reg is_vectorial;
    reg [2:0] ALUControlE;
    reg [128:0] RD1_E;
    reg [128:0] RD2_E;
    reg [31:0] Imm_Ext_E;
    reg [5:0] RD_E;
    reg [31:0] PCE;
    reg [31:0] PCPlus4E;
    reg [31:0] ResultW;
    reg [1:0] ForwardA_E;
    reg [1:0] ForwardB_E;

    // Outputs
    wire PCSrcE;
    wire RegWriteM;
    wire MemWriteM;
    wire ResultSrcM;
    wire [5:0] RD_M;
    wire [31:0] PCPlus4M;
    wire [31:0] WriteDataM;
    logic [31:0] ALU_ResultM;
    wire [31:0] PCTargetE;

    // Instantiate the DUT (Device Under Test)
    execute_cycle dut (
        .clk(clk),
        .rst(rst),
        .RegWriteE(RegWriteE),
        .ALUSrcE(ALUSrcE),
        .MemWriteE(MemWriteE),
        .ResultSrcE(ResultSrcE),
        .BranchE(BranchE),
        .is_vectorial(is_vectorial),
        .ALUControlE(ALUControlE),
        .RD1_E(RD1_E),
        .RD2_E(RD2_E),
        .Imm_Ext_E(Imm_Ext_E),
        .RD_E(RD_E),
        .PCE(PCE),
        .PCPlus4E(PCPlus4E),
        .ResultW(ResultW),
        .ForwardA_E(ForwardA_E),
        .ForwardB_E(ForwardB_E),
        .PCSrcE(PCSrcE),
        .RegWriteM(RegWriteM),
        .MemWriteM(MemWriteM),
        .ResultSrcM(ResultSrcM),
        .RD_M(RD_M),
        .PCPlus4M(PCPlus4M),
        .WriteDataM(WriteDataM),
        .ALU_ResultM(ALU_ResultM),
        .PCTargetE(PCTargetE)
    );

    // Clock generation
    always begin
        #((CLK_PERIOD / 2));
        clk = ~clk;
    end

    // Reset and stimulus initialization
    initial begin
        // Initial conditions
        clk = 0;
        rst = 1;
        RegWriteE = 0;
        ALUSrcE = 0;
        MemWriteE = 0;
        ResultSrcE = 0;
        BranchE = 0;
        is_vectorial = 0;
        ALUControlE = 3'b000;
        RD1_E = 32'b0;
        RD2_E = 32'b0;
        Imm_Ext_E = 32'b0;
        RD_E = 6'b0;
        PCE = 32'b0;
        PCPlus4E = 32'b0;
        ResultW = 32'b0;
        ForwardA_E = 2'b00;
        ForwardB_E = 2'b00;

        // Wait for some time before releasing reset
        #20;
        rst = 0;

        // Test Case 1: Scalar addition with no forwarding
        #10;
        RegWriteE = 1;
        ALUSrcE = 1;
        MemWriteE = 0;
        ResultSrcE = 0;
        BranchE = 0;
        is_vectorial = 0;  // Scalar operation
        ALUControlE = 3'b000;  // Addition
        RD1_E = 128'd10;  // First operand
        RD2_E = 128'd20;  // Second operand
        Imm_Ext_E = 32'd0;
        RD_E = 6'b000000;  // Destination register
        PCE = 32'd100;
        PCPlus4E = 32'd0;
        ForwardA_E = 2'b00;  // No forwarding
        ForwardB_E = 2'b00;  // No forwarding

        #20;
        $display("Test 1 (Scalar Add): ALU_ResultM = %d", ALU_ResultM);
        
        // Test Case 2: Vector addition
        #10;
        is_vectorial = 1;  // Vector operation
        RD1_E = 128'h00000000_00000000_00000000_00000008;  // Vector operand A
        RD2_E = 128'h00000000_00000000_00000000_00000004;  // Vector operand B
        ALUControlE = 3'b000;  // Addition for vector

        #20;
        $display("Test 2 (Vector Add): ALU_ResultM = %h", ALU_ResultM);

        

        #100;
        $finish;
    end

endmodule
