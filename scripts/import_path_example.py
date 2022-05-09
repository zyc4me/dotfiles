#!/usr/bin/env python
#coding: utf-8

"""
root
  common
    __init__.py
    mytest.py
  HelloCNN1
    test_cnn1.py
  HelloCNN2
    test_cnn2.py


由于 mytest.py 同时被 test_cnn1.py 和 test_cnn2.py 需要，
并且执行测试时， 既要支持在 HelloCNNX 目录下执行， 也要支持在根目录下执行。

使用如下写法可以解决（如果还不行，考虑把当前文件所在目录改成绝对路径）
"""

import sys, os

sys.path.insert(0,
    os.path.join(
        os.path.dirname(__file__), # 当前文件所在目录（不是绝对路径）
        '..' # 上级目录
    )
)

from common.mytest import MyTestRunner
