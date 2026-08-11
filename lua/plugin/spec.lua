return {

    { 'nvim-lua/plenary.nvim' },

    { 'mbbill/undotree',
        name = 'undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    { 'tpope/vim-fugitive',
        name = 'fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end 
    },

    { 'hrsh7th/nvim-cmp' },

    { 'ThePrimeagen/vim-be-good' },

    { "ThePrimeagen/vim-guys" },
}
