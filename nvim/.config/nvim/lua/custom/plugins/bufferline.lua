return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin' },
  config = function()
    require('bufferline').setup {
      highlights = require('catppuccin.special.bufferline').get_theme()(),
      options = {
        diagnostics = 'nvim_lsp',
        offsets = {
          { filetype = 'neo-tree', text = 'File Explorer', highlight = 'Directory' },
        },
      },
    }
  end,
}
