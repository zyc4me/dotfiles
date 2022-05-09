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


def scan_directory(directory, prefix=''):
    """
    替换\\为/
    为每个文件路径增加前缀
    """
    allfile = []
    dirlist(directory, allfile)
    result = []
    for item in allfile:
        item = prefix + item
        item = item.replace('\\', '/')
        result.append(item)
    return result


def scan_directory_and_save_cmake(directory, save_file, cmake_var, prefix=''):
    result = scan_directory(directory, prefix)
    fout = open(save_file, 'w', encoding='utf-8')
    fout.write('set({:s}\n'.format(cmake_var))
    for item in result:
        fout.write(item+'\n')
    fout.write(')' + '\n')
    fout.close()

if __name__ == '__main__':
    directory = 'eigen/Eigen'
    save_file = 'eigen_list.cmake'
    cmake_var = 'eigen_srcs'
    prefix = '  ${CMAKE_CURRENT_SOURCE_DIR}/'
    scan_directory_and_save_cmake(directory, save_file, cmake_var, prefix)