module alu_decoder(ALUOp,funct3,funct7,op,ALUControl);

    input [1:0]ALUOp;
    input [2:0]funct3;
    input [6:0]funct7;
	input [4:0]op; // ajustado
    output [2:0]ALUControl;

    // Method 2 AJUSTAR OP
    assign ALUControl = (ALUOp == 2'b01) & (funct3 == 3'b001) ? 3'b000 : // resta
								(ALUOp == 2'b01) & (funct3 == 3'b010) ? 3'b001 : // multiplicacion
								(ALUOp == 2'b01) & (funct3 == 3'b011) ? 3'b010 : // or 
								(ALUOp == 2'b01) & (funct3 == 3'b100) ? 3'b011 : // shif 
                        (ALUOp == 2'b00) & (funct3 == 3'b111) ? 3'b111 : // suma
								(ALUOp == 2'b00) & (funct3 == 3'b101) ? 3'b100 : // branch CMM
								(ALUOp == 2'b00) & (funct3 == 3'b110) ? 3'b101 : // branch CME
								(ALUOp == 2'b00) & (funct3 == 3'b000) ? 3'b110 : // comparar
								3'b010 ;
endmodule