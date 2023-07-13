# 最小化的 .clang-format 配置文件

## 目的
尝试构造内容最少的 .clang-format 文件， 并且保证内容合法， 也就是说 clang-format 不会认为“配置文件非法”。

## 环境
clang-format 14.0.4, Mac-M1 (arm64)

## 步骤
准备 .clang-format 文件。我的内容只有一行:
```yaml
IndentWidth: 5
```
解释： 为了确定格式化效果， 指定了5空格缩进。正常人不应该用5空格缩进他的c++代码。

在 vscode 里打开本目录的 main.cpp, ctrl + shift + p, 输入 format， 选择用 clang-format 格式化。

注意， 需要确保父目录没有 `.clang-format` 文件， 否则会用父目录的 `.clang-format` 里的配置， 影响实验结果。

## 结果

格式化前：
```cpp
#include<stdio.h>
int main    (){
 printf("Hello world");
 return 0;
}
```

格式化后：
```cpp
#include <stdio.h>
int main() {
     printf("Hello world");
     return 0;
}
```

## 如果用空内容的 .clang-format 文件呢？
```bash
clang-format main.cpp 
```
> Error reading /Users/zz/work/clang-format-examples/minimal_dot_clang_format/.clang-format: Invalid argument

报错提示 `Invalid argument`. 内容非法。