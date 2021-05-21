# kiem tra so sanh ket qua chay Maxpooling giua HDL va Python
import cv2
import numpy as np
from MaxPool import maxpool

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


input = open("/home/min/Desktop/Convolution/Python/output/value_fixed_max_pooling.txt", 'r')

img_conv_hdl=np.zeros((w//2,h//2), dtype=np.uint8)

img_conv_py=np.zeros((w//2,h//2), dtype=np.uint8)

I = input.read().splitlines()

img_conv_py = maxpool(img)

counter = 0
for i in range(w//2):
    for j in range(h//2):
        img_conv_hdl[i,j] = np.uint8(abs(fixedPoint2Dec(I[counter])))
        counter += 1

check_error = open("/home/min/Desktop/Convolution/Python/check_error.txt", 'w+')
for i in range(w//2):
    for j in range (h//2):
        check_error.write(str(img_conv_hdl[i,j])+'\t\t'+str(img_conv_py[i,j])+'\t\t'+str(abs(img_conv_py[i,j]-img_conv_hdl[i,j]))+'\n')
        if(abs(img_conv_py[i,j]-img_conv_hdl[i,j])!=0) : 
            print("error: ", i)



check_error.close()


cv2.imshow("img_gray",img)
cv2.imshow("img_conv_hdl",img_conv_hdl)
cv2.imshow("img_conv_py",img_conv_py)
cv2.waitKey(0)
cv2.destroyAllWindows()

