module memory_cycle(clk, rst, RegWriteM, MemWriteM, ResultSrcM, RD_M, PCPlus4M, WriteDataM, 
    ALU_ResultM, RegWriteW, ResultSrcW, RD_W, PCPlus4W, ALU_ResultW, ReadDataW,
	 readAddressUser,uart_en, uart_Value_in,uart_Value_W);
	 
	 
    input clk, rst, RegWriteM, MemWriteM, ResultSrcM,uart_en;
    input [5:0] RD_M; 
    input [31:0] PCPlus4M;
    input [127:0] WriteDataM, ALU_ResultM;
	input [15:0] readAddressUser;
	input [127:0] uart_Value_in;

    output RegWriteW, ResultSrcW; 
    output [5:0] RD_W;
    output [31:0] PCPlus4W; 
	 output [127:0] ALU_ResultW, ReadDataW;
	 output [127:0] uart_Value_W;
	 
    wire [127:0] ReadDataM;
    wire [127:0] uart_Value_out;

    reg RegWriteM_r, ResultSrcM_r;
    reg [5:0] RD_M_r;
    reg [31:0] PCPlus4M_r;
	reg [127:0] ALU_ResultM_r, ReadDataM_r, uart_Value_out_r;
	 
	 
	 
    data_memory dmem (
                        .clk(clk),    
                        .WE(MemWriteM),
								.uart_en(uart_en),
								.WD(WriteDataM),
								.address_a(ALU_ResultM[15:0]),
								.address_b(readAddressUser),
								.RD(ReadDataM),
								.uart_Value_in(uart_Value_in),
								.uart_Value_out(uart_Value_out)
                    );	 
	 
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            RegWriteM_r <= 1'b0; 
            ResultSrcM_r <= 1'b0;
            RD_M_r <= 5'h00;
            PCPlus4M_r <= 32'h00000000; 
            ALU_ResultM_r <= 127'h00000000; 
            ReadDataM_r <= 128'h00000000;
            uart_Value_out_r <= 128'h00000000;
        end
        else begin
            RegWriteM_r <= RegWriteM; 
            ResultSrcM_r <= ResultSrcM;
            RD_M_r <= RD_M;
            PCPlus4M_r <= PCPlus4M; 
            ALU_ResultM_r <= ALU_ResultM; 
            ReadDataM_r <= ReadDataM;
            uart_Value_out_r<= uart_Value_out;
        end
    end 

    
	 
    assign RegWriteW = RegWriteM_r;
    assign ResultSrcW = ResultSrcM_r;
    assign RD_W = RD_M_r;
    assign PCPlus4W = PCPlus4M_r;
    assign ALU_ResultW = ALU_ResultM_r;
    assign ReadDataW = ReadDataM_r;	 
    assign uart_Value_W= uart_Value_out_r;
	 
	 
	 
endmodule