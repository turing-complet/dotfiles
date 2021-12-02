" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap ]n :lua vim.diagnostic.goto_next()<CR>
nnoremap [n :lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vc :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vd :lua vim.diagnostic.show_line_diagnostics()<CR>
