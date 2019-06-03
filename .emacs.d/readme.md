# Zhuo's Personal Emacs Configuration

## Getting started
install this config by:
```
git clone https://github.com/zchrissirhcz/emacs.d ~/.emacs.d
```

## Detail steps of this config

### install emacs
emacs 27.0.50 not recommended.
emacs 26.1 recommended. compile steps:

```bash
cd /tmp
wget http://mirrors.nju.edu.cn/gnu/emacs/emacs-26.1.tar.gz
tar -zxvf emacs-26.1.tar.gz
cd emacs-26.1

sudo apt install -y libxpm-dev libgif-dev libtiff5-dev

sudo apt install -y libjpeg62-dev

sudo apt install -y libxaw7-dev libpng-dev libtiff5-dev libgnutls-dev libncurses5-dev


sudo apt install -y libgtk-3-dev libwebkitgtk-3.0-dev texinfo libx11-dev libxpm-dev


sudo apt install -y libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev  libncurses-dev       gnutls-dev libgtk-3-dev


./configure --prefix=$HOME/soft/emacs-26.1 --with-x-toolkit=gtk3
make -j6
make install
```

and add `$HOME/soft/emacs-26.1/bin` to your PATH in `~/.zshrc`, e.g:
```bash
export EMACS26=$HOME/soft/emacs-26.1/bin
export PATH=EMACS26:$PATH
```

### setting elpa mirror site
see `.emacs.d/init_package.el`. By default, I use emacs-china's mirror site.
