import compiler

# ejecutar mainCompiler
instructionList = compiler.mainCompileR()
for instrc in instructionList:
    print(instrc)

# Abre el archivo .mif para escritura
with open("imem.mif", "w") as mif_file:
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
    mif_file.write("DEPTH=10000;\n")
    mif_file.write("\n")
    mif_file.write("ADDRESS_RADIX=UNS;\n")
    mif_file.write("DATA_RADIX=UNS;\n")
    mif_file.write("\n")
    mif_file.write("CONTENT BEGIN\n")

    # Escribir los valores de los píxeles en el archivo .mif
    for i, singleInstrc in enumerate(instructionList):
        mif_file.write(f"    {i} : {int(singleInstrc,2)};\n")

    mif_file.write("END;\n")
