![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

# Zhuo's fork of [amix/vimrc](https://github.com/amix/vimrc)


## Install

```bash
git clone https://github.com/zchrissirhcz/dotvim ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

then open vim to let vim-plug download plugins for the first time.

Note: plugins are git-cloned from github, please ensure network.


## My tweaks memo
- use [vim-plug](https://github.com/vim-scripts/vim-plug) as plugin manager, configured by [here](dot-vim/tree/master/vimrcs/vim-plug_plugins_config.vim)
- remove `sources_non_forked` folder
- change `install_awesome_vimrc.sh`
- personal configs added in [my_config.vim](tree/master/vimrcs/my_config.vim)
    - use gcc and cppcheck on ale plugin for C/C++ syntax checking
    - set foldcolumn to 0 instead of 1, mouse-select-copy friendly.
    - <del>add `vim-clang-format`, for auto indenting/add spaces, need `apt install clang-format` </del>


## Known issue

Please go to [config-issues.md](dot-vim/tree/master/config-issues.md) for details.
