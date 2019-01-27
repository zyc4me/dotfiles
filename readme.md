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

## bazel
`.zsh/completion/_bazel`

## tmux
`.tmux.conf`

## emacs
`.emacs`

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

