module sign_extend (
    input  wire [31:0] In,          // Entrada original (parte de la instrucción)
    input  wire [1:0]  ImmSrc,      // Selección de tipo de inmediato
    output reg  [31:0] Imm_Ext      // Inmediato extendido a 32 bits
);

    always @(*) begin
        case (ImmSrc)
            2'b01: begin
                // Extiende el bit de signo y toma In[31:26] y In[22:17]
                Imm_Ext = {{20{In[31]}}, In[31:26], In[22:17]};
            end
            2'b10: begin
                // Extiende el bit de signo y toma In[31:26] y In[10:5]
                Imm_Ext = {{20{In[31]}}, In[31:26], In[10:5]};
            end
            default: begin
                // Valor por defecto cuando no se selecciona un inmediato
                Imm_Ext = 32'h00000000;
            end
        endcase
    end

endmodule