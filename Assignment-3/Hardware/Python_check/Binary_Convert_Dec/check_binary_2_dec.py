# check sai so
def mul(a, b):
    return (a*b)

def fixedPoint2Dec(x):
    S = 0
    for i in range(31):
        S += int(x[i+1])*(2**(14-i))

    if (x[0]=='1'):
        return -S
    else:
        return S

# input = open('value_in_fixed.txt', 'r')
# output = open('value_out_fixed.txt', 'r')

input = open('F:/Chuyen_De_Vi_Mach_1/Convolution/Python/input/value_in_fixed.txt', 'r')
output = open('F:/Chuyen_De_Vi_Mach_1/Convolution/Python/output/value_out_fixed.txt', 'r')

I = input.read().splitlines()
O = output.read().splitlines()

for i in range(len(I)):
    I[i] = fixedPoint2Dec(I[i])

S = 0
M = 0
Mi = 0
m = 1000000000000000000000000000000
mi = 0


print("\tHDL",'\t\t',"RAW",'\t\t\t',"ERROR")
for i in range (len(O)):
    p = i*2

    RAW = mul(I[p], I[p+1])
    HDL = fixedPoint2Dec(O[i])
    print(round(HDL,6), '\t|   ', round(RAW,6),'  \t|  ',round(abs(HDL-RAW),10))
    S += abs(HDL-RAW)/abs(RAW)

    
    M = max(M, abs(HDL-RAW))
    m = min(m, abs(HDL-RAW))

print('Test voi mau ', len(O), ' gia tri.')
print('Ti le sai so: ', S/(len(O)))
print('Sai so lon nhat: ', M)
print('Si so nho nhat: ', m)

