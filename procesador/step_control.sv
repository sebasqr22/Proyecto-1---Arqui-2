module step_control(
    input clk,               // Reloj del sistema
    input rst,               // Señal de reset
    input step_button,       // Botón de stepping
    input step_enable,       // Switch de habilitación de stepping
    input instr_completed,   // Señal que indica que la instrucción actual ha completado todas las etapas
    output reg instr_fetch_enable // Señal para permitir la siguiente instrucción
);
    reg step_button_reg, step_button_last;
    reg stepping_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            step_button_reg <= 0;
            step_button_last <= 0;
            instr_fetch_enable <= 1; // Por defecto, el fetch está habilitado
            stepping_state <= 0;
        end else begin
            step_button_reg <= step_button; // Registro del valor actual del botón
            step_button_last <= step_button_reg; // Registro del valor anterior del botón

            // En modo normal, siempre permite el fetch de instrucciones
            if (!step_enable) begin
                instr_fetch_enable <= 1; // Pipeline funciona normalmente
            end else begin
                // Si está en modo stepping, controla el avance por instrucción
                if (step_button_reg && ~step_button_last) begin
                    // Botón presionado, habilita el fetch si la instrucción anterior ha terminado
                    if (instr_completed) begin
                        instr_fetch_enable <= 1; // Permite la siguiente instrucción
                    end else begin
                        instr_fetch_enable <= 0; // Espera hasta que la instrucción termine
                    end
                end else begin
                    instr_fetch_enable <= 0; // No permite nueva instrucción hasta que se presione el botón
                end
            end
        end
    end
endmodule
s