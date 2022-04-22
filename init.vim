

set encoding=UTF-8

if has('win32')
 source ~/AppData/local/nvim/plug.vim
else
  source ~/.config/nvim/plug.vim
endif

""" tab configuration
set tabstop=2
set shiftwidth=2

""" general configuration
set mouse=a
set number

"" set teme
syntax enable
""" colorscheme dracula

""" hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>

""" Signature help
inoremap <silent> <C-k> <cmd>Lspsaga signature_help<CR>

""" Async LSP Finder
nnoremap <silent> gh <cmd>Lspsaga lsp_finder<CR>

nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

""" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""" Telescope config
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua require("lsp_config")
