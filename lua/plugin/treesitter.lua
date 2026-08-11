return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
    }

    require('nvim-treesitter').install({ 'lua', 'python', 'javascript', 'c', 'cpp' })
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'lua', 'python', 'javascript', 'c' }, -- add whatever filetypes you use
        callback = function()
            vim.treesitter.start()
            vim.wo[0][0].foldenable = false
            vim.wo[0][0].foldmethod = 'expr'
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
  end,
}

-- e.g. lua/config/treesitter.lua, or wherever you're keeping the treesitter setup
