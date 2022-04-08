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
    # val 是 SBValue 类型
    
    #res = 'N = ' + str(val.GetChildMemberWithName("N")) # None
    #res = str(val.EvaluateExpression("1 + 3"))
    
    #res = str(val.GetType())
    #res = str(val.CreateValueFromExpression("val", "what()")) # ok. what()是一个普通函数
    #res = str(val.CreateValueFromExpression("N", "what()")) # ok. what()是一个普通函数
    #res = str(val.CreateValueFromExpression("N", "this->size()")) # 失败。 could not result type
    #res = str(valobj.CreateValueFromExpression("N", "this->size()")) # 失败。 could not result type
    #res = str(valobj.CreateValueFromExpression("N", ".size()")) # 失败。 could not result type
    #res = str(valobj.CreateValueFromExpression("N", "self.size()")) # 失败。 could not result type
    #N = valobj.CreateValueFromExpression("N", valobj.name + ".size()") # SBValue
    #N = valobj.CreateValueFromExpression("N", valobj.name + ".size()").GetValueAsSigned(0) # int
    #N = valobj.EvaluateExpression(valobj.name + ".size()").GetValue() # OK
    # N = valobj.EvaluateExpression("size()").GetValue() # str
    # N = valobj.EvaluateExpression("size()").GetValueAsUnsigned() # int
    #res = str(N)

    N = valobj.EvaluateExpression("size()").GetValueAsUnsigned()
    res = '('
    for i in range(N):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_int16x4_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(4):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_int32x2_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    #x = valobj.EvaluateExpression("size()") # 奇怪了，为什么只能 print_int8x8_t 函数中能够成功获取N，其他函数都无法获取？？
    #res = str(type(x))
    for i in range(2):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_int64x1_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(1):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res


def print_uint8x8_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(8):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_uint16x4_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(4):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_uint32x2_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(2):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_uint64x1_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(1):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res


# def print_float16x4_t(valobj, internal_dict):
#     val = valobj.GetChildMemberWithName("val")
#     res = '('
#     for i in range(4):
#         if(i>0): res += ', '
#         res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
#     res += ')'
#     return res

def print_float32x2_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    float_ptr = val
    float_type = float_ptr.GetType().GetPointeeType()
    res = '('
    for i in range(2):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

def print_float64x1_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(1):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

# Q Vector Registers. 128 bit long
def print_int8x16_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(16):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_int16x8_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(8):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_int32x4_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(4):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res

def print_int64x2_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(2):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsSigned(0))
    res += ')'
    return res


def print_uint8x16_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(16):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_uint16x8_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(8):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_uint32x4_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(4):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res

def print_uint64x2_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(2):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
    res += ')'
    return res


# def print_float16x8_t(valobj, internal_dict):
#     val = valobj.GetChildMemberWithName("val")
#     res = '('
#     for i in range(8):
#         if(i>0): res += ', '
#         res += str(val.GetChildAtIndex(i).GetValueAsUnsigned(0))
#     res += ')'
#     return res

def print_float32x4_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    float_ptr = val
    float_type = float_ptr.GetType().GetPointeeType()
    res = '('
    for i in range(4):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

def print_float64x2_t(valobj, internal_dict):
    val = valobj.GetChildMemberWithName("val")
    res = '('
    for i in range(2):
        if(i>0): res += ', '
        res += str(val.GetChildAtIndex(i).GetValue())
    res += ')'
    return res

# 
def __lldb_init_module(debugger, internal_dict):
    # D Vector Registers. 64 bit long
    debugger.HandleCommand('command script add -f hello.your_first_command yay')
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

def MyRectSummary(value, internal_dict):
    top = value.GetChildMemberWithName("top").GetValueAsSigned()
    bottom = value.GetChildMemberWithName("bottom").GetValueAsSigned()
    left = value.GetChildMemberWithName("left").GetValueAsSigned()
    right = value.GetChildMemberWithName("right").GetValueAsSigned()
    width = right - left
    height = top - bottom
    return "(width = {0}, height = {1})".format(width, height)
