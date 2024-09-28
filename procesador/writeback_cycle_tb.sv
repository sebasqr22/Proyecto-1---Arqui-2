`timescale 1ns/1ns

module writeback_cycle_tb;

    // Parámetros
    parameter CLK_PERIOD = 10; // Período del reloj en ns

    // Entradas
    reg clk;
    reg rst;
    reg ResultSrcW;
    reg [31:0] PCPlus4W;
    reg [31:0] ALU_ResultW;
    reg [31:0] ReadDataW;

    // Salidas
    wire [31:0] ResultW;

    // Cableado del DUT
    writeback_cycle dut (
        .clk(clk),
        .rst(rst),
        .ResultSrcW(ResultSrcW),
        .PCPlus4W(PCPlus4W),
        .ALU_ResultW(ALU_ResultW),
        .ReadDataW(ReadDataW),
        .ResultW(ResultW)
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
        ResultSrcW = 0;
        PCPlus4W = 32'b0;
        ALU_ResultW = 32'b0;
        ReadDataW = 32'b0;

        #20; // Esperar 2 ciclos de reloj

        // Liberar el reset
        rst = 0;

        // Caso de prueba 1
        #50; // Esperar 5 ciclos de reloj
        ResultSrcW = 1;
        PCPlus4W = 32'b10101010;
        ALU_ResultW = 32'b11110000;
        ReadDataW = 32'b00000011; // 3
		  
		  #50; // Esperar 5 ciclos de reloj
        ResultSrcW = 0;

        #500; // Esperar 10 ciclos de reloj y luego detener la simulación
        $finish;
    end

endmodule
