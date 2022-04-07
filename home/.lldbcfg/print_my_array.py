def print_my_array(valobj, internal_dict):
    #N = valobj.GetChildMemberWithName("size") # failed
    N = 10
    data = valobj.GetChildMemberWithName("data")
    info = ''
    for i in range(N):
        if(i>0): info += ', '
        info += str(data.GetChildAtIndex(i).GetValueAsSigned(0))
    info += ')'
    return info

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('type summary add -P MyArray<10> -F ' + __name__ + '.print_my_array')
