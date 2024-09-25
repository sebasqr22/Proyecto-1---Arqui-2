`timescale 1ns/1ns

module execute_tb;

	// Parameters
	parameter CLK_PERIOD = 10; // Clock period in ns

	// Inputs
	reg clk, rst, RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE;
	reg [2:0] ALUControlE;
	reg [31:0] RD1_E, RD2_E, Imm_Ext_E;
	reg [5:0] RD_E;
	reg [31:0] PCE, PCPlus4E;
	reg [31:0] ResultW;
	reg [1:0] ForwardA_E, ForwardB_E;

	//Outputs
	reg PCSrcE, RegWriteM, MemWriteM, ResultSrcM;
	reg [5:0] RD_M; 
	reg [31:0] PCPlus4M, WriteDataM, ALU_ResultM;
	reg [31:0] PCTargetE;



	// Instantiate the DUT
	execute_cycle dut (
		.clk(clk), 
		.rst(rst), 
		.RegWriteE(RegWriteE),
		.ALUSrcE(ALUSrcE),
		.MemWriteE(MemWriteE),
		.ResultSrcE(ResultSrcE),
		.BranchE(BranchE),
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
		.ForwardA_E(ForwardA_E), 
		.ForwardB_E(ForwardB_E)
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
		RegWriteE = 0;
		ALUSrcE = 0;
		MemWriteE = 0;
		ResultSrcE = 0;
		BranchE = 0;
		ALUControlE = 0;
		RD1_E = 0;
		RD2_E = 0;
		Imm_Ext_E = 0;

		#20; // Wait for 2 clock cycles

		// Release reset
		rst = 0;

		// Test case 1: Suma con inmediato (SMI)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 1;
		ALUControlE = 3'b111;
		RD1_E = 32'h0003;
		RD2_E = 32'h0002;
		Imm_Ext_E = 32'h0007;

		// Test case 2: Suma con registros (SM)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 0; 
		ALUControlE = 3'b111;
		RD1_E = 32'h0003;
		RD2_E = 32'h0002;
		Imm_Ext_E = 32'h0007;
		
		// Test case 3: Resta con registros (RS)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 0; 
		ALUControlE = 3'b000;
		RD1_E = 32'h0003;
		RD2_E = 32'h0002;
		Imm_Ext_E = 32'h0007;
		
		// Test case 4: Resta de resultado negativo con registros (RS)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 0; 
		ALUControlE = 3'b000;
		RD1_E = 32'h0000;
		RD2_E = 32'h0005;
		Imm_Ext_E = 32'h0007;
		
		// Test case 5: Multiplicacion con registros (ML)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 0; 
		ALUControlE = 3'b001;
		RD1_E = 32'h0003;
		RD2_E = 32'h0005;
		Imm_Ext_E = 32'h0007;
		
		// Test case 6: Multiplicacion de resultado negativo con registros (ML)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 0; 
		ALUControlE = 3'b001;
		RD1_E = 32'h0003;
		RD2_E = 32'hFFFB; // 3 * -5
		Imm_Ext_E = 32'h0007;
		
		// Test case 7: Operacion OR con registros (ORR)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 0; 
		ALUControlE = 3'b010;
		RD1_E = 32'h0009; //1001
		RD2_E = 32'h0005; //0101
		Imm_Ext_E = 32'h0007;
		
		// Test case 8: Corrimiento derecho con inmediato (ORR)
		#50; // Wait for 5 clock cycles
		RegWriteE = 1;
		ALUSrcE = 0; 
		ALUControlE = 3'b011;
		RD1_E = 32'h0009;
		RD2_E = 32'h0005;
		Imm_Ext_E = 32'h0002;
		
		#500; // Wait for 10 clock cycles and then stop simulation
		$finish;
	end
endmodule
