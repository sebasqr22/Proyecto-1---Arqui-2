import numpy as np
from PIL import Image

img = Image.open('Python_Bresenham/result.png').convert('L')
arr = np.array(img)
arr = arr.flatten()

entrada = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac fermentum turpis, nec interdum turpis. Donec sed massa a sem congue venenatis congue sit amet augue. Integer eu nulla non justo ullamcorper varius. In finibus, augue eget feugiat faucibus, est tellus faucibus dui, at accumsan neque nisi ut massa. Etiam pretium ullamcorper nulla, et dignissim massa pretium et. Ut malesuada interdum nibh vel ullamcorper. Mauris ante dolor, tempor quis venenatis ut, venenatis vulputate ante. Curabitur a mollis dolor, suscipit suscipit erat. Maecenas vel nisl porta, pharetra leo eget, pharetra mi. Sed vitae commodo leo. Ut risus magna, dapibus sit amet."

letters_mem = [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Espacio
    0, 4, 0, 1, 1, 0, 3, 0, 4, 1, 4, 4, 0, 2, 4, 2, 0, 0, 0, 0,#Letra A
    0, 0, 0, 4, 0, 4, 4, 4, 4, 4, 4, 2, 4, 2, 0, 2, 0, 0, 0, 0,#Letra B
    4, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0,#Letra C
    0, 0, 3, 0, 4, 1, 4, 3, 3, 4, 0, 4, 0, 4, 0, 0, 0, 0, 0, 0,#Letra D
    0, 0, 4, 0, 0, 0, 0, 4, 0, 4, 4, 4, 0, 2, 2, 2, 0, 0, 0, 0,#Letra E
    0, 0, 4, 0, 0, 0, 0, 4, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0,#Letra F
    4, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 4, 4, 4, 4, 2, 4, 2, 2, 2,#Letra G
    0, 0, 0, 4, 0, 2, 4, 2, 4, 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0,#Letra H
    0, 0, 4, 0, 2, 0, 2, 4, 0, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0,#Letra I
    0, 0, 4, 0, 2, 0, 2, 4, 2, 4, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0,#Letra J
    0, 0, 0, 4, 0, 2, 2, 2, 2, 2, 4, 0, 2, 2, 4, 4, 0, 0, 0, 0,#Letra K
    0, 0, 0, 4, 0, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Letra L
    0, 0, 0, 4, 0, 0, 2, 0, 2, 0, 2, 4, 2, 0, 4, 0, 4, 0, 4, 4,#Letra M
    0, 0, 0, 4, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Letra N
    0, 0, 0, 4, 0, 4, 4, 4, 4, 4, 4, 0, 4, 0, 0, 0, 0, 0, 0, 0,#Letra O
    0, 0, 4, 0, 4, 0, 4, 2, 4, 2, 0, 2, 0, 0, 0, 4, 0, 0, 0, 0,#Letra P
    0, 0, 4, 0, 4, 0, 4, 4, 4, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0,#Letra Q
    0, 0, 4, 0, 0, 0, 0, 4, 0, 2, 4, 2, 4, 0, 4, 2, 2, 2, 4, 4,#Letra R
    4, 0, 0, 0, 0, 0, 0, 2, 0, 2, 4, 2, 4, 2, 4, 4, 4, 4, 0, 4,#Letra S
    0, 0, 4, 0, 2, 0, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Letra T
    0, 0, 0, 4, 0, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Letra U
    0, 0, 2, 4, 4, 0, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Letra V
    0, 0, 0, 4, 0, 4, 2, 4, 2, 4, 2, 0, 2, 4, 4, 4, 4, 4, 4, 0,#Letra W
    0, 0, 4, 4, 4, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Letra X
    0, 0, 0, 2, 0, 2, 2, 2, 2, 2, 2, 4, 0, 2, 4, 2, 4, 2, 4, 0,#Letra Y
    0, 0, 4, 0, 4, 0, 0, 4, 0, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0,#Letra Z
    0, 3, 0, 4, 1, 3, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,#Punto
    0, 4, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0 ,0, 0 #Coma
]

# Direcciones de memoria
# 0 - 861: Letras de la entrada
# 862 - 1442: Vértices para cada letra
# 1443 - 32691: Espacio para imagen resultado 250x125


# Abre el archivo .mif para escritura
with open("dmem.mif", "w") as mif_file:
    mif_file.write("-- Copyright (C) 2023  Intel Corporation. All rights reserved.\n")
    mif_file.write("-- Your use of Intel Corporation's design tools, logic functions\n")
    mif_file.write("-- and other software and tools, and any partner logic\n")
    mif_file.write("-- functions, and any output files from any of the foregoing\n")
    mif_file.write("-- (including device programming or simulation files), and any\n")
    mif_file.write("-- associated documentation or information are expressly subject\n")
    mif_file.write("-- to the terms and conditions of the Intel Program License\n")
    mif_file.write("-- Subscription Agreement, the Intel Quartus Prime License Agreement,\n")
    mif_file.write("-- the Intel FPGA IP License Agreement, or other applicable license\n")
    mif_file.write("-- agreement, including, without limitation, that your use is for\n")
    mif_file.write("-- the sole purpose of programming logic devices manufactured by\n")
    mif_file.write("-- Intel and sold by Intel or its authorized distributors.  Please\n")
    mif_file.write("-- refer to the applicable agreement for further details, at\n")
    mif_file.write("-- https://fpgasoftware.intel.com/eula.\n")
    mif_file.write("\n")
    mif_file.write("-- Quartus Prime generated Memory Initialization File (.mif)\n")
    mif_file.write("\n")
    mif_file.write("WIDTH=32;\n")
    mif_file.write("DEPTH=32692;\n")
    mif_file.write("\n")
    mif_file.write("ADDRESS_RADIX=UNS;\n")
    mif_file.write("DATA_RADIX=UNS;\n")
    mif_file.write("\n")
    mif_file.write("CONTENT BEGIN\n")

    entrada = entrada.upper()
    i = 0
    # Escribir los valores de la entrada en el archivo .mif
    for j in range(862):
        try:
            letter = entrada[j]
            # Convertir el caracter a decimal. 0 para la " ", 20 para la "A", 40 para la "B", etc.
            if letter == " ":
                letter = "0"
            elif letter == ".":
                letter = "540"
            elif letter == ",":
                letter = "560"
            else:
                letter = format(ord(letter) - 64, '05b')
            mif_file.write(f"    {i} : {int(letter,2)*20};\n")
            i += 1
        except:
            mif_file.write(f"    {i} : {0};\n")
            i += 1
    
    # Escribir letters_mem en el archivo .mif
    for j in range(len(letters_mem)):
        mif_file.write(f"    {i} : {letters_mem[j]};\n")
        i += 1

    # Escribir el espacio de memoria para el resultado 250x125, todos los valores en 1
    for j in range(31250):
        if(arr[j] == 255):
            arr[j] = 1
        mif_file.write(f"    {i} : 1;\n")
        i += 1

    mif_file.write("END;\n")