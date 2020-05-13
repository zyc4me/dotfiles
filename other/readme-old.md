# Zhuo's personal dotfiles

## Prequesties
- linux/mac

- zsh
```bash
sudo apt install zsh
```

- oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## vim
My latest vim configuration is **NOT** in this repo. Get it separately:
```bash
git clone https://github.com/zchrissirhcz/dotvim ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## cgdb
I use cgdb for terminal-based-gui debug.
install cgdb first
```bash
sudo apt install cgdb
```
then load config file (`~/.cgdb/cgdbrc`)

Note: this is from [GDB 从裸奔到穿戴整齐](http://www.skywind.me/blog/archives/2036)

## bazel
`.zsh/completion/_bazel`

## tmux
`.tmux.conf`

## emacs
`.emacs`

**Install emacs26.1 (on ubuntu) with GUI support**
```bash
cd /tmp
wget http://mirrors.nju.edu.cn/gnu/emacs/emacs-26.1.tar.gz
tar -zxvf emacs-26.1.tar.gz
cd emacs-26.1

sudo apt install -y libxpm-dev libgif-dev libtiff5-dev

sudo apt install -y libjpeg62-dev

sudo apt install -y libxaw7-dev libpng-dev libtiff5-dev libgnutls-dev libncurses5-dev


sudo apt install -y libgtk-3-dev libwebkitgtk-3.0-dev texinfo libx11-dev libxpm-dev 


sudo apt install -y libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev  libncurses-dev gnutls-dev libgtk-3-dev


./configure --prefix=$HOME/soft/emacs-26.1 --with-x-toolkit=gtk3
make -j6
make install
```


## deprecated configs

### amix/vimrc + my tweak
**base on amix/vimrc**
First, clone amix/vimrc:
```bash
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

Then copy `my_configs.vim` to `~/.vim_runtime/`:
```bash
git clone https://github.com/zchrissirhcz/dotfiles
cp dotfiles/deprecated/my_configs.vim ~/.vim_runtime/
```

### very old vim configuration
copy `.vimrc` to $HOME:
```bash
git clone https://github.com/zchrissirhcz/dotfiles
cp dotfiles/deprecated/.vimrc ~/.vimrc
```

