from decToFP import decToFP
import numpy as np
import cv2
#parameter
h = 10
w = 10

#################### File Write Floating Point
filE = open('RGBFP.txt', 'w+')
#################### Image read to write 
img = cv2.imread('color-shapes.png')
#################### Resize Image
img = cv2.resize(img, (h, w))
cv2.imwrite('z.png',img)

for i in range (h):
    for j in range (w):
        t = decToFP(img[i][j][0])+decToFP(img[i][j][1])+decToFP(img[i][j][2])+'\n'
        # for y in range(3):
        #     t = decToFP(img[i][j][y])
        filE.write(t)

print('Complete Convert RAW Image to Floating Point!')

filE.close()
# cv2.imshow('z', img)
cv2.waitKey()


###########################################################################################
###########################################################################################
