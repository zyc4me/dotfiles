#!/usr/bin/env python
#coding: utf-8

"""
Purpose:
    Android official website and github wiki page no longer gives ndk-r23 but only gives ndk-r23c.
    This script provide standalone download links for android ndk zip files.
    Those links can be verified with Android Studio's SDK manager.

https://github.com/android/ndk/wiki
"""

def get_ndk_url(os_name, ndk_version):
    valid_os_names = ['linux', 'windows', 'darwin']
    if os_name not in valid_os_names:
        raise AssertionError("os_name invalid! Should be one of: ", valid_os_names)

    if (ndk_version[0] != 'r'):
        raise AssertionError("ndk_version should starts with 'r'")

    # url = 'https://dl.google.com/android/repository/android-ndk-r23-linux.zip'
    url = 'https://dl.google.com/android/repository/android-ndk-{}-{}.zip'.format(ndk_version, os_name)
    print(url)

if __name__ == '__main__':
    url = get_ndk_url('linux', 'r23')
