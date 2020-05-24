## Dependencies
### linters:
```bash
sudo apt install gcc cppcheck
```

### ctags

```bash
sudo apt remove exuberant-ctags -y
sudo apt install autoconf
    
cd /tmp
git clone https://github.com/universal-ctags/ctags
cd ctags
./autogen.sh
./configure --prefix=/usr/local/universal-ctags  # 我的安装路径。你按自己的情况调整。
make -j8
sudo make install

sudo ln -s /usr/local/universal-ctags/bin/ctags /usr/bin/ctags
```

## Install Vim

since using ale and YCM plugins, at least vim>=8.0 is needed.

### vim on ubuntu

If on ubuntu16.04, official apt provided vim is 7.4, thus we have to compile vim8 from source.
	
Here I turn off gui(`--without-x` and `disable-gui`) for Xshell remoting without X.

```bash
cd /tmp
git clone https://github.com/vim/vim
cd vim

INSTALL_DIR=~/soft/vim8
mkdir -p $INSTALL_DIR

./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-cscope \
        --disable-gui \
        --without-x \
        --prefix=$INSTALL_DIR

make -j$(nproc) VIMRUNTIMEDIR=$INSTALL_DIR/share/vim/vim81

make install
```

Then set `PATH` enviornment variable in zshrc and vimrc(**Note: must use single quote instead of double quote**):

```bash
# for zsh
echo 'export VIM8=/home/zz/soft/vim8/bin' >> ~/.zshrc
echo 'export PATH=$VIM8:$PATH' >> ~/.zshrc
source ~/.zshrc
```

```bash
# for bash
echo 'export VIM8=/home/zz/soft/vim8/bin' >> ~/.bashrc
echo 'export PATH=$VIM8:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### vim on MacOS

If on mac OSX 10.14(mojave), the pre-installed vim is 8.0, however it is with problem when using YouCompleteMe plugin. To solve:

1. ensure homebrew installed
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. use brew install vim
```bash
brew install vim --with-override-system-vi
```
which, may gives the output like "brew link fails". If so, we need:
```bash
sudo chown -R $(whoami) $(brew --prefix)/*
brew link vim
```
and also make sure brew installed vim is searched before pre-installed vim in `PATH` variable, by editing `~/.zshrc` and uncomment this line:
```bash
export ZSH="/Users/chris/.oh-my-zsh"
```

## YouCompleteMe plugin
YouCompleteMe plugin is an awesome plugin. However, during installation and configuration, it may occur that:

### 1. YouCompleteMe download problem

YouCompleteMe cannot be downloaded normally by vim-plug.

This is due to YouCompleteMe depends many many submodules, and when cloing submodules they are not with depth==1 in vim-plug. Then, if one's network is not very well, it may fail, and have to manually run its `install.py` script.


### 2. pip package problem

After putting YouCompleteMe configurations in vimrc files, python may complain.

- In my case, I'm ubuntu16.04, it first complain that python package `cryptography` is old and may cause YCM slowdown. I've update `cryptography`, then comes the second problem

- The second problem is pip complains openssl, say `AttributeError: 'module' object has no attribute 'SSL_ST_INIT'`. Solved by:

```bash
sudo rm -rf /usr/lib/python2.7/dist-packages/OpenSSL
sudo rm -rf /usr/lib/python2.7/dist-packages/pyOpenSSL-0.15.1.egg-info
sudo pip install pyopenssl
```
