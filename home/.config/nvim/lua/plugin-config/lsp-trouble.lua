local opts = {silent = true, noremap = true}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>LspTroubleToggle<cr>", opts)
require('trouble').setup{
    icons = true, -- use dev-icons for filenames
    mode = "document_diagonostic", -- "workspace" or "document"
    action_keys = { -- key mappings for actions in the trouble list
        close = "q", -- close the list
        cancel = {"ć", "Ć"}, -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        toggle_mode = "m", -- toggle between "workspace" and "document" mode
        toggle_preview = "P", -- toggle auto_preview
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "l", -- up
        next = "k" -- down
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back
    auto_fold = false, -- automatically fold a file trouble list at creation
    use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}
