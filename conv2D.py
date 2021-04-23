import numpy as np
import cv2


#Tính tích chập 2 chiều.
def conv2d(X, F, s = 1, p = 0):
    """
    X: Ma trận đầu vào
    F: Ma trận bộ lọc
    s: Bước trượt
    p: Độ rộng lề thêm vào
    """
    (w1, h1) = X.shape
    f = F.shape[0]
    w2 = int((w1 + 2*p - f)/s) + 1
    h2 = int((h1 + 2*p - f)/s) + 1
    Y = np.zeros((w2, h2), dtype=np.uint8)
    X_pad = np.pad(X, pad_width = p, mode = 'constant', constant_values = 0)
    for i in range(w2):
        for j in range(h2):
            idw = i*s
            idh = j*s
            Y[i, j] = np.abs(np.sum(X_pad[idw:(idw+f), idh:(idh+f)]*F))
    return np.array(Y)

R = cv2.imread('steam.png')
X = cv2.imread('steam.png', 0)

# Nhận diện biên ngang
F1 = np.array([[1, 1, 1], [0, 0, 0], [-1, -1, -1]])
# Nhận diện biên dọc
F2 = np.array([[-1, 0, 1], [-1, 0, 1], [-1, 0, 1]])

Y1 = conv2d(X, F1, 1)
print(type(X[0][0]))
print(type(Y1[0][0]))
cv2.imshow('X', R)
cv2.imshow('Y', Y1)
cv2.waitKey()
cv2.destroyAllWindows()