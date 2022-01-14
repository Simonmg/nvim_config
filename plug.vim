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
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
    Plug 'jparise/vim-graphql'        " GraphQL syntax
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'ryanoasis/vim-devicons'
    " post install (yarn install | npm install) then load plugin only for editing supported files
    " use: :Prettier
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
endif
call plug#end()
