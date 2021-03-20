lua << EOF
    local on_attach = require'completion'.on_attach
    require'lspconfig'.pyright.setup{ on_attach=on_attach  }
EOF
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap rn :lua vim.lsp.buf.rename()<CR>
nnoremap ]n :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap [n :lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>
