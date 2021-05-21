# chuyen tu anh sang dang nhi phan de dua vao convolution
import cv2
import numpy as np
import random
from Dec_to_FixedPoint  import decToBinConversion

#read img
# img = cv2.imread("F:/Chuyen_De_Vi_Mach_1/Convolution/Image/img1.png",0)
img = cv2.imread("/home/min/Desktop/Convolution/Image/janna.png",0)
w , h = img.shape

# create img_padding
img_padding = np.zeros((w+2,h+2), dtype = np.uint8)
img_padding[1:w+1,1:h+1] = img[:,:]

a = np.array([[0,0,0,0,0],
            [0,1,2,3,0],
            [0,4,5,6,0],
            [0,7,8,9,0],
            [0,0,0,0,0]])

kernel_z = np.array([[1,2,1],
                    [2,-4,2],
                    [-1,-2,-1]])

wa,ha = a.shape
print(img.shape)

img_value_dec = open("/home/min/Desktop/Convolution/Python/Decimal_Value/img_value_dec_mp_no_padding.txt", 'w+')

for i in range(w) :
    for j in range(h):
        img_value_dec.write(str(img[i,j])+'\n')

img_value_dec.close()
img_value_dec = open("/home/min/Desktop/Convolution/Python/Decimal_Value/img_value_dec_mp_no_padding.txt", 'r')
img_value_dec_list = img_value_dec.readlines()

img_value_fixed_lb = open("/home/min/Desktop/Convolution/Python/input/img_value_fixed_mp_no_padding.txt", 'w+')

kernel_fixed = open("/home/min/Desktop/Convolution/Python/input/kernel_fixed.txt", 'w+')

for i in range((w)*(h)):
    img_value_fixed_lb.write(decToBinConversion(float(img_value_dec_list[i]),16)+'\n')

img_value_fixed_lb.close()

for i in range (3):
    for j in range(3):
        kernel_fixed.write(decToBinConversion(float(kernel_z[i,j]),16)+'\n')
kernel_fixed.close()



cv2.imshow("img_gray",img)
cv2.imshow("img_padding",img_padding)
cv2.waitKey(0)
cv2.destroyAllWindows()