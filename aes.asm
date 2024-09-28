section .data
    sbox db 0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
    0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
    0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
    0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
    0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
    0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
    0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
    0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
    0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
    0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
    0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
    0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
    0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
    0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
    0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
    0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16;

    inv_sbox db 0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
    0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
    0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
    0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
    0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
    0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
    0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
    0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
    0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
    0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
    0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
    0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
    0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
    0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
    0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
    0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D;

    rcon db 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36,
    0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 
    0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 
    0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 
    0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 
    0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 
    0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 
    0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 
    0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 
    0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 
    0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 
    0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 
    0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 
    0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 
    0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 
    0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 
    0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 
    0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 
    0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb;

    key db 0x00, 0x01, 0x02, 0x03,
                        0x04, 0x05, 0x06, 0x07,
                        0x08, 0x09, 0x0A, 0x0B,
                        0x0C, 0x0D, 0x0E, 0x0F;

    data db 0x32, 0x43, 0xF6, 0xA8,
                         0x88, 0x5A, 0x30, 0x8D,
                         0x31, 0x31, 0x98, 0xA2,
                         0xE0, 0x37, 0x07, 0x34;


section .bss 
    key_expandida resb 176
    encriptado resb 16
    desencriptado resb 16

section .text
    global _start

_start:
    lea esi, [key] 
    lea edi, [key_expandida]
    call expand_key

    ;cifrado
    lea esi, [data]
    lea edi, [encriptado]
    call aes_encriptado

    ;terminar programa
    mov eax, 60
    xor edi, edi
    syscall


rot_word:
    ; Suponemos que el puntero al array de 4 bytes está en ESI

    ; Guardar word[0] en el registro temporal AL
    mov al, byte [esi]         ; Cargar word[0] en AL

    ; Mover word[1] a word[0]
    mov bl, byte [esi+1]       ; Cargar word[1] en BL
    mov byte [esi], bl         ; Almacenar BL (word[1]) en word[0]

    ; Mover word[2] a word[1]
    mov bl, byte [esi+2]       ; Cargar word[2] en BL
    mov byte [esi+1], bl       ; Almacenar BL (word[2]) en word[1]

    ; Mover word[3] a word[2]
    mov bl, byte [esi+3]       ; Cargar word[3] en BL
    mov byte [esi+2], bl       ; Almacenar BL (word[3]) en word[2]

    ; Mover el valor guardado de AL (original word[0]) a word[3]
    mov byte [esi+3], al       ; Almacenar AL en word[3]

    ret                        ; Devolver de la función

sub_word:
    ; El puntero a 'word' (el array de 4 bytes) está en ESI
    ; El puntero a la tabla S-box está en EBX

    ; Cargar la dirección de la S-box en EBX
    lea ebx, [sbox]

    ; Empezamos con ECX = 0 (para el bucle de 4 bytes)
    xor ecx, ecx                ; ECX = 0

sub_word_loop:
    ; Cargar el byte actual del array word en AL
    mov al, [esi + ecx]          ; Cargar word[i] en AL

    ; Usar el valor de AL como índice en la S-box (en EBX)
    movzx eax, al                ; Extender AL a 32 bits (para evitar errores de índice)
    mov al, [ebx + eax]          ; Cargar el valor de sbox[word[i]] en AL

    ; Almacenar el valor sustituido en word[i]
    mov [esi + ecx], al          ; Guardar el valor de AL en word[i]

    ; Incrementar el contador (ECX) para procesar el siguiente byte
    inc ecx

    ; Comprobar si hemos procesado los 4 bytes
    cmp ecx, 4
    jl sub_word_loop             ; Si ECX < 4, repetir el bucle

    ; Finalizar
    ret

key_expansion:
    ; Asumimos que ESI contiene el puntero a la clave original (key)
    ; EDI contiene el puntero a expanded_key

    ; Copiar los primeros 16 bytes de la clave al expanded_key
    mov ecx, 16
    rep movsb                 ; Copiar 16 bytes desde [esi] (key) a [edi] (expanded_key)

    ; Empezar la expansión a partir de i = 4 (cuatro palabras ya copiadas)
    mov eax, 4                ; i = 4

