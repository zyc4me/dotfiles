# coding: utf-8

import subprocess
import sys

def find_duplicated_items(lst):
    seen = {}
    dupes = []

    for item in lst:
        if item not in seen:
            seen[item] = 1
        else:
            if seen[item] == 1:
                dupes.append(item)
            seen[item] += 1

    return dupes


def check_duplicated_symbols(static_lib_files, demangle = False):
    """
    @description: detect and report duplicated global symbols in one or several static library files
    Currently only support Linux.

    @param static_lib_files: single static file path
                             or multiple static file paths, separated with >=1 spaces

    @param demangle: if true, will be parsed with c++filt
    """
    cmd = "nm {:s} | grep -P '^[^\\s]+ T ' | cut -d' ' -f3 | sort".format(static_lib_files)
    if (demangle):
        cmd += ' | c++filt'
    #print("running command is: {:s}".format(cmd))
    process = subprocess.Popen(cmd,
                                shell=True,
                                stdout=subprocess.PIPE,
                            )
    output = process.communicate()[0].decode('utf-8')
    global_symbols = output.strip().split('\n')
    #print(global_symbols)
    duplicated_global_symbols = find_duplicated_items(global_symbols)
    print(duplicated_global_symbols)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: " + sys.argv[0] + " static_lib_path")
        print("Or: " + sys.argv[0] + " space-separated-static_lib_paths")
        sys.exit(-1)

    static_lib_paths = ' '.join(sys.argv[1:])
    check_duplicated_symbols(static_lib_paths, True)