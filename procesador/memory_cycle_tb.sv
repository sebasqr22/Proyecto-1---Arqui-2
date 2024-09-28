`timescale 1ns/1ns

module memory_cycle_tb;

    // Parámetros
    parameter CLK_PERIOD = 10; // Período del reloj en ns

    // Entradas
    reg clk;
    reg rst;
    reg RegWriteM;
    reg MemWriteM;
    reg ResultSrcM;
    reg uart_en;
    reg [5:0] RD_M;
    reg [31:0] PCPlus4M;
    reg [127:0] WriteDataM;
    reg [127:0] ALU_ResultM;
    reg [15:0] readAddressUser;
    reg [127:0] uart_Value_in;

    // Salidas
    wire RegWriteW;
    wire ResultSrcW;
    wire [5:0] RD_W;
    wire [31:0] PCPlus4W;
    wire [127:0] ALU_ResultW;
    wire [127:0] ReadDataW;
    wire [127:0] uart_Value_W;

    // Cableado del DUT
    memory_cycle dut (
        .clk(clk),
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
        .RD_W(RD_W),
        .PCPlus4W(PCPlus4W),
        .ALU_ResultW(ALU_ResultW),
        .ReadDataW(ReadDataW),
        .readAddressUser(readAddressUser),
        .uart_en(uart_en),
        .uart_Value_in(uart_Value_in),
        .uart_Value_W(uart_Value_W)
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
        RegWriteM = 0;
        MemWriteM = 0;
        ResultSrcM = 0;
		  uart_en=0;
		  readAddressUser=0;
		  uart_Value_in=0;
        RD_M = 6'b0;
        PCPlus4M = 32'b0;
        WriteDataM = 128'b0;
        ALU_ResultM = 128'b0;

        #20; // Esperar 2 ciclos de reloj

        // Liberar el reset
        rst = 0;

        // Caso de prueba 1 Escribir
        #50; // Esperar 5 ciclos de reloj
        RegWriteM = 1;
        MemWriteM = 1;
        ResultSrcM = 0;
        RD_M = 6'b101010;
        PCPlus4M = 32'b10101010;
        WriteDataM = 128'b00110010; // 50
        ALU_ResultM = 128'b00000001;


        #50; // Esperar 5 ciclos de reloj
        RegWriteM = 1;
        MemWriteM = 1;
        ResultSrcM = 0;
        RD_M = 6'b101010;
        PCPlus4M = 32'b10101010;
        WriteDataM = 128'b01010110; // 86
        ALU_ResultM = 128'b00000101;

		  
		  // Caso de prueba 2 Leer
        #50; // Esperar 5 ciclos de reloj
        RegWriteM = 1;
        MemWriteM = 0;
        ResultSrcM = 1;
        //RD_M = 6'b101010;
        //PCPlus4M = 32'b10101010;
        WriteDataM = 128'b11111111; 
        ALU_ResultM = 128'b00000101;
		  
		 

        #500; // Esperar 50 ciclos de reloj y luego detener la simulación
        $finish;
    end

endmodule
