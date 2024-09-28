module main_decoder(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp, vectorial);
    input [4:0]Op; // ajustado
    output RegWrite,ALUSrc,MemWrite,ResultSrc,Branch, vectorial;
    output [1:0]ImmSrc,ALUOp;

	 // ajsutado
    assign RegWrite = (Op == 5'b01100 | Op == 5'b00111 | Op == 5'b01000 | Op == 5'b00001) ? 1'b0 : 1'b1 ;
	 
	 // Controla el sign extend: necesario para instrucciones tipo I, S, SB
	 // si la instruccion es algina de las anteriores 
    assign ImmSrc = (Op == 5'b00000 | Op == 5'b01101 | Op == 5'b00011 | Op == 5'b01001 | Op == 5'b01100) ? 2'b01 : 
						  (Op == 5'b00001 | Op == 5'b00111 | Op == 5'b01000) ? 2'b10 : 2'b00;
    // esto elige si es imm o el reg2, poner en 0 si es rg2 y 1 si es imm ajustado											  
    assign ALUSrc = (Op == 5'b00000 | Op == 5'b00011 | Op == 5'b01001 | Op == 5'b01100 | Op == 5'b01101 | Op == 5'b00001) ? 1'b1 : 1'b0 ;
	 // ajustado
    assign MemWrite = (Op == 5'b00001) ? 1'b1 : 1'b0 ;
	 
	 // 1 es para escribir lo que viene de memoria CP DML DMR DME
	 // 0 es para escribir el resultado de la alu resto de instrucciones 
    assign ResultSrc = (Op == 5'b00001 | Op == 5'b01010 | Op == 5'b01110 | Op == 5'b01111) ? 1'b1 : 1'b0 ;
	 
	 // 1 a las instrc CMM CME
    assign Branch = (Op == 5'b00111 | Op == 5'b01000) ? 1'b1 : 1'b0 ;
	 
	 // 1 a las instrc RS ML ORR CDI
    assign ALUOp = (Op == 5'b00100 | Op == 5'b00101 | Op == 5'b00110 | Op == 5'b01001) ? 2'b01 : 2'b00 ;

    assign vectorial = (Op == 5'b10000 | Op == 5'b10001 | Op == 5'b10010 | Op == 5'b10100 | Op == 5'b10101 | Op == 5'b10110 | Op == 5'b10111 | Op == 5'b11000) ? 1'b1 : 1'b0 ;

endmodule