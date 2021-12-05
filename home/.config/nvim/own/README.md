## vim 固有配置的设定
```
-----------------------------------
-- 一些常识
-- 1. 用 lua 设置 vim 原有的配置, 全局、窗口、缓冲区， 分区
-----------------------------------
-- local o = vim.o
-- local wo = vim.wo
-- local bo = vim.bo

-- global options 全局设定
-- o.key = value

-- window-local options 窗口设定
-- wo.key = value

-- buffer-local options 缓冲区设定
-- bo.key = value
-----------------------------------
```

## 0x2 加载
```
-----------------------------------
-- 2. require('xxx')  指的是加载 lua/xxx.lua 文件，例如
-- require('line_number')      -- lua/line_number.lua
-----------------------------------
```

## 0x3 字体
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip

安装全部， 然后终端用下载的字体， 重启终端生效。

NvimTree 插件用到了。