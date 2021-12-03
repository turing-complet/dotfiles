function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

imap('jj', '<Esc>')
imap('kj', '<Esc>')
cmap('jj', '<Esc>')
cmap('kj', '<Esc>')

nmap('<C-n>', ':bnext<CR>')
nmap('<C-b>', ':bprev<CR>')
nmap('[j', ':cnext<CR>')
nmap('[k', ':cprev<CR>')
nmap('<space>', 'za')

nmap('<leader>r', ":so ~/.config/nvim/init.vim<CR>")

-- search selected text
-- vmap('//', 'y/\V<C-R>=escape(@",'/\')<CR><CR>')

-- This unsets the "last search pattern" register by hitting return
nmap('<CR>', ':noh<CR><CR>')

vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

nmap('<leader>wh', '<C-w>t<C-w>H')
nmap('<leader>wv', '<C-w>t<C-w>K')

tmap('<Esc>', '<C-\><C-n>')
tmap('<C-h>', '<C-\><C-N><C-w>h')
tmap('<C-j>', '<C-\><C-N><C-w>j')
tmap('<C-k>', '<C-\><C-N><C-w>k')
tmap('<C-l>', '<C-\><C-N><C-w>l')

imap('<C-h>', '<C-\><C-N><C-w>h')
imap('<C-j>', '<C-\><C-N><C-w>j')
imap('<C-k>', '<C-\><C-N><C-w>k')
imap('<C-l>', '<C-\><C-N><C-w>l')

-- undo break points
imap(',', ',<c-g>u')
imap('.', '.<c-g>u')
imap('[', '[<c-g>u')
imap('!', '!<c-g>u')
imap('?', '?<c-g>u')
