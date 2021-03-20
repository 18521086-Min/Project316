def rgb_to_hsv(r, g, b):
    maxc = max(r, g, b)
    minc = min(r, g, b)

    v = maxc * 100 / 255

    if minc == maxc:
        return 0.0, 0.0, v

    s = (maxc-minc) / maxc * 100

    rc = (maxc-r) / (maxc-minc)
    gc = (maxc-g) / (maxc-minc)
    bc = (maxc-b) / (maxc-minc)

    if r == maxc:
        h = bc-gc
    elif g == maxc:
        h = 2.0+rc-bc
    else:
        h = 4.0+gc-rc
    h = ((h/6.0) % 1.0)*360
    return h, s, v


x = int(input('Z'))
y = int(input('z'))
z = int(input('z'))
print(rgb_to_hsv(x, y, z))