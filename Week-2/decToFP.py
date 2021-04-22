def decToFP(x):
    if x==0:
        return '00000000000000000000000000000000'

    signFP = ''
    leftSide = 0
    rightSide = 0
    exp = 0
    mantise = ''
    ## Xét dấu 
    if (x<0):
        signFP = '1'
    else:
        signFP = '0'

    if (x<0):
        x = -x
    else:
        x = x
    
    while(x<1 or x>2):
        if (x<1):
            x *= 2
            leftSide += 1
        else:
            x /= 2
            rightSide += 1
    
    exp = (rightSide-leftSide) + 127

    i = 0
    for i in range (24):
        if (x>=1):
            x -= 1
            mantise += '1'
        else:
            mantise += '0'
        x *= 2

    return signFP + str(format(exp, '08b')) + mantise[1:]