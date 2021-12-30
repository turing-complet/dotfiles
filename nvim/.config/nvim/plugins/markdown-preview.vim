" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'   }
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/dotfiles/nvim/github-markdown.css'
