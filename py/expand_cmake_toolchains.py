#!/usr/bin/env python
#coding: utf-8

"""
这个脚本的目的是： 把 arcbuild2 中的 xx-platform.cmake 内容打印出来，并递归地替换include(文件.cmake)内容：
    - 若 xx-platform.cmake 某行是 include(yy.cmake)
    - 或 include(${CMAKE_CURRENT_LIST_DIR}/yy.cmake)
结果将输出到屏幕

也就是: generate standalone xx-platform.toolchains.cmake from hierarchical ones that with include(foo.cmake)
"""

import os
import sys

def grab_file_contents(entry_file_path, recursive = False, debug = False):
    entry_file_dir = os.path.split(entry_file_path)[0]
    fin = open(entry_file_path, "r")
    contents = []
    for line in fin.readlines():
        line = line.rstrip()
        if (recursive and (line.startswith("include(") and line.endswith(".cmake)"))):
            sub_file_name = line.split('(')[1].split(')')[0]
            sub_file_path = sub_file_name
            if (sub_file_path.startswith('${CMAKE_CURRENT_LIST_DIR}')):
                sub_file_path = sub_file_path.replace('${CMAKE_CURRENT_LIST_DIR}', entry_file_dir)
            if debug: print("sub_file_name is ", sub_file_name)
            if debug: print("sub_file_path is ", sub_file_path)
            if (os.path.isdir(sub_file_path)):
                print("Error! The included file, {:s}, is a folder, instead a file".format(sub_file_path))
            if (not os.path.exists(sub_file_path)):
                print("Error! The included file, {:s}, does not exist".format(sub_file_path))
            else:
                if debug: print("!!! ", sub_file_name)
                sub_file_contents = grab_file_contents(sub_file_path)
                # merge lists: contents, sub_file_contents
                if debug: print(">>> sub_file_contents is: ", sub_file_contents)
                contents.extend(sub_file_contents)
        else:
            if debug: print("[else] ", line)
            contents.append(line)
    fin.close()
    return contents


def _test():
    #load_dir = '/home/zz/work/test/cmake_include'
    #entry_file_path = os.path.join(load_dir, 'CMakeLists.txt') # the entry file
    entry_file_path = "/home/zz/work/git.arcsoft/arcbuild2/arcbuild/toolchains/gcc-himix400-arm.cmake"
    contents = grab_file_contents(entry_file_path, True)
    for line in contents:
        print(line)

def _test2():
    entry_file_path = "../../git.arcsoft/arcbuild2/arcbuild/toolchains/gcc-himix400-arm.cmake"
    contents = grab_file_contents(entry_file_path, True)
    for line in contents:
        print(line)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: " + sys.argv[0] + " /path/to/entry/xx-platform.toolchain.cmake")
        sys.exit(-1)

    entry_file_path = sys.argv[1]
    contents = grab_file_contents(entry_file_path, True)
    for line in contents:
        print(line)