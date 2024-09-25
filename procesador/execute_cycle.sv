module execute_cycle(clk, rst, RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE,is_vectorial, ALUControlE, 
							RD1_E, RD2_E, Imm_Ext_E, RD_E, PCE, PCPlus4E, PCSrcE, PCTargetE, RegWriteM, MemWriteM, 
							ResultSrcM, RD_M, PCPlus4M, WriteDataM, ALU_ResultM, ResultW, ForwardA_E, ForwardB_E);

		
    input clk, rst, RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE,is_vectorial;
    input [2:0] ALUControlE;
	 // adaptar RD1 no esta conectado porque se elimino hazard unit
    input [31:0] Imm_Ext_E;
	 input [127:0] RD1_E, RD2_E; 
    input [5:0] RD_E;
    input [31:0] PCE, PCPlus4E;
    input [31:0] ResultW;
    input [1:0] ForwardA_E, ForwardB_E;

    output PCSrcE, RegWriteM, MemWriteM, ResultSrcM;
    output [5:0] RD_M; 
    output [31:0] PCPlus4M;
	 output [127:0] WriteDataM;
    output [127:0] ALU_ResultM;
    output [31:0] PCTargetE;

    wire [127:0] Src_A, Src_B_interim, Src_B;
	
    wire [127:0] ResultE;
    wire ZeroE;

    reg RegWriteE_r, MemWriteE_r, ResultSrcE_r;
    reg [5:0] RD_E_r;
    reg [31:0] PCPlus4E_r;
	reg [127:0] RD2_E_r, ResultE_r;


    // Forwarding Mux for Source A
    mux3to1 srca_mux (
        .data0(RD1_E),       // Original value
        .data1(ResultW),      // Forwarding from WB stage
        .data2(ALU_ResultM),  // Forwarding from MEM stage
        .sel(ForwardA_E),     // Forwarding control
        .dataOut(Src_A)
    );

    // Forwarding Mux for Source B
    mux3to1 srcb_mux (
        .data0(RD2_E),       // Original value
        .data1(ResultW),      // Forwarding from WB stage
        .data2(ALU_ResultM),  // Forwarding from MEM stage
        .sel(ForwardB_E),     // Forwarding control
        .dataOut(Src_B_interim)
    );

    // ALU Src Mux (choose between forwarded RD2_E or Immediate)
    mux2to1_128 alu_src_mux (
        .data0(Src_B_interim), 
        .data1({96'h0, Imm_Ext_E}), 
        .sel(ALUSrcE), 
        .dataOut(Src_B)
    );

    // ALU Unit
    /*alu alu (
        .A(Src_A[31:0]),
        .B(Src_B[31:0]),
        .Result(ResultE),
        .ALUControl(ALUControlE),
        .OverFlow(),
        .Carry(),
        .Zero(ZeroE),
        .Negative()
    );*/

     vectorial_alu vect_alu (
        .A(Src_A),
        .B(Src_B),
        .ALUControl(ALUControlE),
        .vectorial(is_vectorial),
        .Result(ResultE),
        .Zero(ZeroE)
    );




    // Branch Adder
    PC_adder branch_adder (
        .a(PCE),
        .b(Imm_Ext_E),
        .c(PCTargetE)
    );

    // Register Logic (Storing pipeline values)
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            RegWriteE_r <= 1'b0; 
            MemWriteE_r <= 1'b0; 
            ResultSrcE_r <= 1'b0;
            RD_E_r <= 5'h00;
            PCPlus4E_r <= 32'h00000000; 
            RD2_E_r <= 128'h00000000; 
            ResultE_r <= 128'h00000000;
        end else begin
            RegWriteE_r <= RegWriteE; 
            MemWriteE_r <= MemWriteE; 
            ResultSrcE_r <= ResultSrcE;
            RD_E_r <= RD_E;
            PCPlus4E_r <= PCPlus4E; 
            RD2_E_r <= Src_B_interim; 
            ResultE_r <= ResultE;
        end
    end

    // Output Assignments
    assign PCSrcE = ZeroE & BranchE;
    assign RegWriteM = RegWriteE_r;
    assign MemWriteM = MemWriteE_r;
    assign ResultSrcM = ResultSrcE_r;
    assign RD_M = RD_E_r;
    assign PCPlus4M = PCPlus4E_r;
    assign WriteDataM = RD2_E_r;
    assign ALU_ResultM = ResultE_r;
	 
endmodule 