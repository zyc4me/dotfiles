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

    apt install -y sudo vim git curl aptitude apt-file apt-show-versions autoconf automake libtool openssh-server subversion tmux enca tig samba silversearcher-ag zsh ncdu tree dos2unix libncurses5-dev htop iotop xorg openbox wget

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


main()
{
    #config_apt
    config_git
    #config_chinese
    #config_vim
    #config_cuda
    #config_conda
}


main

