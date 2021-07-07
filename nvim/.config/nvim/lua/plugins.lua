
-- ============== telescope  ===============

require('telescope').setup{
  defaults ={
    layout_strategy = "vertical",
    -- preview_height = 5
  }
}


-- ============== treesitter ===============
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}



-- ============== lsp  ===============
local on_attach = require'completion'.on_attach
require'lspconfig'.pyright.setup{ on_attach=on_attach  }

require'lspconfig'.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
