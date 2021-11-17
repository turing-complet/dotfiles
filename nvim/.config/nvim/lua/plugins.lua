
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
  move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
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


-- ============== trouble  ===============
require("trouble").setup {}


-- ============== nvim-tree  ===============
-- NOTE: this should be run AFTER setting g:nvim_tree_*
require("nvim-tree").setup {
 nvim_tree_ignore = {'.git', 'node_modules', '__pycache__', '.nox', '.tox', '*.pyc'}
}
