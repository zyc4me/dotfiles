# coding: utf-8
#
# 1. 打印 NEON 向量寄存器相对应的 C数组类型
#   (用于调试阶段打印 int8_t[8] 形式的数组， 替代代码中手动加 std::cout log 的繁琐方式)
#   - [x] uint8_t[8], int8_t[8], uint8_t[16], int8_t[16]: 定制为按uint/int打印
#   - [x] 其他类型： lldb 本身可以显示
#
# 2. 打印 NEON 向量寄存器类型
#   - 远程调试 android， 或在 Apple M1 等 ARM 芯片电脑上调试时： lldb 原生支持打印 neon 向量寄存器内容
#   - neon_sim 模拟库
#   - NEON_2_SSE.h 模拟库？
#

import lldb

#--------------------------------------------------------------------------------
# determine architecture
#--------------------------------------------------------------------------------
def get_arch():
    if (lldb.debugger is not None and lldb.debugger.GetSelectedTarget().triple is not None):
        return lldb.debugger.GetSelectedTarget().triple.split('-')[0]
    return None

def is_i386():
    arch = get_arch()
    if arch is not None and arch[0:1] == "i":
        return True
    return False

def is_x64():
    arch = get_arch()
    if arch is not None and arch == "x86_64":
        return True
    return False

def is_arm():
    arch = get_arch()
    #print('arch is ', arch)
    if (arch == 'arm') or (arch == 'aarch64'):
        #print("!! is_arm: yes")
        return True
    #print("!! is_arm: no")
    return False

#--------------------------------------------------------------------------------
# custom printing for int8_t[8], uint8_t[8], int8_t[16], uint8_t[16]
#--------------------------------------------------------------------------------
def print_uint8_array_len8(valobj, internal_dict):
    res = '['
    for i in range(8):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ']'
    return res

def print_int8_array_len8(valobj, internal_dict):
    res = '['
    for i in range(8):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ']'
    return res

def print_uint8_array_len16(valobj, internal_dict):
    res = '['
    for i in range(16):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ']'
    return res

def print_int8_array_len16(valobj, internal_dict):
    res = '['
    for i in range(16):
        if(i>0): res += ', '
        res += str(valobj.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ']'
    return res

#--------------------------------------------------------------------------------
# custom printing for NEON Vector Register types
#--------------------------------------------------------------------------------

# dispatch for ARM NEON and Simlulated ARM NEON by `arm_neon_sim.hpp``
def get_val_from_valobj(valobj):
    arch = get_arch()
    if (arch == 'arm' or arch == 'aarch64'):
        val = valobj
    else:
        val = valobj.GetChildMemberWithName("val")
    return val

def print_int8x8_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(8):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_uint8x8_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(8):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_int16x4_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(4):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_uint16x4_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(4):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_int32x2_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(2):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_uint32x2_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(2):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_uint64x1_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(1):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_float32x2_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    # float_ptr = val
    # float_type = float_ptr.GetType().GetPointeeType()
    res = '('
    for i in range(2):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

def print_float64x1_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(1):
        if ( i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

# Q Vector Registers, 128 bit long
def print_int8x16_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(16):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_uint8x16_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(16):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_int16x8_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(8):
        if ( i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_uint16x8_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(8):
        if ( i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_int32x4_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(4):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_uint32x4_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(4):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_float32x4_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(4):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

def print_int64x2_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(2):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_uint64x2_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(2):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_float64x2_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(2):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

def __lldb_init_module(debugger, internal_dict):
    ### C array types. only 4 types required.
    debugger.HandleCommand('type summary add -P uint8_t[8] -F {:s}.print_uint8_array_len8'.format(__name__))
    debugger.HandleCommand('type summary add -P int8_t[8] -F {:s}.print_int8_array_len8'.format(__name__))
    debugger.HandleCommand('type summary add -P uint8_t[16] -F {:s}.print_uint8_array_len16'.format(__name__))
    debugger.HandleCommand('type summary add -P int8_t[16] -F {:s}.print_int8_array_len16'.format(__name__))

    ### NEON Vector Registers
    # D Vector Registers. 64 bit long
    debugger.HandleCommand('type summary add -P int8x8_t -F {:s}.print_int8x8_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int16x4_t -F {:s}.print_int16x4_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int32x2_t -F {:s}.print_int32x2_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int64x1_t -F {:s}.print_int64x1_t'.format(__name__))

    debugger.HandleCommand('type summary add -P uint8x8_t -F {:s}.print_uint8x8_t'.format(__name__))
    debugger.HandleCommand('type summary add -P uint16x4_t -F {:s}.print_uint16x4_t'.format(__name__))
    debugger.HandleCommand('type summary add -P uint32x2_t -F {:s}.print_uint32x2_t'.format(__name__))
    debugger.HandleCommand('type summary add -P uint64x1_t -F {:s}.print_uint64x1_t'.format(__name__))

    # debugger.HandleCommand('type summary add -P float16x4_t -F {:s}.print_float16x4_t'.format(__name__))
    debugger.HandleCommand('type summary add -P float32x2_t -F {:s}.print_float32x2_t'.format(__name__))
    debugger.HandleCommand('type summary add -P float64x1_t -F {:s}.print_float64x1_t'.format(__name__))

    # Q Vector Registers. 128 bit long
    debugger.HandleCommand('type summary add -P int8x16_t -F {:s}.print_int8x16_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int16x8_t -F {:s}.print_int16x8_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int32x4_t -F {:s}.print_int32x4_t'.format(__name__))
    debugger.HandleCommand('type summary add -P int64x2_t -F {:s}.print_int64x2_t'.format(__name__))

    debugger.HandleCommand('type summary add -P uint8x16_t -F {:s}.print_uint8x16_t'.format(__name__))
    debugger.HandleCommand('type summary add -P uint16x8_t -F {:s}.print_uint16x8_t'.format(__name__))
    debugger.HandleCommand('type summary add -P uint32x4_t -F {:s}.print_uint32x4_t'.format(__name__))
    debugger.HandleCommand('type summary add -P uint64x2_t -F {:s}.print_uint64x2_t'.format(__name__))

    # debugger.HandleCommand('type summary add -P float16x8_t -F {:s}.print_float16x8_t'.format(__name__))
    debugger.HandleCommand('type summary add -P float32x4_t -F {:s}.print_float32x4_t'.format(__name__))
    debugger.HandleCommand('type summary add -P float64x2_t -F {:s}.print_float64x2_t'.format(__name__))
