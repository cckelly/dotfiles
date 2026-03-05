return {
  'goolord/alpha-nvim',
  dependencies = { 'MaximilianLloyd/ascii.nvim' },
  config = function()
    local dashboard = require 'alpha.themes.dashboard'
    local ascii = require 'ascii'
    dashboard.section.header.val = ascii.art.text.neovim.sharp
    dashboard.section.buttons.val = {
      dashboard.button('f', '  Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('g', '  Live Grep', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('r', '  Recent Files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('c', '  Neovim Config', '<cmd>edit $MYVIMRC<CR>'),
      dashboard.button('e', '  New File', '<cmd>ene<CR>'),
      dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
    }
    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#94e2d5' })
    dashboard.section.header.opts.hl = 'AlphaHeader'

    require('alpha').setup(dashboard.config)

    vim.api.nvim_set_hl(0, 'HiddenCursor', { nocombine = true, blend = 100 })
    local original_guicursor

    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaReady',
      callback = function()
        original_guicursor = vim.o.guicursor
        vim.o.guicursor = 'a:HiddenCursor'
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaClosed',
      callback = function()
        vim.o.guicursor = original_guicursor
      end,
    })
  end,
}
