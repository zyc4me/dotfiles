# coding: utf-8

"""
Description:
    Read / Write image whose path contains Chinese on Windows with Python3

Author:
    Zhuo Zhang(imzhuo@foxmail.com)
    2020-08-17 09:19:18
"""

import os
import cv2
import numpy as np

class zcv(object):
    @staticmethod
    def imwrite(im_save_pth, im):
        """
        OpenCV with Python3 on Windows, fails to save/read image if paths contain Chinese
        Thus we have to use imencode instead of cv2.imwrite()
        """
        ext = '.' + im_save_pth.split('.')[-1]
        cv2.imencode(ext, im)[1].tofile(im_save_pth)

    @staticmethod
    def imread(im_pth, flag=1):
        """
        OpenCV with Python3 on Windows, fails to save/read image if paths contain Chinese
        Thus we have to use imdecode instead of cv2.imread()
        """
        im = cv2.imdecode(np.fromfile(im_pth, dtype=np.uint8), flag)
        return im

if __name__ == '__main__':
    im_pth = 'E:/中文/目录/123测试.jpg'
    im = zcv.imread(im_pth)
    cv2.imshow("image", im)
    cv2.waitKey(0)

    save_pth = "C:/测试123.jpg"
    cv2.imwrite(save_pth, im)
