-- lua/plugins/blink.lua
return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '*',
  opts = {
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  },
}
