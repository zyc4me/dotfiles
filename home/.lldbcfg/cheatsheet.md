# 常见 LLDB 命令

```bash
type summary list uint8x8_t
type summary delete uint8x8_t
```

## 读取所有寄存器
register read --all

## 枚举

https://lldb.llvm.org/python_api_enums.html

lldb.eValueTypeInvalid: 0

lldb.eValueTypeVariableGlobal: 1

    Global variable.

lldb.eValueTypeVariableStatic: 2

    Static variable.

lldb.eValueTypeVariableArgument: 3

    Funfction argument variable.

lldb.eValueTypeVariableLocal: 4

    Function local variable.

lldb.eValueTypeRegister: 5

    Stack frame register.

lldb.eValueTypeRegisterSet: 6

    A collection of stack frame register values.

lldb.eValueTypeConstResult: 7

    Constant result variables.

lldb.eValueTypeVariableThreadLocal: 8

    Thread local storage variable.

## 在 scripts 中获取一些变量
```python
frame = valobj.GetFrame()
target = valobj.GetTarget()
options = lldb.SBExpressionOptions()
```

类型转换：
```python
# 转为 int8_t 类型
v0 = valobj.Cast(target.FindFirstType('int8_t')).GetValueAsUnsigned()
# 转为 int8_t* 类型
v0 = valobj.Cast(target.FindFirstType('int8_t').GetPointerType()).GetValueAsUnsigned()
```