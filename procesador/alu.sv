module alu(A,B,Result,ALUControl,OverFlow,Carry,Zero,Negative);

    input [31:0]A,B;
    input [2:0]ALUControl;
    output Carry,OverFlow,Zero,Negative;
    output [31:0]Result;

    wire Cout;
    wire [31:0]Sum;

    assign Sum = (ALUControl == 3'b111) ? A + B : (A + ((~B)+1)) ;
	 
    assign {Cout,Result} = (ALUControl == 3'b000) ? Sum :
                           (ALUControl == 3'b111) ? Sum :
                           (ALUControl == 3'b001) ? A * B :
                           (ALUControl == 3'b010) ? A | B :
									(ALUControl == 3'b011) ? A >> B : // shif 
									(ALUControl == 3'b100) ? A < B: // branch less than
                           (ALUControl == 3'b101) ? A <= B : // branch less eq 
									(ALUControl == 3'b110) ? A == B : // branch less eq 
                           {33{1'b0}};
									
    assign OverFlow = ((Sum[31] ^ A[31]) & 
                      (~(ALUControl[0] ^ B[31] ^ A[31])) &
                      (~ALUControl[1]));
    assign Carry = ((~ALUControl[1]) & Cout);
    assign Zero = Result[0]; // invierte el resultado y aplica and bit a bit
    assign Negative = Result[31];

endmodule