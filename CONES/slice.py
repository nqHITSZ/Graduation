import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import cv2 as cv



img = cv.imread("imR_gray.bmp",cv.IMREAD_GRAYSCALE)
col,row = img.shape



plt.figure()
plt.imshow(img,cmap='Greys_r')

row_start = 50
col_start = 150
img_slice = img[row_start:row_start+100,col_start:col_start+120]
plt.figure()
plt.imshow(img_slice,cmap='Greys_r')

cv.imwrite('slice.bmp',img_slice)
