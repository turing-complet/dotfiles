-- ============== telescope  ===============

require('telescope').setup{
  defaults ={
    layout_strategy = "vertical",
    -- preview_height = 5
  }
}

-- ============== cmp  ===============
local cmp = require "cmp"

cmp.setup {
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<C-space>"] = cmp.mapping.complete(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 4 },
    }
}


-- ============== trouble  ===============
require("trouble").setup {}


-- ============== nvim-tree  ===============
-- NOTE: this should be run AFTER setting g:nvim_tree_*
require("nvim-tree").setup {
    filters ={
        custom = {'.git', 'node_modules', '__pycache__', '.nox', '.tox', '*.pyc'}
    }
}
