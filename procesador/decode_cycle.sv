module decode_cycle( clk,rst,InstrD, PCD, PCPlus4D, RegWriteW ,RDW, ResultW, RegWriteE,ALUSrcE, 
							MemWriteE, ResultSrcE, BranchE, vectorialE, ALUControlE, RD1_E, RD2_E, Imm_Ext_E, RD_E, PCE, 
							PCPlus4E, RS1_E, RS2_E);
	input clk,rst,RegWriteW;
	input [5:0]RDW; // Revisar
	input [31:0] InstrD, PCD, PCPlus4D;

   input [127:0] ResultW; //Input del wb
	
	
	output RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,BranchE, vectorialE;
   output [2:0] ALUControlE;
   output [31:0] Imm_Ext_E;
   output [127:0] RD1_E, RD2_E;
   output [5:0] RS1_E, RS2_E, RD_E;
   output [31:0] PCE, PCPlus4E;
	
	
	
	wire RegWriteD,ALUSrcD,MemWriteD,ResultSrcD,BranchD, vectorialD;
	wire[1:0] ImmSrcD;
	wire [2:0] ALUControlD;
	wire[31:0] Imm_Ext_D;
   wire [127:0] RD1_D, RD2_D;
	
	
	reg RegWriteD_r,ALUSrcD_r,MemWriteD_r,ResultSrcD_r,BranchD_r, vectorial_r;
	reg [2:0] ALUControlD_r;
	reg [31:0] Imm_Ext_D_r;
   reg [127:0] RD1_D_r, RD2_D_r;
	reg [5:0] RD_D_r, RS1_D_r, RS2_D_r; // Revisar
	reg [31:0] PCD_r,PCPlus4D_r;
	
	control_unit_top control(
									.Op(InstrD[4:0]), // ajustado
									.RegWrite(RegWriteD),
									.ImmSrc(ImmSrcD),
									.ALUSrc(ALUSrcD),
									.MemWrite(MemWriteD),
									.ResultSrc(ResultSrcD),
									.Branch(BranchD),
									.funct3(InstrD[25:23]), // ajustado
									.funct7(InstrD[31:26]), // ajustado
									.ALUControl(ALUControlD),
                           .vectorial(vectorialD)
									);

   // TODO: add vector register file  							
	register_file rf (
							.clk(clk),
							.rst(rst),
							.WE3(RegWriteW),
							.WD3(ResultW),
							.A1(InstrD[15:10]),
							.A2(InstrD[21:16]),
							.A3(RDW),
							.RD1(RD1_D),
							.RD2(RD2_D)
							);

   // TODO: add vector register file

	// Ajustado			
	sign_extend extension (
									.In(InstrD[31:0]), // ajustado 
									.ImmSrc(ImmSrcD),
									.Imm_Ext(Imm_Ext_D)
									);
									
									
	
	always @(posedge clk or posedge rst) begin
        if(rst == 1'b1) begin
            RegWriteD_r <= 1'b0;
            ALUSrcD_r <= 1'b0;
            MemWriteD_r <= 1'b0;
            ResultSrcD_r <= 1'b0;
            BranchD_r <= 1'b0;
            vectorial_r <= 1'b0;
            ALUControlD_r <= 3'b000;
            RD1_D_r <= 128'h00000000; 
            RD2_D_r <= 128'h00000000; 
            Imm_Ext_D_r <= 32'h00000000;
            RD_D_r <= 6'h00;
            PCD_r <= 32'h00000000; 
            PCPlus4D_r <= 32'h00000000;
            RS1_D_r <= 6'h00;
            RS2_D_r <= 6'h00;
        end
        else begin
            RegWriteD_r <= RegWriteD;
            ALUSrcD_r <= ALUSrcD;
            MemWriteD_r <= MemWriteD;
            ResultSrcD_r <= ResultSrcD;
            BranchD_r <= BranchD;
            vectorial_r <= vectorialD;
            ALUControlD_r <= ALUControlD;
            RD1_D_r <= RD1_D; 
            RD2_D_r <= RD2_D; 
            Imm_Ext_D_r <= Imm_Ext_D;
            RD_D_r <= InstrD[10:5]; // Ajustado
            PCD_r <= PCD; 
            PCPlus4D_r <= PCPlus4D;
            RS1_D_r <= InstrD[16:11]; // Ajustado
            RS2_D_r <= InstrD[22:17]; // Ajustado
        end
   end								
				
	assign RegWriteE = RegWriteD_r;
   assign ALUSrcE = ALUSrcD_r;
   assign MemWriteE = MemWriteD_r;
   assign ResultSrcE = ResultSrcD_r;
   assign BranchE = BranchD_r;
   assign vectorialE = vectorial_r;
   assign ALUControlE = ALUControlD_r;
   assign RD1_E = RD1_D_r;
   assign RD2_E = RD2_D_r;
   assign Imm_Ext_E = Imm_Ext_D_r;
   assign RD_E = RD_D_r;
   assign PCE = PCD_r;
   assign PCPlus4E = PCPlus4D_r;
   assign RS1_E = RS1_D_r;
   assign RS2_E = RS2_D_r;

endmodule