expand_loop:
    cmp eax, 44               ; ¿Hemos procesado las 44 palabras?
    jge done                  ; Si hemos alcanzado 44, terminamos

    ; Copiar 4 bytes desde expanded_key[(i - 1) * 4] a temp
    lea ebx, [edi + (eax - 1) * 4]   ; Puntero a expanded_key[(i - 1) * 4]
    mov ecx, 4                ; Copiar 4 bytes
    rep movsb                 ; Copiar los bytes de expanded_key[(i - 1) * 4] a temp

    ; Si i % 4 == 0, aplicar rot_word, sub_word y XOR con rcon
    test eax, 3               ; ¿Es i divisible por 4?
    jnz skip_transform        ; Si no es divisible, saltamos la transformación

    ; Llamada a rot_word (suponemos que temp está en ESI)
    lea esi, [temp]
    call rot_word             ; Rotar los bytes en temp

    ; Llamada a sub_word
    call sub_word             ; Sustituir bytes en temp usando la S-box

    ; XOR con rcon[(i / 4) - 1]
    mov ecx, eax              ; Dividir i por 4 (ecx = i / 4)
    shr ecx, 2
    dec ecx                   ; (i / 4) - 1
    mov bl, [rcon + ecx]      ; Cargar rcon[(i / 4) - 1]
    xor byte [temp], bl       ; XOR con temp[0]

skip_transform:
    ; expanded_key[i * 4 + j] = expanded_key[(i - 4) * 4 + j] ^ temp[j]
    mov ecx, 4                ; Repetir 4 veces (j = 0 a 3)
    mov esi, expanded_key     ; Apuntar a expanded_key base

    lea ebx, [edi + (eax - 4) * 4]   ; Dirección de expanded_key[(i - 4) * 4]
    lea edx, [edi + eax * 4]         ; Dirección de expanded_key[i * 4]

xor_loop:
    mov al, [ebx]             ; Cargar expanded_key[(i - 4) * 4 + j]
    xor al, [temp + ecx - 4]  ; XOR con temp[j]
    mov [edx], al             ; Guardar en expanded_key[i * 4 + j]
    inc ebx
    inc edx
    loop xor_loop

    inc eax                   ; Incrementar i
    jmp expand_loop           ; Repetir el bucle

done:
    ret                       ; Terminar la función

sub_bytes:
    ; El puntero al estado está en ESI
    ; El puntero a la S-box estará en EBX

    lea ebx, [sbox]           ; Cargar la dirección de la tabla S-box en EBX
    xor ecx, ecx              ; Inicializar ECX a 0 para el contador de bucle (i = 0)

sub_bytes_loop:
    ; Cargar state[i] en AL
    mov al, [esi + ecx]       ; Cargar el byte state[i] en AL

    ; Usar AL como índice en la S-box
    movzx eax, al             ; Asegurarse de que el valor esté en 32 bits (expandir AL a EAX)
    mov al, [ebx + eax]       ; Obtener el valor de sbox[state[i]] en AL

    ; Guardar el valor sustituido de nuevo en state[i]
    mov [esi + ecx], al       ; Guardar el valor en state[i]

    ; Incrementar el índice (i++)
    inc ecx
    cmp ecx, 16               ; ¿Hemos procesado los 16 bytes?
    jl sub_bytes_loop         ; Si no hemos llegado a 16, repetir el bucle

    ; Terminar la función
    ret

inv_sub_bytes:
    ; El puntero al estado está en ESI
    ; El puntero a la inv_sbox estará en EBX

    lea ebx, [inv_sbox]       ; Cargar la dirección de la tabla inv_sbox en EBX
    xor ecx, ecx              ; Inicializar ECX a 0 para el contador de bucle (i = 0)

