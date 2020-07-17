# dotfiles

Zhuo's personal dotfiles.

## Easy Install, On Linux

via wget:
```bash
sh -c "$(wget https://raw.githubusercontent.com/zchrissirhcz/dotfiles/master/install.sh -O -)"
```

via curl:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zchrissirhcz/dotfiles/master/install.sh)"
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

**Mirrors**
Go to [mirrors-china](mirrors-china) folder.


## TODO

Fix bashrc's aliasrc, pathrc
