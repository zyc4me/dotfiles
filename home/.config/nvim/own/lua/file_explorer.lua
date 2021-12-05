-- 注意： 为了让 icon 正常显示， 很多 file explorer 插件用了 nvim-web-devicons 插件
-- 而 nvim-web-devicons 插件， 需要当前 terminal 使用 nerd fonf
-- nerd Font 是一系列 font 的统称， 我用的是 Ubuntu Mono Bold Nerd Font Complete Windows Compatible.ttf
-- https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
-- 安装字体后， 重启 terminal， 选择 Ubuntu Mono NF 字体， 然后 nvim file explorer 插件就正常了
-- 感谢 https://github.com/optimizacija/neovim-config 的备注
require 'paq' {
    {'kyazdani42/nvim-web-devicons'},
    {'kyazdani42/nvim-tree.lua'},
    -- {'tamago324/lir.nvim'},
    -- {'nvim-lua/plenary.nvim'},
    -- {'obaland/vfiler.vim'},
}

-- require("nvim-web-devicons").setup {}
-- require('nvim-tree').setup {
--     requires = {
--         'kyazdani42/nvim-web-devicons', -- optional, for file icon
--     }
-- }
require('plugin-config/nvim-tree')
