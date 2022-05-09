# dotfiles

## Install

Linux / macOSX

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

**Vim**
Go to [dotvim](dotvim) folder.
```bash
cp -R dotfiles/dotvim ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```
Note: this "dotvim" is too complicated. I'm writing my own lightweight vimrc (WIP).


## TODO

Fix bashrc's aliasrc, pathrc

