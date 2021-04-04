
-- ============== treesitter ===============
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

-- ============== lsp  ===============
local on_attach = require'completion'.on_attach
require'lspconfig'.pyright.setup{ on_attach=on_attach  }

