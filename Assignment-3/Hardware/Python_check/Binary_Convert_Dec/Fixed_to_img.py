## kiem tra so sanh voi convolution HDL va Python
import cv2
import numpy as np
from Convolution import convolution

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

img = cv2.imread("/home/min/Desktop/Convolution/Image/janna.png",0)
w,h = img.shape

kernel_z = np.array([[1,2,1],
                    [2,-4,2],
                    [-1,-2,-1]])

input = open("/home/min/Desktop/Convolution/Python/output/img_value_out_fixed_cv_lb.txt", 'r')

img_conv_hdl=np.zeros((w,h), dtype=np.uint8)

img_conv_py=np.zeros((w,h), dtype=np.uint8)

I = input.read().splitlines()

img_conv_py = convolution(img,kernel_z)

counter = 0
for i in range(300):
    for j in range(300):
        img_conv_hdl[i,j] = np.uint8(abs(fixedPoint2Dec(I[counter+3])))
        counter += 1

check_error = open("/home/min/Desktop/Convolution/Python/check_error.txt", 'w+')
for i in range(300):
    for j in range (300):
        check_error.write(str(img_conv_hdl[i,j])+'\t\t'+str(img_conv_py[i,j])+'\t\t'+str(abs(img_conv_py[i,j]-img_conv_hdl[i,j]))+'\n')



check_error.close()


cv2.imshow("img_gray",img)
cv2.imshow("img_conv_hdl",img_conv_hdl)
cv2.imshow("img_conv_py",img_conv_py)
cv2.waitKey(0)
cv2.destroyAllWindows()

