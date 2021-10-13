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

## 一些快捷键

参照 [CW大神](https://github.com/theniceboy/nvim/blob/master/README_cn.md) 的配置， 抄了几个好用的：


### 1. nerdtree
- 切换 nerdtree： `tt` 键
- 在NERDTree 里，选择文件并打开： `<CR>`
- 在NERDTree 里，选择文件、并在现有标签页中，split，再显示： `s`

### 2. 标签页管理：
| 快捷键  | 行为 |
| ------  | ------ |
| `t` `u` | 新建一个标签页 |
| `t` `n` | 移至左侧标签页 |
| `t` `i` | 移至右侧标签页 |
| `t` `m` `n` | 将当前标签页向左移动一格 |
| `t` `m` `i` | 将当前标签页向右移动一格 |

实际上默认可以用的：
- Ctrl + PageUp  切换到左边一个标签页
- Ctrl + PageDown 切换到右边一个标签页

### 3. 类似 gitlens 查看 git blame
目前是手动触发每一行的查看，

`<leader>,`

其中 `<leader>` 键，我的配置下是 `,`

### 4. 召唤终端
用了 skywind3000/Terminal-helper

目前配置了 切换terminal的快捷键： `Ctrl+j`
terminal 的位置固定在窗口下方； 需要 Esc :q 退出terminal而不能exit退出
