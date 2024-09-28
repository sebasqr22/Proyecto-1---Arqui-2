module fetch_cycle(
	clk,
	rst,
	PCSrcE,
	PCTargetE,
	InstrD,
	PCD,
	PCPlus4D
);

	// declaracion de input
	input clk, rst;
	input PCSrcE; // Controla el mux de instrucciones
	input [31:0] PCTargetE; // direccion de la instruccion a ejecutar branch
	output [31:0] InstrD; // instruccion a decodificar
	output [31:0] PCD, PCPlus4D; // PC y PC + 4
	
	// declaracion de wires internos
	
	wire [31:0] PC_F, PCF, PCPlus4F; // PC y PC + 4
	wire [31:0] InstrF; // instruccion a ejecutar
	
	// declaracion de register
	
	reg [31:0] InstrF_reg;
	reg [31:0] PCF_reg, PCPlus4F_reg;
	
	
	// inicializacion de modulos
	
	mux2to1 PC_MUX(
						.data0(PCTargetE),
						.data1(PCPlus4F),
						.sel(PCSrcE),
   					.dataOut(PC_F)
	);
	
	// PC counter
	
	PC_module Program_Counter(
										.clk(clk), 
										.rst(rst),
										.PC_next(PC_F),
										.PC(PCF)
	);
	
	// imem REVISAR MEMORIA
	imem instruc_mem(
							.address(PCF),
							.clock(clk),
							.q(InstrF)
							);
							
	// PC adder
   PC_adder PC_plus4(
							.a(PCF),
							.b(32'h00000001),
							.c(PCPlus4F)
	);
	
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			InstrF_reg <= 32'h00000000;
			PCF_reg <= 32'h00000000;
			PCPlus4F_reg <= 32'h00000000;
		end
		else begin
			InstrF_reg <= InstrF;
			PCF_reg <= PCF;
			PCPlus4F_reg <= PCPlus4F;
		end
	end
	
	// Asignar el valor de registros al output
	assign InstrD = (rst == 1'b1) ? 32'h00000000 : InstrF_reg;
	assign PCD = (rst == 1'b1) ? 32'h00000000 : PCF_reg;
	assign PCPlus4D = (rst == 1'b1) ? 32'h00000000 : PCPlus4F_reg;
	
	
endmodule