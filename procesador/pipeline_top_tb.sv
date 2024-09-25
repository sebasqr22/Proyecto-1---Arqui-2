`timescale 1ns/1ns

module pipeline_top_tb;

    // Parámetros
    parameter CLK_PERIOD = 10; // Período del reloj en ns

    // Entradas
    reg clk;
    reg rst;

    // Cableado de las señales intermedias (si se necesita monitorear)
    wire PCSrcE, RegWriteW, RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE, RegWriteM, MemWriteM, ResultSrcM, ResultSrcW;
    wire [2:0] ALUControlE;
    wire [4:0] RD_E, RD_M, RDW;
    wire [31:0] PCTargetE, InstrD, PCD, PCPlus4D, ResultW, RD1_E, RD2_E, Imm_Ext_E, PCE, PCPlus4E, PCPlus4M, WriteDataM, ALU_ResultM;
    wire [31:0] PCPlus4W, ALU_ResultW, ReadDataW;
    wire [5:0] RS1_E, RS2_E;

    // Instanciación del DUT
    pipeline_top dut (
        .clk(clk),
        .rst(rst)
    );

    // Generación del reloj
    always begin
        #((CLK_PERIOD / 2));
        clk <= ~clk;
    end

    // Inicialización del reset
    initial begin
        clk = 0;
        rst = 1;

        #20; // Esperar 2 ciclos de reloj

        // Liberar el reset
        rst = 0;

        // Caso de prueba 1
        // (Puedes proporcionar valores de prueba para las entradas aquí si lo deseas)

        #500; // Esperar 10 ciclos de reloj y luego detener la simulación
        $finish;
    end

endmodule

