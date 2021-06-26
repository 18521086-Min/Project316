from convertRGB_to_HSV import convert
import cv2 
img = cv2.imread('flower.jpg')

f = open('FlowerHSV_Bin.txt','w+')
f1 = open('FlowerHSV_DEC.txt','w+')
f2 = open('FlowerRGB_DEC.txt','w+')
img =  cv2.resize(img,(100,100))

h,w,c = img.shape
print('h={},w={}'.format(h,w))
for i in range(100):
    for j in range(100):
        H,S,V = convert(img[i][j][2],img[i][j][1],img[i][j][0])
        #pixel = '{0:09b}'.format(H) + '{0:07b}'.format(S) + '{0:07b}'.format(V)+'\n'

        f.write('{0:09b}'.format(H) + '{0:07b}'.format(S) + '{0:07b}'.format(V)+'\n')
        f1.write(str(H)+' '+ str(S)+' '+ str(V)+'\n')
        f2.write(str(img[i][j][2])+' '+ str(img[i][j][1])+' '+ str(img[i][j][0])+'\n')
f.close()
f1.close()
f2.close()

cv2.imwrite('Flower1.jpg',img)
cv2.imshow(" ",img)
cv2.waitKey(0)


