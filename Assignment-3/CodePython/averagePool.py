import numpy as np
import cv2


def averagePool(X, size = (2, 2), s = (2, 2), p = 0):
    """
    X: Ma trận đầu vào
    size: Kích thước khung tìm Max
    s: Bước trượt
    p: Độ rộng lề thêm vào
    """
    w = int(size[0])
    h = int(size[1])

    (w1, h1) = X.shape
    w2 = int((w1 + 2*p - w)/s[0] + 1)
    h2 = int((h1 + 2*p - h)/s[1] + 1)
    Y = np.zeros((w2, h2), dtype=np.uint8)
    X_pad = np.pad(X, pad_width = p, mode = 'constant', constant_values = 0)
    for i in range(w2):
        for j in range(h2):
            idw = i*w
            idh = j*h
            Y[i, j] = np.uint8(np.average(X_pad[idw:(idw+w), idh:(idh+h)]))
    return np.array(Y)

R = cv2.imread('steam.png')
X = cv2.imread('steam.png', 0)

Y1 = averagePool(X, [2, 2], [2, 2], 0)
print('Raw Image:', X.shape)
print('Max Pooling Image:', Y1.shape)

cv2.imshow('X', R)
cv2.imshow('Y', Y1)

cv2.waitKey()
cv2.destroyAllWindows()
