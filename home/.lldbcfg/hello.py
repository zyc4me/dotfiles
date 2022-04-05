# coding: utf-8
import pdb

def your_first_command(debugger, command, result, internal_dict): 
    pdb.set_trace()
    print("hello world!")

# 
def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('command script add -f hello.your_first_command yay')