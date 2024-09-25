`timescale 1ns/1ns

module vectorial_alu_tb;

    // Inputs
    reg [127:0] A;
    reg [127:0] B;
    reg [2:0] ALUControl;
    reg vectorial;

    // Outputs
    wire [127:0] Result;
    wire Zero;

    // Instantiate the DUT (Device Under Test)
    vectorial_alu dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .vectorial(vectorial),
        .Result(Result),
        .Zero(Zero)
    );

    // Test stimulus
    initial begin
        // Test case 1: Scalar addition (first 32 bits of A and B)
        vectorial = 0;  // Scalar mode
        A = 128'h00000000_00000000_00000000_0000000A;  // A = 10 (first 32 bits)
        B = 128'h00000000_00000000_00000000_00000014;  // B = 20 (first 32 bits)
        ALUControl = 3'b000;  // Addition
        #10;
        $display("Scalar Addition: Result = %h, Zero = %b", Result, Zero);
        
        // Test case 2: Vector addition (full 128 bits)
        vectorial = 1;  // Vector mode
        A = 128'h00000000_00000000_00000000_00000008;  // Vector operand A
        B = 128'h00000000_00000000_00000000_00000004;  // Vector operand B
        ALUControl = 3'b000;  // Addition
        #10;
        $display("Vector Addition: Result = %h", Result);

        /*// Test case 3: Vector subtraction
        ALUControl = 3'b001;  // Subtraction
        A = 128'h00000005_00000006_00000007_00000008;  // A = {5, 6, 7, 8}
        B = 128'h00000001_00000002_00000003_00000004;  // B = {1, 2, 3, 4}
        #10;
        $display("Vector Subtraction: Result = %h", Result);

        // Test case 4: Vector AND
        ALUControl = 3'b010;  // AND operation
        A = 128'hFFFFFFFF_FFFFFFFF_FFFFFFFF_FFFFFFFF;  // All bits set to 1
        B = 128'hAAAAAAAA_AAAAAAAA_AAAAAAAA_AAAAAAAA;  // Alternating bits
        #10;
        $display("Vector AND: Result = %h", Result);

        // Test case 5: Vector OR
        ALUControl = 3'b011;  // OR operation
        A = 128'h55555555_55555555_55555555_55555555;  // Alternating bits
        B = 128'hAAAAAAAA_AAAAAAAA_AAAAAAAA_AAAAAAAA;  // Alternating bits
        #10;
        $display("Vector OR: Result = %h", Result);

        // Test case 6: Vector XOR
        ALUControl = 3'b100;  // XOR operation
        A = 128'hFFFFFFFF_FFFFFFFF_FFFFFFFF_FFFFFFFF;  // All bits set to 1
        B = 128'hAAAAAAAA_AAAAAAAA_AAAAAAAA_AAAAAAAA;  // Alternating bits
        #10;
        $display("Vector XOR: Result = %h", Result);

        // Test case 7: Scalar Shift Left Logical
        vectorial = 0;  // Scalar mode
        A = 128'h00000000_00000000_00000000_00000008;  // A = 8 (first 32 bits)
        B = 128'h00000000_00000000_00000000_00000002;  // Shift by 2
        ALUControl = 3'b101;  // Shift Left Logical
        #10;
        $display("Scalar Shift Left Logical: Result = %h", Result);

        // Test case 8: Scalar Shift Right Logical
        ALUControl = 3'b110;  // Shift Right Logical
        A = 128'h00000000_00000000_00000000_00000020;  // A = 32 (first 32 bits)
        B = 128'h00000000_00000000_00000000_00000002;  // Shift by 2
        #10;
        $display("Scalar Shift Right Logical: Result = %h", Result);

        // Test case 9: Scalar Shift Right Arithmetic
        ALUControl = 3'b111;  // Shift Right Arithmetic
        A = 128'h00000000_00000000_00000000_80000000;  // A = -2147483648 (first 32 bits, 2's complement)
        B = 128'h00000000_00000000_00000000_00000002;  // Shift by 2
        #10;
        $display("Scalar Shift Right Arithmetic: Result = %h", Result);*/

        $finish;
    end

endmodule
