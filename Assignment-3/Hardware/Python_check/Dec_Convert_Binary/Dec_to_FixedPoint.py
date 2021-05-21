def decToBinConversion(no, precision): 
    binary = ""  
    IntegralPart = abs(int(no))  
    fractionalPart = abs(no)- IntegralPart
    binary = f'{IntegralPart:015b}'
    binary = str(binary)
    #to convert an integral part to binary equivalent
    # while (IntegralPart):
    #     re = IntegralPart % 2 
    #     binary += str(re)  
    #     IntegralPart //= 2
    # binary = binary[ : : -1]    
    #to convert an fractional part to binary equivalent
    if(no < 0) :
        binary = '1' + binary
    else : 
        binary = '0' + binary
    #binary += '.'
    while (precision):
        fractionalPart *= 2
        bit = int(fractionalPart)
        if (bit == 1) :   
            fractionalPart -= bit  
            binary += '1'
        else : 
            binary += '0'
        precision -= 1
    return binary  