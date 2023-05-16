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
    return url



class CodeWriter(object):
    def __init__(self, indent_len):
        self.lines = []
        self.indent_num = 0
        self.indent_len = indent_len

    def write(self, content):
        padding = (self.indent_len * self.indent_num) * ' '
        line = padding + content
        self.lines.append(line)

    def save(self, filename):
        with open(filename, "w") as fout:
            for line in self.lines:
                fout.write(line + "\n")

    def dump(self):
        for line in self.lines:
            print(line)

    def tab(self):
        self.indent_num += 1

    def backspace(self):
        if (self.indent_num > 0):
            self.indent_num -= 1



if __name__ == '__main__':
    #url = get_ndk_url('linux', 'r23')
    os_names = ['linux', 'windows', 'darwin']
    w = CodeWriter(4)
    head = '| ndk version |'
    sepline = '| ------ |'
    for os_name in os_names:
        head += ' {:s} |'.format(os_name)
        sepline += ' ---------- |'
    w.write(head)
    w.write(sepline)
    for ndk_version in ['r17', 'r18', 'r19', 'r20', 'r21', 'r22', 'r23', 'r24', 'r25']:
        line = "| " + ndk_version + " |"
        for os_name in os_names:
            url = get_ndk_url(os_name, ndk_version)
            line += ' <' + str(url) + '> |'
        w.write(line)
    w.dump()