return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  config = function()
    local filetypes = {
      'asm',
      'bash',
      'c',
      'c_sharp',
      'cpp',
      'css',
      'csv',
      'diff',
      'go',
      'html',
      'javascript',
      'json',
      'jsx',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'rust',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
    }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
