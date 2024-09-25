'''
types of instructions:
    - CPI: load word immediate
    - CP: load word 
    - GP: store word
    - SM: add
    - SMI: add immediate
    - RS: substraction
    - ML: multiplication
    - ORR: or
    - CMM: branch less than
    - CME: branch less than or equal
    - CDI: shift right
    - DML: find letter
    - COM: compare
    - NP: no operation
    - VCP: cargar vector
    - VGP: guardar vector
    - VSM: Suma vectorial
    - VML: Multiplicacion vectorial
    - VCD: Shift rows by N bytes
    - VSL: subBytes
    - VRW: RotWord
    - VXO: XOR vector
    - VMC: mix columns

opcodes:
    - 00000: CPI
    - 00001: GP
    - 00010: SM
    - 00011: SMI
    - 00100: RS
    - 00101: ML
    - 00110: ORR
    - 00111: CMM
    - 01000: CME
    - 01001: CDI
    - 01010: DLM
    - 01011: COM
    - 01100: NP
    - 01101: CP
    - 01110: DMR
    - 01111: DME
    - 10000: VCP
    - 10001: VGP
    - 10010: VSM
    - 10011: VML
    - 10100: VCD
    - 10101: VSL
    - 10110: VRW
    - 10111: VXO
    - 11000: VMC


registers 6 bits:
    - 000000: z0
    - 000001: zp
    - 000010: za
    - 000011: z1
    - 000100: z2
    - 000101: z3
    - 000110: z4
    - 000111: z5
    - 001000: z6
    - 001001: z7
    - 001010: z8
    - 001011: z9
    - 001100: z10
    - 001101: z11
    - 001110: z12
    - 001111: z13
    - 010000: z14
    - 010001: z15
    - 010010: z16
    - 010011: z17
    - 010100: z18
    - 010101: z19
    - 010110: z20
    - 010111: z21
    - 011000: z22
    - 011001: vs
    - 011010: vlk
    - 011011: vak
    - 011100: vmc
    - 011101: v1
    - 011110: v2
    - 011111: v3
    - 100000: v4
    - 100001: v5
    - 100010: v6
    - 100011: v7
    - 100100: v8
    - 100101: v9    
    - 100110: v10
'''

# Diccionario de registros
registers = {
    'z0': '000000',
    'zp': '000001',
    'za': '000010',
    'z1': '000011',
    'z2': '000100',
    'z3': '000101',
    'z4': '000110',
    'z5': '000111',
    'z6': '001000',
    'z7': '001001',
    'z8': '001010',
    'z9': '001011',
    'z10': '001100',
    'z11': '001101',
    'z12': '001110',
    'z13': '001111',
    'z14': '010000',
    'z15': '010001',
    'z16': '010010',
    'z17': '010011',
    'z18': '010100',
    'z19': '010101',
    'z20': '010110',
    'z21': '010111',
    'z22': '011000',
    'vs': '011001',
    'vlk': '011010',
    'vak': '011011',
    'vmc': '011100',
    'v1': '011101',
    'v2': '011110',
    'v3': '011111',
    'v4': '100000',
    'v5': '100001',
    'v6': '100010',
    'v7': '100011',
    'v8': '100100',
    'v9': '100101',
    'v10': '100110'
}

# Diccionario de instrucciones
instructions = {
    'CPI': '00000',
    'GP': '00001',
    'SM': '00010',
    'SMI': '00011',
    'RS': '00100',
    'ML': '00101',
    'ORR': '00110',
    'CMM': '00111',
    'CME': '01000',
    'CDI': '01001',
    'DML': '01010',
    'COM': '01011',
    'NP': '01100',
    'CP': '01101',
    'DMR': '01110',
    'DME': '01111',
    'VCP': '10000',
    'VGP': '10001',
    'VSM': '10010',
    'VML': '10011',
    'VCD': '10100',
    'VSL': '10101',
    'VRW': '10110',
    'VXO': '10111',
    'VMC': '11000'
}

