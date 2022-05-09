#!/usr/bin/env python
#coding: utf-8

import cv2
import os
from PIL import Image, ImageDraw, ImageFont
import numpy as np

def cv_to_pil(cv_img):
    pil_img = Image.fromarray(cv_img)
    return pil_img

def pil_to_cv(pil_img):
    cv_img = np.asarray(pil_img)
    return cv_img


def my_puttext(cv_img, x, y, text):
    pil_img = Image.fromarray(cv_img)
    draw = ImageDraw.Draw(pil_img)
    #font = ImageFont.truetype("helvetica", 40, encoding="utf-8")#格式，参数分别为 字体文件，文字大小，编码方式
    font = ImageFont.truetype('Helvetica.ttf', 100)#需要手动下载到当前目录
    color = (255, 255, 255)
    draw.text((x, y), text, color, font=font)#写文字，参数为文字添加位置，添加的文字字符串，文字颜色，格式
    return pil_to_cv(pil_img)

