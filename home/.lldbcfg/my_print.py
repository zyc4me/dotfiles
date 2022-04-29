# coding: utf-8
# 用于调试阶段打印 int8_t[8] 形式的数组， 替代代码中手动加 std::cout log 的繁琐方式
# parray w_a0

def print_uint8x8_t(valobj, internal_dict):
    res = '['
    for i in range(8):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ']'
    return res

def print_int8x8_t(valobj, internal_dict):
    res = '['
    for i in range(8):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ']'
    return res

def print_uint8x16_t(valobj, internal_dict):
    res = '['
    for i in range(16):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ']'
    return res

def print_int8x16_t(valobj, internal_dict):
    res = '['
    for i in range(16):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ']'
    return res


def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('type summary add -P uint8_t[8] -F {:s}.print_uint8x8_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int8_t[8] -F {:s}.print_int8x8_t'.format(__name__))
    debugger.HandleCommand('type summary add -P uint8_t[16] -F {:s}.print_uint8x16_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int8_t[16] -F {:s}.print_int8x16_t'.format(__name__))