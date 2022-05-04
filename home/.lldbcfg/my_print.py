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

def print_int64x1_t(valobj, internal_dict):
    val = get_val_from_valobj(valobj)
    res = '('
    for i in range(1):
        if (i > 0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
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

def cv_mat_type_to_string(depth, channels):
    CV_8U = 0
    CV_8S = 1
    CV_16U = 2
    CV_16S = 3
    CV_32S = 4
    CV_32F = 5
    CV_64F = 6
    CV_16F = 7

    r = ""
    if (depth == CV_8U): r = "8U"
    elif (depth == CV_8S): r = "8S"
    elif (depth == CV_16U): r = "16U"
    elif (depth == CV_16S): r = "16S"
    elif (depth == CV_32S): r = "32S"
    elif (depth == CV_32F): r = "32F"
    elif (depth == CV_64F): r = "64F"
    elif (depth == CV_16F): r = "16F"
    else: r = "User"

    r += "C{:d}".format(channels)

    return r

def print_cv_Mat(valobj, internal_dict):
    rows = valobj.GetChildMemberWithName('rows').GetValueAsSigned(0)
    cols = valobj.GetChildMemberWithName('cols').GetValueAsSigned(0)
    channels = valobj.EvaluateExpression("channels()").GetValueAsSigned()
    depth = valobj.EvaluateExpression("depth()").GetValueAsSigned()
    typestr = cv_mat_type_to_string(depth, channels)
    data = valobj.GetChildMemberWithName('data').GetValue()
    datastart = valobj.GetChildMemberWithName('datastart').GetValue()
    step1 = valobj.EvaluateExpression("step1(0)").GetValueAsSigned()
    res = 'rows={:d}, cols={:d}, channels={:d}, typestr={:s}, data={:s}, datastart={:s}, step1={:d}'.format(
       rows, cols, channels, typestr, str(data), str(datastart), step1
    )
    return res

def print_cv_Matx(valobj, internal_dict):
    # rows = valobj.GetChildMemberWithName('rows').GetValueAsSigned(0)
    # cols = valobj.GetChildMemberWithName('cols').GetValueAsSigned(0)
    # channels = valobj.GetChildMemberWithName('channels').GetValueAsSigned(0)

    # rows = 2
    # cols = 5
    # channels = 7
    #res = 'rows={:d}, cols={:d}, channels={:d}'.format(rows, cols, channels)
    res = 'hohoho'
    return res

    # val = valobj.GetChildMemberWithName('val').GetValue()
    # return str(val)

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

    # cv::Mat
    debugger.HandleCommand('type summary add -P cv::Mat -F {:s}.print_cv_Mat'.format(__name__))

    # cv::Matx, still buggy
    # This binding can print 9 'hohoho' if the formatter returns 'hohoho', for the case `cv::Mat<int, 3, 3> mat = ...` is called.
    # But when call `cv::Mat<float, 3, 3>`, the formatter is not called. Wierd.
    #debugger.HandleCommand('type summary add -P template<typename _Tp, int m, int n> cv::Matx<_Tp, m, n> -F {:s}.print_cv_Matx'.format(__name__))