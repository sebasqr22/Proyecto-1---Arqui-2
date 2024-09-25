module memory_cycle(clk, rst, RegWriteM, MemWriteM, ResultSrcM, RD_M, PCPlus4M, WriteDataM, 
    ALU_ResultM, RegWriteW, ResultSrcW, RD_W, PCPlus4W, ALU_ResultW, ReadDataW,
	 readAddressVga, vgaclk, pixelValue);
	 
	 
    input clk, vgaclk, rst, RegWriteM, MemWriteM, ResultSrcM;
    input [5:0] RD_M; 
    input [31:0] PCPlus4M, WriteDataM, ALU_ResultM;
	 input [15:0] readAddressVga;

    output RegWriteW, ResultSrcW; 
    output [5:0] RD_W;
    output [31:0] PCPlus4W, ALU_ResultW, ReadDataW;
	 output [7:0] pixelValue;
	 
    wire [31:0] ReadDataM;

    reg RegWriteM_r, ResultSrcM_r;
    reg [5:0] RD_M_r;
    reg [31:0] PCPlus4M_r, ALU_ResultM_r, ReadDataM_r;
	 
	 
	 
    data_memory dmem (
                        .clk(clk),
                        .rst(rst),
                        .WE(MemWriteM),
                        .WD(WriteDataM),
                        .A(ALU_ResultM),
                        .RD(ReadDataM),
								.address_b(readAddressVga),
								.clock_b(vgaclk),
								.bitVGA(pixelValue)
                    );	 
	 
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            RegWriteM_r <= 1'b0; 
            ResultSrcM_r <= 1'b0;
            RD_M_r <= 5'h00;
            PCPlus4M_r <= 32'h00000000; 
            ALU_ResultM_r <= 32'h00000000; 
            ReadDataM_r <= 32'h00000000;
        end
        else begin
            RegWriteM_r <= RegWriteM; 
            ResultSrcM_r <= ResultSrcM;
            RD_M_r <= RD_M;
            PCPlus4M_r <= PCPlus4M; 
            ALU_ResultM_r <= ALU_ResultM; 
            ReadDataM_r <= ReadDataM;
        end
    end 

    
	 
    assign RegWriteW = RegWriteM_r;
    assign ResultSrcW = ResultSrcM_r;
    assign RD_W = RD_M_r;
    assign PCPlus4W = PCPlus4M_r;
    assign ALU_ResultW = ALU_ResultM_r;
    assign ReadDataW = ReadDataM_r;	 
	 
	 
	 
endmodule