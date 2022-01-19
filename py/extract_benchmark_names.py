#!/usr/bin/env python
# coding: utf-8

"""
这个脚本的功能是：从 google benchmark 运行后保存的 .json 文件中，提取出所有 benchmark 的 name 字段
目的： 后续可从这些 name 字段中，挑选若干感兴趣的，调用 compare.py 脚本进行对比
        （compare.py 此时不需要重新运行 benchmark 程序， 是从 .json 中做提取然后比较的）
e.g.
cp -R ~/work/github/benchmark/tools/gbench ./
cp ~/work/github/benchmark/tools/compare.py ./
./compare.py filters ppl.cv-arm64.json "BM_NV2BGR_ppl" "BM_NV2BGR_opencv"
"""

import json
import sys

def extract_benchmark_names(json_file_path):
    fin = open(json_file_path)
    load_dict = json.load(fin)
    benchmark_list = load_dict['benchmarks']
    benchmark_name_lst = []
    for item in benchmark_list:
        benchmark_name_lst.append(item['name'])
    fin.close()
    return benchmark_name_lst

def _test():
    json_file_path = '/home/zz/work/github/ppl.cv/build/ppl.cv-arm64.json'
    extract_benchmark_names(json_file_path)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: " + sys.argv[0] + "/path/to/benchmark.json")
        sys.exit(-1)
    
    json_file_path = sys.argv[1]
    benchmark_name_lst = extract_benchmark_names(json_file_path)
    for name in benchmark_name_lst:
        print(name)