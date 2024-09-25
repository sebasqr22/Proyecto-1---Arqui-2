module register_file(clk,rst,WE3,WD3,A1,A2,A3,RD1,RD2);

    input clk,rst,WE3;
	 // A1 direccion de registro 1
	 // A2 direccion de registro 2
	 // A3 direccion de registro a escribir 
    input [5:0]A1,A2,A3;
    input [127:0]WD3;
    output [127:0]RD1,RD2;	 
	 
    reg [31:0] RegisterScalar [24:0]; // array de 25 registros de 32 bits
    reg [127:0] RegisterVec [24:0]; // array de 25 registros de 128 bits

	 // aqui es para asignar valor a un registro si WE3 es 1
	 // esta señal viene de la unidad de control RegWriteD
	 // si WE3 es 1 y la dir A3 es diferente de 0, escribe el nuevo valor de WD3 en 
	 // dir A3
    always @(posedge clk) 
    begin
        if (WD3) begin 
            if (A3[5] == 1'b1) begin 
                RegisterVec[A3] <= WD3;
            end else begin 
                RegisterScalar[A3] <= WD3[31:0];
            end
        end
    end

    assign RD1 = ( A1[5] == 1'b1 ) ? RegisterVec[A1] : {96'h0, RegisterScalar[A1]};
    assign RD2 = ( A2[5] == 1'b1 ) ? RegisterVec[A2] :  {96'h0, RegisterScalar[A2]};

    initial begin
        RegisterScalar[0] = 32'h00000000;
        RegisterVec[0] = 32'h00000000;
    end

endmodule