labels = dict()
# Leer el archivo y limpia los saltos de linea
def read_txt(path):
    with open(path, "r") as file:
        rawInstrc = [line.rstrip('\n').replace(',', '') for line in file]
    return rawInstrc

# revisa si existe el registro en el diccionario
def translateReg(reg):
    if reg not in registers:
        print(f"Error: {reg} no es un registo valido")
        exit()
    else:
        return registers[reg]

# revisa si existe la instruccion en el diccionario
def translateLabel(strLabel):
    if strLabel not in labels:
        print(f"Error: {strLabel} no es un label valido")
        exit()
    else:
        return labels[strLabel]

# revisa si existe el label en el diccionario
def checkImmLabel(strImm, lineCounter):
    cleanLabel = strImm.replace(':', '')
    exists = labels.get(cleanLabel)
    if not exists:
        # por que es 15 bits?
        labels[cleanLabel] = int(lineCounter)
    else:
        print("label ya existe")

# funcion que tome un int y lo pase a binario incluyendo negativos con complemento a 2 REVISAR
def intToBin(num):
    if num < 0:
        num = num & 0b111111111111 
    return splitImm(format(num, '012b'))

# funcion que divida el imm de 12 bits en 2 partes de 6 bits y 6 bits
def splitImm(imm):
    return imm[:6], imm[6:]

