module pipeline_top(	
    input clk, 
    input rst,
	 input step_button, 
    input step_enable,
	 output  [6:0] disp1,
	 output  [6:0] disp2,
	 output  [6:0] disp3,
	 output  [6:0] disp4
);

    // Declaration of Interim Wires
    wire PCSrcE, RegWriteW, RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE, vectorialE, RegWriteM, MemWriteM, ResultSrcM, ResultSrcW, user_data_EN;
    wire [2:0] ALUControlE;
    wire [5:0] RD_E, RD_M, RDW, RS1_E, RS2_E;
    wire [31:0] PCTargetE, InstrD, PCD, PCPlus4D, Imm_Ext_E, PCE, PCPlus4E, PCPlus4M;
    wire [127:0] RD1_E, RD2_E, WriteDataM, ALU_ResultM, ResultW, ALU_ResultW, ReadDataW, ReadDataUserW, user_data_in;
    wire [31:0] PCPlus4W;
	 wire [1:0] ForwardBE, ForwardAE;
    wire [15:0] address_b;
	 wire [6:0] count_out;
	wire clk_stepping;
	wire clk_pipe;
	






	reg step_button_reg, step_button_last;
	reg stepping_state;


    
    step_control stepper (
        .clk(clk), 
        .rst(rst), 
        .step_button(step_button),  
        .clk_stepping(clk_stepping)
    );
	 
	 assign clk_pipe= (step_enable==1'b1) ? clk_stepping : clk;

    // Modulos
    // Fetch cycle - conexiones revisadas
    fetch_cycle Fetch (
        .clk(clk_pipe), 
        .rst(rst), 
        .PCSrcE(PCSrcE), 
        .PCTargetE(PCTargetE), 
        .InstrD(InstrD), 
        .PCD(PCD), 
        .PCPlus4D(PCPlus4D)
    );

    // Decode cycle - conexiones revisadas
    decode_cycle Decode (
        .clk(clk_pipe), 
        .rst(rst), 
        .InstrD(InstrD), 
        .PCD(PCD), 
        .PCPlus4D(PCPlus4D), 
        .RegWriteW(RegWriteW), 
        .RDW(RDW), 
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
						  
    // Execute cycle - conexiones revisadas
    execute_cycle Execute (
        .clk(clk_pipe), 
        .rst(rst), 
        .RegWriteE(RegWriteE), 
        .ALUSrcE(ALUSrcE), 
        .MemWriteE(MemWriteE), 
        .ResultSrcE(ResultSrcE), 
        .BranchE(BranchE), 
        .is_vectorial(vectorialE),
        .ALUControlE(ALUControlE), 
        .RD1_E(RD1_E), 
        .RD2_E(RD2_E), 
        .Imm_Ext_E(Imm_Ext_E), 
        .RD_E(RD_E), 
        .PCE(PCE), 
        .PCPlus4E(PCPlus4E), 
        .PCSrcE(PCSrcE), 
        .PCTargetE(PCTargetE), 
        .RegWriteM(RegWriteM), 
        .MemWriteM(MemWriteM), 
        .ResultSrcM(ResultSrcM), 
        .RD_M(RD_M), 
        .PCPlus4M(PCPlus4M), 
        .WriteDataM(WriteDataM), 
        .ALU_ResultM(ALU_ResultM),
        .ResultW(ResultW),
		.ForwardA_E(ForwardAE),
        .ForwardB_E(ForwardBE)
    );
						  
    // Memory cycle - conexiones revisadas
    memory_cycle Memory (
        .clk(clk_pipe), 
        .rst(rst), 
        .RegWriteM(RegWriteM), 
        .MemWriteM(MemWriteM), 
        .ResultSrcM(ResultSrcM), 
        .RD_M(RD_M), 
        .PCPlus4M(PCPlus4M), 
        .WriteDataM(WriteDataM), 
        .ALU_ResultM(ALU_ResultM), 
        .RegWriteW(RegWriteW), 
        .ResultSrcW(ResultSrcW), 
        .RD_W(RDW), 
        .PCPlus4W(PCPlus4W), 
        .ALU_ResultW(ALU_ResultW), 
        .ReadDataW(ReadDataW),
        .uart_en(user_data_EN),
        .uart_Value_in(user_data_in),
        .readAddressUser(address_b),
        .uart_Value_W(ReadDataUserW)
    );	
						  
    // Writeback cycle
    writeback_cycle WriteBack (
        .clk(clk_pipe), 
        .rst(rst), 
        .ResultSrcW(ResultSrcW),
        .ALU_ResultW(ALU_ResultW), 
        .ReadDataW(ReadDataW), 
        .ResultW(ResultW),
		  .count_out(count_out)
    );
	 // Hazard Unit
    hazard_unit Forwarding_block (
		.rst(rst), 
        .RegWriteM(RegWriteM), 
        .RegWriteW(RegWriteW), 
        .RD_M(RD_M), 
        .RD_W(RDW), 
        .Rs1_E(RS1_E), 
        .Rs2_E(RS2_E), 
        .ForwardAE(ForwardAE), 
        .ForwardBE(ForwardBE)
     );
	  
	  
	 segment_driver sd1(
		.data_in(count_out),
		.data_out1(disp1),
		.data_out2(disp2),
		.data_out3(disp3),
		.data_out4(disp4),
	);
	  
	  

     // Add UART module
						  
endmodule