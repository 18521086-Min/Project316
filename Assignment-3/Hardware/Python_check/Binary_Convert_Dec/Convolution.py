import numpy as np
import cv2
#Tính tích chập 2 chiều.
def convolution(X, F, s = 1, p = 1):

    (w1, h1) = X.shape
    f = F.shape[0]
    w2 = ((w1 + 2*p - f)//s + 1)*s
    h2 = ((h1 + 2*p - f)//s + 1)*s
    Y = np.zeros((w2, h2), dtype=np.uint8)
    X_pad = np.pad(X, pad_width = p, mode = 'constant', constant_values = 0)
    for i in range(0,w2,s):
        for j in range(0,h2,s):
            Y[i, j] = np.abs(np.sum(X_pad[i:(i+f), j:(j+f)]*F))
    return np.uint8(Y)
#########################################################################