# compila la linea de instruccion
def compileLine(line):
    instrc = line.rsplit(' ')
    binInstrc = 0 # instruccion en binario 32 bits

    # tipo immediate 
    if instrc[0] == 'CPI':
        regDes = translateReg(instrc[1])
        rs1 = translateReg('z0')
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[2])) 
        print('immm7', imm7)
        print('immm6', imm6)
        func3 = '111' # suma
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        print('CPI', binInstrc)
        return binInstrc
    # tipo S 
    elif instrc[0] == 'GP':
        rs1 = translateReg(instrc[1])
        rs2 = translateReg(instrc[2])
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111' # suma
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + rs2 + rs1 + imm6 + opcode
        return binInstrc
    # tipo R 
    elif instrc[0] == 'SM':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '111' # definir que hacer
        func6 = '000000' # definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # tipo I 
    elif instrc[0] == 'SMI':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111' # suma
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # tipo R 
    elif instrc[0] == 'RS':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '001'
        func6 = '000000'
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # tipo R 
    elif instrc[0] == 'ML':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '010'
        func6 = '000000'
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # tipo R 
    elif instrc[0] == 'ORR':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '011'
        func6 = '000000'
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # tipo SB 
    elif instrc[0] == 'CMM':
        rs1 = translateReg(instrc[1])
        rs2 = translateReg(instrc[2])
        func3 = '101'
        imm7, imm6 =  splitImm(format(int(translateLabel(instrc[3])), '013b'))
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + rs2 + rs1 + imm6 + opcode
        return binInstrc
    # tipo SB 
    elif instrc[0] == 'CME':
        rs1 = translateReg(instrc[1])
        rs2 = translateReg(instrc[2])
        func3 = '110'
        imm7, imm6 =  splitImm(format(int(translateLabel(instrc[3])), '013b'))
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + rs2 + rs1 + imm6 + opcode
        return binInstrc
    # tipo I 
    elif instrc[0] == 'CDI':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '100' # shift
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # Tipo R 
    elif instrc[0] == 'DML':
        regDes = translateReg(instrc[1])
        rs = translateReg(instrc[2])
        # 862 es la direccion de memoria inicial para los vertices de las letras
        imm7, imm6 =  intToBin(int(862)) 
        func3 = "111"
        opcode = instructions['SMI']
        binInstrc = imm7 + func3 + imm6 + rs + regDes + opcode
        return binInstrc
    # tipo I 
    elif instrc[0] == 'CP':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111' # suma
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # tipo R 
    elif instrc[0] == 'COM':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '000'
        func6 = '000000'
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # tipo I 
    elif instrc[0] == 'NP':
        regDes = translateReg('z0')
        rs1 = translateReg('z0')
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 = splitImm(format(int(0), '013b'))
        func3 = '111' # suma
        opcode = instructions['SMI']
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # tipo R 
    elif instrc[0] == 'DMR':
        regDes = translateReg(instrc[1])
        rs = translateReg(instrc[2])
        # 862 es la direccion de memoria inicial para los vertices de las letras
        imm7, imm6 =  intToBin(int(1442)) 
        func3 = "111"
        opcode = instructions['SMI']
        binInstrc = imm7 + func3 + imm6 + rs + regDes + opcode
        return binInstrc
    # tipo R 
    elif instrc[0] == 'DME':
        regDes = translateReg(instrc[1])
        rs = translateReg(instrc[2])
        # 0 es la direccion de memoria inicial para los vertices de las letras
        imm7, imm6 =  intToBin(int(0)) 
        func3 = "111"
        opcode = instructions['SMI']
        binInstrc = imm7 + func3 + imm6 + rs + regDes + opcode
        return binInstrc
    # cargar vector tipo I 
    elif instrc[0] == 'VCP':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111' # TODO: definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # guardar vector tipo S 
    elif instrc[0] == 'VGP':
        rs1 = translateReg(instrc[1])
        rs2 = translateReg(instrc[2])
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111' # TODO: definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + rs2 + rs1 + imm6 + opcode
        return binInstrc
    # suma vectorial tipo R 
    elif instrc[0] == 'VSM':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '111' # TODO: definir que hacer
        func6 = '000000' # TODO: definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # multiplicacion vectorial tipo R 
    elif instrc[0] == 'VML':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '111' # TODO: definir que hacer
        func6 = '000000' # TODO: definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # shift rows by N bytes tipo I 
    elif instrc[0] == 'VCD':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111' # TODO: definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # subBytes tipo I 
    elif instrc[0] == 'VSL':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111'
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # RotWord tipo I 
    elif instrc[0] == 'VRW':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        # instrc[3] es un numero entero a binario pero limitando a 13 bits
        imm7, imm6 =  intToBin(int(instrc[3])) 
        func3 = '111'
        opcode = instructions[instrc[0]]
        binInstrc = imm7 + func3 + imm6 + rs1 + regDes + opcode
        return binInstrc
    # XOR vector tipo R 
    elif instrc[0] == 'VXO':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '111' # TODO: definir que hacer
        func6 = '000000' # TODO: definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    # mix columns tipo R 
    elif instrc[0] == 'VMC':
        regDes = translateReg(instrc[1])
        rs1 = translateReg(instrc[2])
        rs2 = translateReg(instrc[3])
        func3 = '111' # TODO: definir que hacer
        func6 = '000000' # TODO: definir que hacer
        opcode = instructions[instrc[0]]
        binInstrc = func6 + func3 + rs2 + rs1 + regDes + opcode
        return binInstrc
    else:
        print(f"Error: {instrc[0]} no es una instruccion valida")
        exit()


def mainCompileR():
    lineCounter = 0
    rawTxt = read_txt("instrucciones.txt") 
    #rawTxt = read_txt("algoritmoAES.txt") 

    # Loop para identificar labels
    for line in rawTxt:
        instrc = line.rsplit(' ')
        if len(instrc) == 1 and instrc[0] != 'NP':
            checkImmLabel(line, lineCounter + 1)
            lineCounter = lineCounter - 1
        lineCounter = lineCounter + 1

    # Loop para compilar instrucciones 
    instructionsList = []
    for line in rawTxt:
        binLine = compileLine(line)
        if binLine != None:
            instructionsList.append(binLine)
    return instructionsList

# quitar el adder
# label tienen direcciones especificas
#  