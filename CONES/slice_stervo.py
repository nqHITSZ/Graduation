import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import cv2 as cv


iml = cv.imread("./cones/im2.png",cv.IMREAD_GRAYSCALE)
imr = cv.imread("./cones/im6.png",cv.IMREAD_GRAYSCALE)

row_start = 50
col_start = 50
row = 100
col = 120
sl = iml[row_start:row_start+row,col_start:col_start+col]
sr = imr[row_start:row_start+row,col_start:col_start+col]


step = 25
for n in range(1,10):
    col_start = 50 + n*step
    sl = iml[row_start:row_start+100,col_start:col_start+120]
    sr = imr[row_start:row_start+100,col_start:col_start+120]
    cv.imwrite('./Slice/%dL.bmp' % n,sl)
    data = ""
    data += "COL=%d\n" % col
    data += "ROW=%d\n" % row
    for i in range(row):
        for j in range (col):
            data += "%3d " % sl[i,j]
        data += "\n"
    with open("./mem/%dL.txt" % n,"w") as f:
        f.write(data)
    
    cv.imwrite('./Slice/%dR.bmp' % n,sr)
    data = ""
    data += "COL=%d\n" % col
    data += "ROW=%d\n" % row
    for i in range(row):
        for j in range (col):
            data += "%3d " % sr[i,j]
        data += "\n"
    with open("./mem/%dR.txt" % n,"w") as f:
        f.write(data)
