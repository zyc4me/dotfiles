----------------------------------------------------------------------
-- 状态栏
----------------------------------------------------------------------
-- vim.opt.statusline = [[%!luaeval("require('modules.ui.statusline').status_line()")]]

require 'paq' {
    --{'glepnir/galaxyline.nvim'},        -- 比较重量级的状态栏，功能特多
    {'ojroques/nvim-hardline'},           -- 轻量级的状态栏，功能少
    --{'famiu/feline.nvim'},
    --{'beauwilliams/statusline.lua'},
    --{'tamton-aquib/staline.nvim'},
}

require('hardline').setup {}
-- -- 如果nvim的statusline不生效，可以尝试手动执行 :lua require('hardline').setup()
-- -- 然后重开 nvim，应该就好了。

--[[
require 'paq' {
    {'glepnir/galaxyline.nvim'}
}
require('my_statusline').setup()
--]]


--[[
require 'paq' {
    {'windwp/windline.nvim'}
}

require('wlsample.vscode').setup()
--]]

--[[
require 'paq' {
    {'nvim-lualine/lualine.nvim'}
}
require('lualine').setup {}
--]]
