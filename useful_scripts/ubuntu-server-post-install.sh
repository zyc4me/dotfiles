#!/bin/sh

config_apt()
{
    tee /etc/apt/sources.list  << EOF
deb https://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
EOF

    apt update -y

    apt install -y sudo vim git curl aptitude apt-file apt-show-versions autoconf automake libtool openssh-server subversion tmux enca tig samba silversearcher-ag zsh ncdu tree dos2unix ninja-build
    apt install libncurses5-dev htop iotop xorg openbox wget

    echo "you may need this:"
    echo "rm /var/lib/dpkg/info/apt-show-versions.*"

    echo "--- config apt done"
}

config_chinese()
{
    apt install -y language-pack-zh-hans
    apt install -y locales
    locale-gen zh_CN.utf8
    update-locale
    tee -a /etc/default/locale << EOF
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh"
EOF
}

config_git()
{
    if [ ! -f ~/.gitconfig ]; then
        touch ~/.gitconfig
        tee -a ~/.gitconfig << EOF
[alias]
    co = checkout
    ci = commit
    st = status
    br = branch
    hist = log --pretty=tformat:'%Cgreen%h%Creset %ad | %s%d %C(bold blue)[%an]%Creset' --graph --date=short
    type = cat-file -t
    dump = cat-file -p
EOF
    fi
}

config_vim()
{
    if [ ! -f ~/.vimrc ]; then
        tee ~/.vimrc << EOF
set nocp
set nu
set hlsearch
set ai
EOF
    fi
    echo "--- config vim done"
}

config_cuda()
{
    if [ ! -d /opt/cuda-10.1 ]; then
        bash ./cuda_10.1.105_418.39_linux.run --silent --toolkit --toolkitpath=/opt/cuda-10.1

        if [ ! -f ~/.pathrc ]; then
            tee -a ~/.bashrc << EOF
if [ -f ~/.pathrc ]; then
    . ~/.pathrc
fi
EOF

            touch ~/.pathrc
            tee ~/.pathrc << EOF
export PATH=/opt/cuda-10.1/bin:\$PATH
export LD_LIBRARY_PATH=/opt/cuda-10.1/lib64:\$LD_LIBRARY_PATH
EOF
        fi
    fi
    echo "--- config cuda done"
}

config_conda()
{
    if [ ! -d /opt/miniconda ]; then
        bash ./Miniconda3-4.7.10-Linux-x86_64.sh -b -p /opt/miniconda
    fi

    if [ ! -f ~/.pathrc ]; then
        touch ~/.pathrc
    fi
    tee -a ~/.pathrc << EOF
# Conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="\$('/opt/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ \$? -eq 0 ]; then
    eval "\$__conda_setup"
else
    if [ -f "/opt/miniconda/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda/bin:\$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
EOF
    echo "--- config conda done"
}

config_ssh()
{
    sudo service ssh start
    sudo systemctl enable ssh
}

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
    #config_apt
    config_git
    #config_chinese
    #config_vim
    #config_cuda
    #config_conda

    config_ssh

    # config_pip
    #pip install -r requirements.txt
    #install_mmdet
    #install_font
    #config_tmux
}


main

