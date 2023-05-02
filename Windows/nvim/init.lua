vim.opt.number = true -- display line number
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.listchars = {
    tab = '│·',
    extends = '>',
    precedes = '<',
    trail = '·',
    space = '·'
}

-- persistant undo
if vim.fn.has('win32') then
    vim.opt.undodir = os.getenv("LOCALAPPDATA") .. '/nvim/temp_dirs/undodir'
else
    vim.opt.undodir = os.getenv("HOME") .. '/.vim_runtime/temp_dirs/undodir'
end
vim.opt.undofile = true


require('keybindings')
vim.cmd[[colorscheme codedark]]

-- vscode-like yanking terminal
vim.keymap.set('n', '<C-j>', ':ToggleTerm<cr>', opts)
