# C++ 赋值语句中等号前后没有空格， 使用 clang-format 进行格式美化

有些 C/C++初学者， 以及风格不好的老程序员， 会用如下写法：
```cpp
int a=1;
```
好的写法应该是
```cpp
int a = 1;
```

## 格式化前
```cpp
int a=1;
```

## 默认配置的 .clang-format
格式化后:
```cpp
int a = 1;
```

## 只指定缩进为4空格的 .clang-format
.clang-format:
```yaml
IndentWidth: 4
```

格式化后：
```cpp
int a = 1;
```

## 关闭等号前的空格
.clang-format:
```yaml
SpaceBeforeAssignmentOperators: false
```

格式化后：
```cpp
int a= 1;
```

## 关闭等号后的空格？
clang-format 17 也仍然没有提供这个选项。

看起来 clang-format 开发者们认为， 正常人只可能写出这3种写法：
```cpp
int a= 1;
int a = 1;
```

而不可能写出
```cpp
int a=1;
int a =1;
```