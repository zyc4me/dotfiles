#!/usr/bin/env python
# coding: utf-8

# 这个脚本封装了 Linux 下的 expand 命令， 对一整个目录执行 tab替换为适当数量空格 的操作
# 参数有两个：目录名字， 是否替换（replace）
# 为了以防万一替换出错，建议原始文件加入版本控制，谨慎的使用 replace=True 参数
# 若 replace = False， 则新生成文件名字，为原文件名字后加 "_new"
# 若本来就存在 xx.yy_new 的文件， 则替换 xx.yy 为 xx.yy_new_new, 替换 xx.yy_new 为 xx.yy_new_new_new
# 总之，尽量不要搞事情。

import os
import subprocess
import sys

def get_backup_filename(folder, filename):
    existing_filenames = [item for item in os.listdir(folder)]
    new_filename = filename + "_new"
    while (new_filename in existing_filenames):
        new_filename = new_filename + "_new"
    return new_filename

def batch_expand(folder, replace=False):
    if not os.path.exists(folder):
        print("The folder {:s} does not exist. abort".format(folder))
        return
    if not os.path.isdir(folder):
        print("{:s} is not a folder".format(folder))
        return
    for item in os.listdir(folder):
        fullpath = os.path.join(folder, item)
        if (os.path.isfile(fullpath)):
            new_filename = get_backup_filename(folder, item)
            new_fullpath = os.path.join(folder, new_filename)

            cmd1 = "expand {:s} -t 4 > {:s}".format(fullpath, new_fullpath)
            process = subprocess.Popen(cmd1, shell=True, stdout=subprocess.PIPE,)
            output = process.communicate()[0].decode('utf-8')
            print(output)

            if (replace):
                cmd2 = "mv {:s} {:s}".format(new_fullpath, fullpath)
                process = subprocess.Popen(cmd2, shell=True, stdout=subprocess.PIPE,)
                output = process.communicate()[0].decode('utf-8')
                print(output)

            # print(cmd1)
            # print(cmd2)
            # cmd1 = "ls {:s}".format(fullpath)

def test():
    folder = '/home/zz/work/mobileCV2-git/src/ocl'
    batch_expand(folder, True)

if __name__ == '__main__':
    #test()
    if len(sys.argv) != 2:
        print("Usage: " + sys.argv[0] + " directory")
        print("If would replace original file, please modify source, pass replace=True")
        sys.exit(-1)

    folder = sys.argv[1:]
    batch_expand(folder)

