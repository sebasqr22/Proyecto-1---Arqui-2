module control_unit_top(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,funct3,funct7,ALUControl,vectorial);

    input [4:0]Op; // ajustado
	input [6:0]funct7; // ajustado
    input [2:0]funct3; // ajustado
    output RegWrite,ALUSrc,MemWrite,ResultSrc,Branch,vectorial;
    output [1:0]ImmSrc; // ajustado
    output [2:0]ALUControl; // ajustado

    wire [1:0]ALUOp;

    main_decoder main_decoder(
                .Op(Op),
                .RegWrite(RegWrite),
                .ImmSrc(ImmSrc),
                .MemWrite(MemWrite),
                .ResultSrc(ResultSrc),
                .Branch(Branch),
                .ALUSrc(ALUSrc),
                .ALUOp(ALUOp),
                .vectorial(vectorial)
    );

    alu_decoder alu_decoder(
                            .ALUOp(ALUOp),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(Op),
                            .ALUControl(ALUControl)
    );


endmodule