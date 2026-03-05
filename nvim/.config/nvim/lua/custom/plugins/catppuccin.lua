return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    flavour = 'mocha',
    no_italic = true,
    transparent_background = true,
    integrations = {
      bufferline = true,
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end,
}
