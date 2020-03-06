# dotfiles
Zhuo's Personal dotfiles for environtment settings.

## terminator

On Ubuntu, use **terminator** when you miss iterm2 of MacOS. It's for window spliting.

### Install
```bash
sudo apt install terminator
```

### Config

Its default looking is wired to me, to make it the same looking as gnome-terminal, edit file `~/.config/terminator/config` and fill in with:
```config
[global_config]
  title_font = Ubuntu Mono 11[keybindings]
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    background_color = "#002b36"
    background_darkness = 0.91
    background_image = None
    background_type = transparent
    cursor_blink = False
    cursor_shape = ibeam
    font = Ubuntu Mono 11
    foreground_color = "#e0f0f1"
    use_system_font = False
    show_titlebar = False
```

You can also copy from `configs/.config/terminator/config` in this repo.

## git

git is for flexibly source code version control. Can be use on Windows/Linux/MacOS.

### Config

Let's use git with customed config:

```
#--- proxy
[http]
    #proxy = http://127.0.0.1:44099

#--- diff & merge
# when do git difftool with vimdiff, exit with :cq
[difftool]
	trustExitCode = true
[mergetool]
	trustExitCode = true
[diff]
	tool = meld

#--- aliases
[alias]
    co = checkout
    ci = commit
    st = status
    br = branch
    hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
    type = cat-file -t
    dump = cat-file -p

#--- commit hint message
[commit]
    template = ~/.gitmessage
```

You can also copy from `configs/.gitconfig` and `configs/.gitmessage` in this repo.


## tmux
tmux is for
- window spliting
- can re-connected session

### Install
We can use tmux on both Linux & MacOS. On Ubuntu:
```bash
sudo apt install tmux
```

### Config

The default tmux Ctrl-B binding, the not enabled mouse scrooling, the wired window spliting keys, and more settings, all can be re-configured by editing `~/.tmux.conf` file:

```
set -g prefix C-v

#########################
#
# turn on mouse
#
#########################
# if tmux version < 2.1
#setw -g mouse-resize-pane on
#setw -g mouse-select-pane on
#setw -g mouse-select-window on
#setw -g mode-mouse on

# if tmux version >= 2.1
set -g mouse on

# split window
unbind '"'
# vertical split (prefix -)
bind - splitw -v
unbind '%'
bind | splitw -h # horizontal split (prefix |)
```

You can also copy from `configs/.tmux.conf` in this repo.
