-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    local colors = require('catppuccin.palettes').get_palette 'mocha'
    vim.api.nvim_set_hl(0, 'YankHighlight', { bg = colors.mauve, fg = colors.base })
    vim.hl.on_yank { higroup = 'YankHighlight', timeout = 200 }
  end,
})
