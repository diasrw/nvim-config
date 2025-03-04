function ColorMyPencils(color)
    -- color = color or "rose-pine"
    -- vim.cmd.colorscheme(color)
    color = color or "nebulous"
    vim.cmd.colorscheme(color)


    --
    --Put this lines inside your vimrc to set the colorscheme
    require("nebulous").setup {
        variant = "midnight",
        disable = {
            background = false,
            endOfBuffer = false,
            terminal_colors = false,
        },
        italic = {
            comments   = true,
            keywords   = false,
            functions  = false,
            variables  = false,
        },
        custom_colors = { -- this table can hold any group of colors with their respective values
            LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },
            CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },

            -- it is possible to specify only the element to be changed
            TelescopePreviewBorder = { fg = "#A13413" },
            LspDiagnosticsDefaultError = { bg = "#E11313" },
            TSTagDelimiter = { style = "bold,italic" },
        }
    }
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
ColorMyPencils()
