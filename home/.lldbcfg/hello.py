# coding: utf-8
import pdb

def your_first_command(debugger, command, result, internal_dict): 
    pdb.set_trace()
    print("hello world!")

# some notes:
# GetChildMemberWithName() 可获取 C++ class 实例的 public 或 private 成员变量
# GetChildMemberWithName() 返回值类型是 SBValue,  API 文档 https://lldb.llvm.org/python_api/lldb.SBValue.html#lldb.SBValue.GetValue

def print_int8x8_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(8):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

# 
def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('command script add -f hello.your_first_command yay')
    debugger.HandleCommand('type summary add -P int8x8_t -F ' + __name__ + '.print_int8x8_t')


def MyRectSummary(value, internal_dict):
    top = value.GetChildMemberWithName("top").GetValueAsSigned()
    bottom = value.GetChildMemberWithName("bottom").GetValueAsSigned()
    left = value.GetChildMemberWithName("left").GetValueAsSigned()
    right = value.GetChildMemberWithName("right").GetValueAsSigned()
    width = right - left
    height = top - bottom
    return "(width = {0}, height = {1})".format(width, height)