inv_sub_bytes_loop:
    ; Cargar state[i] en AL
    mov al, [esi + ecx]       ; Cargar el byte state[i] en AL

    ; Usar AL como índice en inv_sbox
    movzx eax, al             ; Extender AL a 32 bits (expandir AL a EAX)
    mov al, [ebx + eax]       ; Obtener el valor de inv_sbox[state[i]] en AL

    ; Guardar el valor sustituido de nuevo en state[i]
    mov [esi + ecx], al       ; Guardar el valor en state[i]

    ; Incrementar el índice (i++)
    inc ecx
    cmp ecx, 16               ; ¿Hemos procesado los 16 bytes?
    jl inv_sub_bytes_loop     ; Si no hemos llegado a 16, repetir el bucle

    ; Terminar la función
    ret


shift_rows:
    ; Prototipo en C: void shift_rows(uint8_t* state)
    ; Asumimos que el puntero al array "state" está en edi (32 bits)

    ; Rotación de la fila 2 (rotar 1 byte)
    mov al, [edi + 1]     ; Cargar state[1] en al
    mov dl, [edi + 5]     ; Cargar state[5] en dl
    mov [edi + 1], dl     ; Mover state[5] a state[1]
    mov dl, [edi + 9]     ; Cargar state[9] en dl
    mov [edi + 5], dl     ; Mover state[9] a state[5]
    mov dl, [edi + 13]    ; Cargar state[13] en dl
    mov [edi + 9], dl     ; Mover state[13] a state[9]
    mov [edi + 13], al    ; Mover el valor original de state[1] a state[13]

    ; Rotación de la fila 3 (rotar 2 bytes)
    mov al, [edi + 2]     ; Cargar state[2] en al
    mov dl, [edi + 10]    ; Cargar state[10] en dl
    mov [edi + 2], dl     ; Mover state[10] a state[2]
    mov [edi + 10], al    ; Mover el valor original de state[2] a state[10]

    mov al, [edi + 6]     ; Cargar state[6] en al
    mov dl, [edi + 14]    ; Cargar state[14] en dl
    mov [edi + 6], dl     ; Mover state[14] a state[6]
    mov [edi + 14], al    ; Mover el valor original de state[6] a state[14]

    ; Rotación de la fila 4 (rotar 3 bytes)
    mov al, [edi + 3]     ; Cargar state[3] en al
    mov dl, [edi + 15]    ; Cargar state[15] en dl
    mov [edi + 3], dl     ; Mover state[15] a state[3]
    mov dl, [edi + 11]    ; Cargar state[11] en dl
    mov [edi + 15], dl    ; Mover state[11] a state[15]
    mov dl, [edi + 7]     ; Cargar state[7] en dl
    mov [edi + 11], dl    ; Mover state[7] a state[11]
    mov [edi + 7], al     ; Mover el valor original de state[3] a state[7]

    ret

add_round_key:
    ; Prototipo en C: void add_round_key(uint8_t* state, const uint8_t* round_key)
    ; Parámetros esperados:
    ; - edi: puntero al array "state" (primer parámetro)
    ; - esi: puntero al array "round_key" (segundo parámetro)

    push ebp                ; Guardar el valor original de ebp en la pila
    mov ebp, esp            ; Establecer el marco de pila

    mov ecx, 16             ; Establecer contador del bucle (16 bytes)

loop_xor:
    mov al, [edi]           ; Cargar byte actual de state en al
    xor al, [esi]           ; Hacer XOR con el byte correspondiente de round_key
    mov [edi], al           ; Almacenar el resultado en state

    inc edi                 ; Incrementar el puntero de state
    inc esi                 ; Incrementar el puntero de round_key
    loop loop_xor           ; Decrementar ecx y saltar si no es cero

    mov esp, ebp            ; Restaurar el valor original de esp
    pop ebp                 ; Restaurar el valor original de ebp

    ret                     ; Retornar de la función

