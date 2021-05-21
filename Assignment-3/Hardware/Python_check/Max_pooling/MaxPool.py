import numpy as np
import cv2


def maxpool(X, size = (2, 2)):
    
    s = 2;
    w = int(size[0])
    h = int(size[1])

    (w1, h1) = X.shape
    w2 = (w1 - w)//s + 1
    h2 = (h1 - h)//s + 1
    Y = np.zeros((w2, h2), dtype=np.uint8)
    for i in range(w2):
        for j in range(h2):
            idw = i*w
            idh = j*h
            Y[i, j] = np.uint8(np.max(X[idw:(idw+w), idh:(idh+h)]))
    return np.uint8(Y)
