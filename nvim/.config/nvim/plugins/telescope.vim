Plug 'nvim-telescope/telescope.nvim'
nnoremap <C-p> :lua require('telescope-config').project_files()<CR>
nnoremap <C-g> :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<CR>
" nnoremap <leader>fd :lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<cr>
" nnoremap <leader>gg :lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>tl :lua require('telescope.builtin').builtin()<cr>
nnoremap <leader>fc :lua require('telescope-config').find_classes()<CR>

