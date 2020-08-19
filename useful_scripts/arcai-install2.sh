#!/bin/sh

config_pip()
{
    if [ ! -f ~/.pip/pip.conf ]; then
        mkdir -p ~/.pip
        tee ~/.pip/pip.conf << EOF
# Aliyun
[global]
index-url = http://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host=mirrors.aliyun.com
EOF
    fi
    pip install -U pip
    echo "--- config python done"
}

install_mmdet()
{
    git clone https://gitee.com/mirrors/mmdetection
    cd mmdetection
    pip install -r requirements/build.txt
    pip install -v -e .
}

install_font()
{
    apt-file update
    apt install fonts-noto-cjk
}

config_tmux()
{
    if [ ! -f ~/.tmux.conf ]; then
        touch ~/.tmux.conf
        tee -a ~/.tmux.conf << EOF
# prefix key
set -g prefix C-v


#reload tmux conf with Prefix + r
bind r source-file ~/.tmux.conf \; display "Reloaded tmux.conf"


# -------------------------------------
# => turn on mouse
# -------------------------------------
# if tmux version < 2.1
#setw -g mouse-resize-pane on
#setw -g mouse-select-pane on
#setw -g mouse-select-window on
#setw -g mode-mouse on

# if tmux version >= 2.1
set -g mouse on

# -------------------------------------
# => split window
# -------------------------------------

# vertical split (prefix -)
#unbind '"'
bind - split-window -v

# horizontal split (prefix |)
#unbind '%'
bind | split-window -h


# Start window numbering at
set -g base-index 1
setw -g base-index 1


# -------------------------------------
# => status bar
# -------------------------------------
# set color for status bar
#set -g status-style bg=cyan
set-option -g status-bg colour235
#set-option -g status-fg default #base02
set-option -g status-fg white #base02
set-option -g status-attr default


# Remove the annoying asterisk.
setw -g window-status-current-format '#{?window_zoomed_flag,#[fg=red],}#I #W#{?window_zoomed_flag,#[fg=red],}'
setw -g window-status-format '#I #W'


# set window list colors
setw -g window-status-current-style bg=blue


# Set scrollback history to 10000 (10k)
set -g history-limit 10000


# more config see https://www.kancloud.cn/kancloud/tmux/62463



#----------------------------------
# 状态栏颜色，时间格式等
# https://note4code.com/2016/07/03/tmux-自定义配置/
#----------------------------------
# 自动重新编号 window
set -g renumber-windows on

# 设置自动刷新的时间间隔
set -g status-interval 1
# 状态栏左对齐
set -g status-justify left
# 状态栏左侧宽度
set -g status-left-length 20
# 状态栏右侧宽度
set -g status-right-length 50

# 状态栏背景颜色
set -g status-bg '#333333'
# 状态栏前景颜色
set -g status-fg '#ffffff'
# 状态栏左侧显示 session 的名字
set -g status-left '#[bg=#00bb00] [#S] #[default] '
# 状态栏右侧显示时间
#set -g status-right '#[fg=white,bg=#55bb00] [#h] #[fg=white,bg=#009c00] %Y-%m-%d #[fg=white,bg=#007700] %H:%M:%S '
set -g status-right '#[fg=white,bg=#444444] [#h] #[fg=white,bg=#666666] %Y-%m-%d #[fg=white,bg=#888888] %H:%M:%S '

# 当前激活窗口在状态栏的展位格式
setw -g window-status-current-format '#[bg=#ff0000, fg=#ffffff, bold]*[#I] #W*'
# 未激活每个窗口占位的格式
setw -g window-status-format '#[bg=#0000ff, fg=#ffffff] [#I] #W '
EOF
    fi
}

main()
{
    # config_pip
    #pip install -r requirements.txt
    #install_mmdet
    #install_font
    config_tmux
}

main

