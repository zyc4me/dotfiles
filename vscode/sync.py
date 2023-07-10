# coding: utf-8
# copy vscode config files from user config directory

import shutil
import sled

def copy_windows_configs():
    src_dir = 'C:/Users/zz9555/AppData/Roaming/Code/User'
    dst_dir = 'windows'

    filelist = ['settings.json', 'keybindings.json']
    for item in filelist:
        src_pth = f'{src_dir}/{item}'
        dst_pth = f'{dst_dir}/{item}'
        cmd = f'copy {src_pth} to {dst_pth}'
        print(cmd)
        shutil.copyfile(src_pth, dst_pth)

if __name__ == '__main__':
    if sled.is_windows():
        copy_windows_configs()