aes_encrypt:
    ; Prototipo en C: void aes_encrypt(const uint8_t* key, const uint8_t* in, uint8_t* out)
    ; - key: puntero a la clave en [esp + 4]
    ; - in: puntero a los datos de entrada en [esp + 8]
    ; - out: puntero a los datos de salida en [esp + 12]

    ; Crear espacio en la pila para las variables locales
    ; Vamos a reservar espacio para:
    ; - state[16] (16 bytes)
    ; - expanded_key[176] (176 bytes)
    
    push ebp                ; Guardar ebp
    mov ebp, esp            ; Establecer marco de pila
    sub esp, 192            ; Reservar 192 bytes (16 para state + 176 para expanded_key)

    ; Cargar los punteros key, in y out en registros
    mov edi, [ebp + 8]      ; Cargar el puntero de la clave (key) en edi
    mov esi, [ebp + 12]     ; Cargar el puntero de entrada (in) en esi
    mov edx, [ebp + 16]     ; Cargar el puntero de salida (out) en edx

    ; expanded_key está en [ebp-192], el comienzo de la pila local
    lea ebx, [ebp - 192]    ; Puntero a expanded_key en ebx

    ; Llamar a key_expansion(key, expanded_key)
    push ebx                ; Pasar puntero a expanded_key
    push edi                ; Pasar puntero a key
    call key_expansion
    add esp, 8              ; Limpiar los parámetros de la pila

    ; Copiar los primeros 16 bytes de in a state
    lea edi, [ebp - 16]     ; Puntero a state
    push 16                 ; Pasar el tamaño de la copia
    push esi                ; Pasar puntero a in (fuente)
    push edi                ; Pasar puntero a state (destino)
    call memcpy
    add esp, 12             ; Limpiar los parámetros de la pila

    ; Llamar a add_round_key(state, expanded_key)
    lea edi, [ebp - 16]     ; Puntero a state en edi
    lea esi, [ebx]          ; Puntero a expanded_key en esi
    call add_round_key      ; Llamar a add_round_key(state, expanded_key)

    ; Bucle para 9 rondas
    mov ecx, 1              ; Inicializar el contador del bucle (i = 1)
