if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
if has("nvim")
    Plug 'dracula/vim', { 'as': 'dracula' }
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
		Plug 'hoob3rt/lualine.nvim'
endif
call plug#end()
