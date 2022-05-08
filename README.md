# dotfiles

Zhuo's personal dotfiles.

## Easy Install, On Linux

via wget:
```bash
sh -c "$(wget https://raw.github.com/zchrissirhcz/dotfiles/master/install.sh -O -)"
```

via curl:
```bash
sh -c "$(curl -fsSL https://raw.github.com/zchrissirhcz/dotfiles/master/install.sh)"
```

Install doom emacs (Good network connection required)
```bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo "EXPORT DOOM_BIN=~/.emacs.d/bin" >> ~/.pathrc
echo "EXPORT PATH=$DOOM_BIN:$PATH" >> ~/.pathrc
```

## Manually install

**Get repo**
```bash
git clone https://github.com/zchrissirhcz/dotfiles
```

**Universal dotfiles**

Go to [home](home) folder.


**Vim**
Go to [dotvim](dotvim) folder.
```bash
cp -R dotfiles/dotvim ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```
Note: this "dotvim" is too complicated. I'm writing my own lightweight vimrc (WIP).

**gitlint**
```
pip install gitlint
```
Then puth .gitlint in repo root directory and call `gitlint install-hook`


## zsh启动慢怎么办？
- 去掉 conda 的启动，改为添加conda/bin到PATH
- https://zhuanlan.zhihu.com/p/68303393
- https://zhuanlan.zhihu.com/p/98450570


## TODO

Fix bashrc's aliasrc, pathrc