round_loop:
    cmp ecx, 10             ; Comparar i con 10
    jge final_round         ; Si i >= 10, saltar a la última ronda

    ; sub_bytes(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call sub_bytes          ; Llamar a sub_bytes(state)

    ; shift_rows(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call shift_rows         ; Llamar a shift_rows(state)

    ; add_round_key(state, expanded_key + (16 * i))
    lea esi, [ebx + ecx * 16] ; Puntero a expanded_key + (16 * i)
    lea edi, [ebp - 16]     ; Puntero a state
    call add_round_key      ; Llamar a add_round_key(state, expanded_key + (16 * i))

    inc ecx                 ; Incrementar el contador i
    jmp round_loop          ; Volver al inicio del bucle

final_round:
    ; Última ronda (sin mix_columns)
    
    ; sub_bytes(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call sub_bytes          ; Llamar a sub_bytes(state)

    ; shift_rows(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call shift_rows         ; Llamar a shift_rows(state)

    ; add_round_key(state, expanded_key + 160)
    lea esi, [ebx + 160]    ; Puntero a expanded_key + 160
    lea edi, [ebp - 16]     ; Puntero a state
    call add_round_key      ; Llamar a add_round_key(state, expanded_key + 160)

    ; Copiar el estado resultante (state) a out
    lea esi, [ebp - 16]     ; Puntero a state
    push 16                 ; Tamaño de la copia
    push edx                ; Puntero a out (destino)
    push esi                ; Puntero a state (fuente)
    call memcpy
    add esp, 12             ; Limpiar los parámetros de la pila

    ; Restaurar el marco de pila
    mov esp, ebp            ; Restaurar el puntero de pila
    pop ebp                 ; Restaurar ebp
    ret                     ; Retornar de la función


aes_decrypt:
    ; Prototipo en C: void aes_decrypt(const uint8_t* key, const uint8_t* in, uint8_t* out)
    ; - key: puntero a la clave en [esp + 4]
    ; - in: puntero a los datos de entrada en [esp + 8]
    ; - out: puntero a los datos de salida en [esp + 12]

    ; Crear espacio en la pila para las variables locales
    ; Vamos a reservar espacio para:
    ; - state[16] (16 bytes)
    ; - expanded_key[176] (176 bytes)
    
    push ebp                ; Guardar ebp
    mov ebp, esp            ; Establecer marco de pila
    sub esp, 192            ; Reservar 192 bytes (16 para state + 176 para expanded_key)

    ; Cargar los punteros key, in y out en registros
    mov edi, [ebp + 8]      ; Cargar el puntero de la clave (key) en edi
    mov esi, [ebp + 12]     ; Cargar el puntero de entrada (in) en esi
    mov edx, [ebp + 16]     ; Cargar el puntero de salida (out) en edx

    ; expanded_key está en [ebp-192], el comienzo de la pila local
    lea ebx, [ebp - 192]    ; Puntero a expanded_key en ebx

    ; Llamar a key_expansion(key, expanded_key)
    push ebx                ; Pasar puntero a expanded_key
    push edi                ; Pasar puntero a key
    call key_expansion
    add esp, 8              ; Limpiar los parámetros de la pila

    ; Copiar los primeros 16 bytes de in a state
    lea edi, [ebp - 16]     ; Puntero a state
    push 16                 ; Pasar el tamaño de la copia
    push esi                ; Pasar puntero a in (fuente)
    push edi                ; Pasar puntero a state (destino)
    call memcpy
    add esp, 12             ; Limpiar los parámetros de la pila

    ; Llamar a add_round_key(state, expanded_key + 160)
    lea esi, [ebx + 160]    ; Puntero a expanded_key + 160
    lea edi, [ebp - 16]     ; Puntero a state
    call add_round_key      ; Llamar a add_round_key(state, expanded_key + 160)

    ; Bucle para las 9 rondas inversas
    mov ecx, 9              ; Inicializar el contador del bucle (i = 9)
round_loop_dec:
    cmp ecx, 0              ; Comparar i con 0
    jle final_round_dec     ; Si i <= 0, saltar a la última ronda

    ; inv_shift_rows(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call inv_shift_rows     ; Llamar a inv_shift_rows(state)

    ; inv_sub_bytes(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call inv_sub_bytes      ; Llamar a inv_sub_bytes(state)

    ; add_round_key(state, expanded_key + (16 * i))
    lea esi, [ebx + ecx * 16] ; Puntero a expanded_key + (16 * i)
    lea edi, [ebp - 16]     ; Puntero a state
    call add_round_key      ; Llamar a add_round_key(state, expanded_key + (16 * i))

    dec ecx                 ; Decrementar el contador i
    jmp round_loop_dec      ; Volver al inicio del bucle

final_round_dec:
    ; Última ronda sin mix_columns inverso

    ; inv_shift_rows(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call inv_shift_rows     ; Llamar a inv_shift_rows(state)

    ; inv_sub_bytes(state)
    lea edi, [ebp - 16]     ; Puntero a state
    call inv_sub_bytes      ; Llamar a inv_sub_bytes(state)

    ; add_round_key(state, expanded_key)
    lea esi, [ebx]          ; Puntero a expanded_key
    lea edi, [ebp - 16]     ; Puntero a state
    call add_round_key      ; Llamar a add_round_key(state, expanded_key)

    ; Copiar el estado resultante (state) a out
    lea esi, [ebp - 16]     ; Puntero a state
    push 16                 ; Tamaño de la copia
    push edx                ; Puntero a out (destino)
    push esi                ; Puntero a state (fuente)
    call memcpy
    add esp, 12             ; Limpiar los parámetros de la pila

    ; Restaurar el marco de pila
    mov esp, ebp            ; Restaurar el puntero de pila
    pop ebp                 ; Restaurar ebp
    ret                     ; Retornar de la función