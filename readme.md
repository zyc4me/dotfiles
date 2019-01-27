# Zhuo's personal dotfiles

## Prequesties
- zsh
- oh-my-zsh
- linux/mac

## bazel
`.zsh/completion/_bazel`

## tmux
`.tmux.conf`

## emacs
`.emacs`

## vim
```bash
git clone https://zchrissirhcz/dotvim ~/
```

## deprecated vim config
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
cp dotfiles/my_configs.vim ~/.vim_runtime/
```

### very old vim configuration
copy `.vimrc` to $HOME:
```bash
git clone https://github.com/zchrissirhcz/dotfiles
cp dotfiles/.vimrc ~/.vimrc
```


