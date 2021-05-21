import random
from Dec_to_FixedPoint import decToBinConversion
import math

no = -32.86
print("Fixed Point:",decToBinConversion(no,16))

#value_dec = open("F:/Chuyen_De_Vi_Mach_1/Convolution/Python/img_value_dec.txt","w+")
value_dec = open("/home/min/Desktop/Convolution/Python/Decimal_Value/img_value_dec.txt","w+")
# ghi vao file 
#value_fixed = open("F:/Chuyen_De_Vi_Mach_1/Convolution/Python/input/img_value_in_fixed_lb.txt","w")
value_fixed = open("/home/min/Desktop/Convolution/Python/input/img_value_in_fixed_lb.txt","w")


size = 100
#chuyen tu dec sang fixed
for i in range (0,size,1) :
    value_dec.write(str(random.randint(0,20))+'\n')
value_dec.close()


#value_dec = open("F:/Chuyen_De_Vi_Mach_1/Convolution/Python/img_value_dec.txt","r")
value_dec = open("/home/min/Desktop/Convolution/Python/Decimal_Value/img_value_dec.txt","r")
value_dec_list = value_dec.readlines()

for i in range(0,size,1) : 
    value_fixed.write(decToBinConversion(float(value_dec_list[i]),16)+"\n")

for i in range(int(math.sqrt(size))):
    for j in range(int(math.sqrt(size))):
        print(int(value_dec_list[i*10+j]),end='\t')
    print('\n')
value_fixed.close()
value_dec.close()