module step_control(
    input clk,             // Reloj del sistema
    input rst,             // Señal de reset
    input step_button,     // Botón de stepping
    output clk_stepping // Reloj de salida controlado por el botón y el switch
);
    reg step_button_reg, step_button_last;
    reg stepping_state, clk_stepping_r;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            step_button_reg <= 0;
            step_button_last <= 0;
            stepping_state <= 0;
            clk_stepping_r <= 0;
        end else begin
            step_button_reg <= step_button; // Registramos el botón
            step_button_last <= step_button_reg;

            // Detecta el flanco ascendente del botón
            if  (step_button_reg && ~step_button_last) begin
                stepping_state <= 1; // Habilita el stepping
            end else begin
                stepping_state <= 0; // Deshabilita el stepping
            end

            
                // Generar un solo pulso de reloj cuando el estado de stepping esté activo
                if (stepping_state) begin
                    clk_stepping_r <= 1;
                end else begin
                    clk_stepping_r <= 0;
                end
            
        end
    end
	 
	 assign clk_stepping=clk_stepping_r;
	 
endmodule
