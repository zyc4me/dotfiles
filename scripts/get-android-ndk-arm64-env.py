#!/usr/bin/env python

"""
用来打印 android ndk 中的二进制工具如 C++ 编译器， addr2line 等命令的绝对路径。 支持 Windows， Linux, macOSX.
默认用 arm64 架构， api=27.

用户只需提供 android ndk 路径即可。在 ndk-r21b 上测试 OK。
"""

import os
import platform


def make_command_full_paths(android_ndk_dir):
    cmd_names = [
        'addr2line',
        'ar',
        'as',
        'c++filt',
        'dwp',
        'elfedit',
        'gprof',
        'ld',
        'ld.bfd',
        'ld.gold',
        'nm',
        'objcopy',
        'objdump',
        'ranlib',
        'readelf',
        'size',
        'strings',
        'strip'
    ]

    if (platform.system() == 'Windows'):
        system = 'windows-x86_64'
    elif (platform.system() == 'Linux'):
        system = 'linux-x86_64'
    elif (platform.system() == 'Darwin'):
        system = 'darwin-x86_64'
    else:
        print('!! Error, not supported platform')
        return

    cmd_dir = android_ndk_dir + "/toolchains/aarch64-linux-android-4.9/prebuilt/{:s}/bin/".format(system)
    final_commands = []
    for cmd in cmd_names:
        fullpath = cmd_dir + 'aarch64-linux-android-' + cmd
        upper_cmd = cmd.upper()
        if (cmd == 'c++filt'):
            upper_cmd = 'CXXFILT'
        if (cmd == 'ld.bfd'):
            upper_cmd = 'LD_BFD'
        if (cmd == 'ld.gold'):
            upper_cmd = 'LD_GOLD'
        export_name = "NDK_" + upper_cmd
        full_cmd = export_name + "=" + fullpath
        final_commands.append(full_cmd)

    # manually add C/C++ compiler stuffs
    NDK_TARGET='aarch64-none-linux-android24'
    NDK_CC = '{:s}/toolchains/llvm/prebuilt/{:s}/bin/aarch64-linux-android27-clang'.format(android_ndk_dir, system, NDK_TARGET)
    NDK_CXX = '{:s}/toolchains/llvm/prebuilt/{:s}/bin/aarch64-linux-android27-clang++'.format(android_ndk_dir, system, NDK_TARGET)
    final_commands.append('NDK_TARGET={:s}'.format(NDK_TARGET))
    final_commands.append('NDK_CC={:s}'.format(NDK_CC))
    final_commands.append('NDK_CXX={:s}'.format(NDK_CXX))
    for command in final_commands:
        print(command)

    print("\nNote: $NDK_CXX --target=$NDK_TARGET xx.cpp")

if __name__ == '__main__':
    android_ndk_dir = os.getenv('ANDROID_NDK')
    if (android_ndk_dir is None):
        android_ndk_dir = "/home/zz/soft/android-ndk-r21e"
    make_command_full_paths(android_ndk_dir)


