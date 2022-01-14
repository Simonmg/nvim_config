set encoding=UTF-8

if has('win32')
 source ~/AppData/local/nvim/plug.vim
else
  source ~/.config/nvim/plug.vim
endif

""" general configuration
set mouse=a
set number

"" set teme
syntax enable
colorscheme dracula


""" pretier - config
let g:prettier#config#single_quote = 'true'
let g:prettier#config#printWidth = '140'
let g:prettier#config#useTabs = 'false'
let g:prettier#config#tabWidth = '2'
let g:prettier#config#semi = 'true'
let g:prettier#config#bracketSpacing = 'true'
"" set tab with spaces
set tabstop=2 shiftwidth=2 expandtab

" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>

" signature help
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>

" async lsp finder
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

" diagnostics keymap
nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>

" auto complete configuration
set completeopt=menuone,noinsert,noselect
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" telescope configuration
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" Remap keys for applying codeAction to the current line.
nmap <silent> ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <silent> qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


""" git config
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" Update sign column every quarter second
set updatetime=250

""" end got config

""" NerdTree config 
let NERDTreeShowHidden=1

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

""" typescript config
lua << EOF

local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup {}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  require'completion'.on_attach(client, bufnr)
  --...
end
-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach
}

local saga = require('lspsaga')

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

-- eslint server config
nvim_lsp.diagnosticls.setup {
   on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

-- tresitter
--if has('unix')
--	require'nvim-treesitter.configs'.setup {
--	  highlight = {
--	    enable = true,
--	    disable = {},
--	  },
--	  indent = {
--	    enable = false,
--	    disable = {},
--	  },
--	  ensure_installed = {
--	    "tsx",
--	    "toml",
--	    "fish",
--	    "php",
--	    "json",
--	    "yaml",
--	    "swift",
--	    "html",
--	    "scss"
--	  },
--	}
--	local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--	parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
--endif

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}

EOF
