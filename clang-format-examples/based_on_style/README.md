# 基于已有 style 的 clang-format 配置

## 目的
这个例子很简单， 在 .clang-format 中指定 `BasedOnStyle` 选项。

合法取值：
- `BasedOnStyle: LLVM`
- `BasedOnStyle: Google`
- `BasedOnStyle: Chromium`
- `BasedOnStyle: Mozilla`
- `BasedOnStyle: WebKit`
- `BasedOnStyle: Microsoft`

## 官方例子
[LLVM 官方文档](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)给了一个例子:

```yaml
---
# We'll use defaults from the LLVM style, but with 4 columns indentation.
BasedOnStyle: LLVM
IndentWidth: 4
---
Language: Cpp
# Force pointers to the type for C++.
DerivePointerAlignment: false
PointerAlignment: Left
---
Language: JavaScript
# Use 100 columns for JS.
ColumnLimit: 100
---
Language: Proto
# Don't format .proto files.
DisableFormat: true
---
Language: CSharp
# Use 100 columns for C#.
ColumnLimit: 100
...
```

其实内容略多。

## 最小化的配置

### 原始代码
```cpp
#include<stdio.h>
int main    (){
 printf("Hello world");
 return 0;
}
```

### 最小化配置 - 基于 Microsoft Style
```cpp
BasedOnStyle: Microsoft
IndentWidth: 4
```

格式化后：
```cpp
#include <stdio.h>
int main()
{
    printf("Hello world");
    return 0;
}
```

### 最小化配置 - 基于 Chromium Style
```yaml
BasedOnStyle: Chromium
IndentWidth: 4
```

格式化后：
```cpp
#include <stdio.h>
int main() {
    printf("Hello world");
    return 0;
}
```

### 最小化配置 - 基于 Google Style
```yaml
BasedOnStyle: Google
IndentWidth: 4
```

格式化后：
```cpp
#include <stdio.h>
int main() {
    printf("Hello world");
    return 0;
}
```