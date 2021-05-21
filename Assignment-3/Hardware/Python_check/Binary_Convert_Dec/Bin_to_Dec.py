from os import write


def fixedPoint2Dec(x):
    S = 0
    for i in range(31):
        S += int(x[i+1])*(2**(14-i))

    if (x[0]=='1'):
        return -S
    else:
        return S

#kiem tra hien thi gia tri xuat ra theo dang matrix
#input = open('F:/Chuyen_De_Vi_Mach_1/Convolution/Python/input/value_in_fixed.txt', 'r')
input = open('/home/min/Desktop/Convolution/Python/output/img_value_out_fixed_cv_lb.txt', 'r')
I = input.read().splitlines()

print("Chieu dai File : ",len(I)-3)

for i in range(len(I)-3):
    print("HANG ",i,'\n',int(fixedPoint2Dec(I[i+3])))
# for i in range(0,int((len(I)+1)/9),1):
#     print('Hang',i)
#     for j in range(3):
#         for k in range(3):
#             print(int(fixedPoint2Dec(I[i*9+(j*3+k)+3])),end = '\t')
#         print('\n')



#######################################
################################### Check vi tri loi line_buffer so voi python
# input = open('/home/min/Desktop/Convolution/Python/output/img_value_out_fixed_lb.txt', 'r')
# output = open('/home/min/Desktop/Convolution/Python/Decimal_Value/check_error.txt','w+')

# input1 = open('/home/min/Desktop/Convolution/Python/Decimal_Value/img_value_dec_cv2_no_lb.txt', 'r')
# output2 = open('/home/min/Desktop/Convolution/Python/Decimal_Value/local_error.txt','w+')
# I = input.read().splitlines()
# I1 = input1.read().splitlines()

# print("Chieu dai File : ",len(I))
# error = 0
# for i in range(len(I)):
#     output.write(str(int(fixedPoint2Dec(I[i])))+'\t'+I1[i]+'\n')
#     if(abs(int(fixedPoint2Dec(I[i]))-int(I1[i])) != 0) :
#         output2.write(str(i)+'\n')
#         print(i)
# print(error)
# output.close()
# output2.close()

