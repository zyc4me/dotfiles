# coding: utf-8
import pdb

def print_named_array(valobj, internal_dict):
    name = valobj.GetChildMemberWithName("name").GetValue()
    # N = valobj.GetChildMemberWithName("N").GetValueAsSigned(0) # ok
    N = valobj.GetChildMemberWithName("size")
    data = valobj.GetChildMemberWithName("data")
    info = 'name = ' + str(name)

    info += "\n"
    # N = 10 # TODO: FIX THIS
    for i in range(N):
        if(i>0): info += ', '
        info += str(data.GetChildAtIndex(i).GetValueAsSigned(0))
    info += ')'
    return info

# 
def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('type summary add -P NamedArray -F ' + __name__ + '.print_named_array')
