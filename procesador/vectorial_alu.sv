module vectorial_alu(
    input logic [127:0] A,     // Primer operando de 128 bits
    input logic [127:0] B,     // Segundo operando de 128 bits
    input logic [2:0] ALUControl, // Señal de control para seleccionar la operación
    input logic vectorial,     // Señal para seleccionar entre modo vectorial o escalar
    output logic [127:0] Result,  // Resultado de la operación ALU
    output logic Zero           // Señal que indica si el resultado es cero (escalar)
);

    // Definimos señales intermedias para operaciones escalares y vectoriales
    logic [31:0] scalar_A, scalar_B;
    logic [31:0] scalar_result;
    logic [127:0] vector_result;
    
    // Asignamos los primeros 32 bits de A y B para operaciones escalares
    assign scalar_A = A[31:0];
    assign scalar_B = B[31:0];
    
    // Operaciones escalares de 32 bits
    always_comb begin
        case (ALUControl)
            3'b000: scalar_result = scalar_A + scalar_B;      // Suma
            3'b001: scalar_result = scalar_A - scalar_B;      // Resta
            3'b010: scalar_result = scalar_A & scalar_B;      // AND
            3'b011: scalar_result = scalar_A | scalar_B;      // OR
            3'b100: scalar_result = scalar_A ^ scalar_B;      // XOR
            3'b101: scalar_result = scalar_A << scalar_B[4:0]; // Shift left logical
            3'b110: scalar_result = scalar_A >> scalar_B[4:0]; // Shift right logical
            3'b111: scalar_result = scalar_A >>> scalar_B[4:0]; // Shift right arithmetical
            default: scalar_result = 32'h0;
        endcase
    end

    // Operaciones vectoriales de 128 bits (dividido en 4 segmentos de 32 bits)
    always_comb begin
        case (ALUControl)
            3'b000: vector_result = A + B;  // Suma vectorial
            3'b001: vector_result = A - B;  // Resta vectorial
            3'b010: vector_result = A & B;  // AND vectorial
            3'b011: vector_result = A | B;  // OR vectorial
            3'b100: vector_result = A ^ B;  // XOR vectorial
            3'b101: vector_result = A << B[127:0]; // Shift left logical vectorial
            3'b110: vector_result = A >> B[127:0]; // Shift right logical vectorial
            3'b111: vector_result = A >>> B[127:0]; // Shift right arithmetical vectorial
            default: vector_result = 128'h0;
        endcase
    end

    // Resultado basado en el modo de operación
    always_comb begin
        if (vectorial) begin
            Result = vector_result;         // Modo vectorial
        end else begin
            Result = {96'h0, scalar_result}; // Modo escalar (32 bits)
        end
    end
    
    // Señal Zero: solo se aplica en el modo escalar
    assign Zero = (scalar_result == 32'h0) ? 1'b1 : 1'b0;

endmodule
