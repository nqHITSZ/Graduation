import numpy as np
import cv2 as cv
import matplotlib.pyplot as plt
from PIL import Image

img = cv.imread("im2.png",cv.IMREAD_GRAYSCALE)
row,col = img.shape

data = ""
data += "COL=%d\n" % col
data += "ROW=%d\n" % row

for i in range(row):
    for j in range (col):
        data += "%3d " % img[i,j]
    data += "\n"
    
with open("dist.txt","w") as f:
    f.write(data)
