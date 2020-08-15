#!/bin/sh

"""
Description:
    Generate cudnn installation shell commands via python3 for Linux

Author:
    Zhuo Zhang (imzhuo@foxmail.com)
    2020.08.15 19:00:00 (Asia/Shanghai Time)

Usage:
    Step1: Install cuda first
    Step2: Prepare extracted cudnn (usually named as `cuda` folder)
    Step3: Specify cudnn extract directory and cuda install directory in `__main__` part in this file
    Step4: run `python install-cudnn.py > install-cudnn.sh 2>&1`
    Step5: cat install-cudnn.sh to check if they are correct
    Step6: run that script: `bash ./install-cudnn.sh`

Note:
    You may download cudnn, cuda from my BaiduYun, for academic purpose only!
    link: https://pan.baidu.com/s/1fVE8ekxVMhi5kTtzOapOyw  code: c6ne
"""


import os
import shutil


class CudnnInstaller(object):
    def __init__(self, CUDNN_EXTRACT_DIR, CUDA_INSTALL_DIR):
        """
        CUDNN_EXTRACT_DIR='cuda', CUDA_INSTALL_DIR='/usr/local/cuda-11.0')
        """
        self.CUDNN_EXTRACT_DIR=CUDNN_EXTRACT_DIR
        self.CUDA_INSTALL_DIR=CUDA_INSTALL_DIR


    def get_install_commands(self):
        cmd_lst1 = self.copy_header_files()
        cmd_lst2 = self.copy_library_files()
        cmd_lst = cmd_lst1 + cmd_lst2
        return cmd_lst


    def copy_header_files(self):
        src_include_dir = os.path.join(self.CUDNN_EXTRACT_DIR, 'include')
        dst_include_dir = os.path.join(self.CUDA_INSTALL_DIR, 'include')
        cmd_lst = []
        for item in os.listdir(src_include_dir):
            src_pth = os.path.join(src_include_dir, item)
            dst_pth = os.path.join(dst_include_dir, item)
            cmd_lst.append('sudo cp {:s} {:s}'.format(src_pth, dst_pth))
        return cmd_lst


    def copy_library_files(self):
        src_lib_dir = os.path.join(self.CUDNN_EXTRACT_DIR, 'lib64')
        dst_lib_dir = os.path.join(self.CUDA_INSTALL_DIR, 'lib64')
        cmd_lst = []

        g_version_major = None
        g_version_whole = None
        valid = True
        shared_libs = []

        for item in os.listdir(src_lib_dir):
            if item.endswith('_static.a'):
                src_pth = os.path.join(src_lib_dir, item)
                dst_pth = os.path.join(dst_lib_dir, item)
                cmd_lst.append('sudo cp {:s} {:s}'.format(src_pth, dst_pth))
            elif '.so' in item:
                stuffs = item.split('.')
                head = stuffs[0]

                if(len(stuffs)==2):
                    shared_libs.append(item)

                elif(len(stuffs)==3):
                    version_major = stuffs[2]
                    if(g_version_major is None):
                        g_version_major = version_major
                    elif version_major!=version_major:
                        valid = False
                        print('Error! version major not valid...')
                        break

                elif(len(stuffs)==5):
                    version_whole = '.'.join(stuffs[2:])
                    if (g_version_whole is None):
                        g_version_whole = version_whole
                    elif (version_whole!=version_whole):
                        valid = False
                        print('Error! version whole not valid...')
                        break

        if(valid is False):
            return []

        #print('g_version_whole is', g_version_whole)
        #print('g_version_major is', g_version_major)

        for lib_name in shared_libs:
            src_lib_pth = os.path.join(src_lib_dir, lib_name)
            dst_lib_pth = os.path.join(dst_lib_dir, lib_name)
            cmd = 'sudo cp {:s} {:s}'.format(src_lib_pth, dst_lib_pth)
            cmd_lst.append(cmd)

            cmd = 'sudo ln -sf {:s}/{:s}.{:s} {:s}/{:s}.{:s}'.format(
                dst_lib_dir, lib_name, g_version_whole,
                dst_lib_dir, lib_name, g_version_major
            )
            cmd_lst.append(cmd)

            cmd = 'sudo ln -sf {:s}/{:s}.{:s} {:s}/{:s}'.format(
                dst_lib_dir, lib_name, g_version_major,
                dst_lib_dir, lib_name
            )
            cmd_lst.append(cmd)

        return cmd_lst


if __name__ == '__main__':

    CUDNN_EXTRACT_DIR='cuda'
    CUDA_INSTALL_DIR='/usr/local/cuda-11.0'

    inst = CudnnInstaller(CUDNN_EXTRACT_DIR, CUDA_INSTALL_DIR)
    cmd_lst = inst.get_install_commands()

    print('#!/bin/sh')
    print('set -e')
    print('set -x')
    for cmd in cmd_lst:
        print(cmd)
