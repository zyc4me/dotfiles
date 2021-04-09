# coding: utf-8

import os

def dirlist(directory, allfile):
    """
    Scan directory recursively, save paths for all .h/.cpp files and files that without extensions
    递归扫描目录，保存所有的.h/.cpp文件的路径，以及没有后缀的文件，以列表形式返回
    """
    item_lst = os.listdir(directory)
    for item in item_lst:
        filepath = os.path.join(directory, item)
        if os.path.isdir(filepath):
            dirlist(filepath, allfile)
        else:
            tmp = item.split('.')
            if (len(tmp)==1):
                allfile.append(filepath)
            elif (item.endswith('.h') or item.endswith('.cpp')):
                allfile.append(filepath)
    return allfile


def scan_directory(directory):
    allfile = []
    dirlist(directory, allfile)
    result = '\n'.join(allfile)
    result = result.replace('\\', '/')
    print(result)


if __name__ == '__main__':
    scan_directory('eigen')