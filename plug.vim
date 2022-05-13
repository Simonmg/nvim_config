if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
if has("nvim")
    Plug 'dracula/vim', { 'as': 'dracula' }
		Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'preservim/nerdtree'
    Plug 'neovim/nvim-lspconfig'
		Plug 'glepnir/lspsaga.nvim'
		Plug 'nvim-lua/completion-nvim'
		Plug 'nvim-lua/diagnostic-nvim'
		Plug 'nvim-lua/completion-nvim'
		Plug 'nvim-lua/popup.nvim'
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'neovim/nvim-lspconfig'
		Plug 'jose-elias-alvarez/null-ls.nvim'
		Plug 'MunifTanjim/prettier.nvim'
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
		Plug 'mhartington/formatter.nvim'
		Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
		Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
		Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'nvim-lualine/lualine.nvim'
		Plug 'kyazdani42/nvim-web-devicons'
		Plug 'tpope/vim-fugitive'
    Plug 'Rigellute/shades-of-purple.vim' 
    Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
endif
call plug#end()
