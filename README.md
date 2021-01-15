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

**commitlint**

Relies on **nodejs**(apt provides is too old) and npm.

```bash
npm install -g --save-dev @commitlint/{config-conventional,cli}
```
usage: 

```bash
echo "some commit message" | commitlint
```

Or, create `.husky` or `package.json` and config with husky (npm module)

## TODO

Fix bashrc's aliasrc, pathrc

