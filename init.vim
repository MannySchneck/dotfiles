if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
"File Search:

"Tmux":
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-two-firewatch'
Plug 'glepnir/indent-guides.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'christoomey/vim-tmux-navigator'
"Color:
"YAAAAAML:
Plug 'stephpy/vim-yaml'
Plug 'pedrohdz/vim-yaml-folds'
" Buffers. Protocol buffers.
Plug 'jiangmiao/auto-pairs'
"Golang:
Plug 'fatih/vim-go'
"Autocomplete:
" (recommend) LSP config
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Snippets:
Plug 'SirVer/ultisnips'
"Git:
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'knsh14/vim-github-link'
Plug 'junegunn/vim-easy-align'
Plug 'chrisbra/csv.vim'
"Surrrounhnnnd
"Plug 'vim-scripts/AutoClose'
"
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'FooSoft/vim-argwrap'
Plug 'jvirtanen/vim-hcl'
Plug 'tpope/vim-dadbod'
Plug 'psliwka/vim-smoothie'
Plug 'jpalardy/vim-slime'

Plug 'jnurmine/Zenburn'
call plug#end()

let g:smoothie_enabled=0
set termguicolors
""

" EXPERIMENTAL:
let g:slime_target = "tmux"

let &t_it=''


nmap <buffer> <silent> <nowait> <leader><c-r> <Plug>NetrwRefresh

lua << EOF
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  use_icons = true,        -- Requires nvim-web-devicons
  file_panel = {
    width = 35,
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    }
  }
}
EOF

" lua <<EOF
" require('telescope').setup{
"   defaults = {
"     vimgrep_arguments = {
"       'rg',
"       '--color=never',
"       '--no-heading',
"       '--with-filename',
"       '--line-number',
"       '--column',
"       '--smart-case'
"     },
"     prompt_position = "bottom",
"     prompt_prefix = "> ",
"     selection_caret = "> ",
"     entry_prefix = "  ",
"     initial_mode = "insert",
"     selection_strategy = "reset",
"     sorting_strategy = "descending",
"     layout_strategy = "horizontal",
"     layout_defaults = {
"       horizontal = {
"         mirror = false,
"       },
"       vertical = {
"         mirror = false,
"       },
"     },
"     file_sorter =  require'telescope.sorters'.get_fzy_sorter,
"     file_ignore_patterns = {},
"     generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
"     shorten_path = true,
"     winblend = 0,
"     width = 0.75,
"     preview_cutoff = 120,
"     results_height = 1,
"     results_width = 0.8,
"     border = {},
"     borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
"     color_devicons = true,
"     use_less = true,
"     set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
"     file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
"     grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
"     qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    " -- Developer configurations: Not meant for general override
    " buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  " }
" }
" EOF


"LEADER
""-----------
:let mapleader = ' '

lua <<EOF
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  --documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
EOF

inoremap <silent><expr> <C-Space> compe#complete()

inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua <<EOF
local nvim_lsp = require('lspconfig')


local golang_setup = require "lsp_signature".on_attach()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }



  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space><C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "gopls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require'lsp_signature'.setup()

EOF

"COPY/PASTE:
"-----------
"Increases the memory limit from 50 lines to 1000 lines
:set viminfo='100,<1000,s10,h

"NUMBERING:
"----------
:set number



"INDENTATION:
"------------
"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

autocmd FileType go setlocal tabstop=8 noexpandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab

"COLOR:
"------
colorscheme gruvbox "two-firewatch

"AUTO IMPORT:
"------------
"let g:go_fmt_command = "goimports"

" FOLDS:
set foldmethod=syntax
set foldlevel=4

"AUTOCOMPLETE:
"-------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>

nnoremap <leader>gw :Git commit -am wip<CR>
nnoremap <leader>ga. :Git add %<CR>

nnoremap <leader>df :cd %:h<CR>
nnoremap <leader>du :Gcd<CR>


"SNIPPETS:
"---------
"Change default expand since TAB is used to cycle options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsEditSplit="vertical"

"
" SEARCH:
nnoremap <leader>* :Rg <c-r><c-w><cr>
nnoremap <leader>sp :Rg
nnoremap <leader>ss :BLines<space>


"SHORTCUTS:
"----------
"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

"SOURCING:
"---------
"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

"TEXT SEARCH:
"------------
"Makes Search Case Insensitive
set ignorecase
set smartcase

"SWAP:
"-----
set noswapfile
"set dir=~/.local/share/nvim/swap/

" BUFFER nav
map <leader>bb :Buffers<cr>

" Me Filez
map <leader><space> :Files<cr>
map <leader>fd :e %:h

"GIT (FUGITIVE):
"---------------
map fgb :Gblame<CR>
map fgs :Gstatus<CR>
map fgl :Glog<CR>
map fgd :Gdiff<CR>
map fgc :Gcommit<CR>
map fga :Git add %:p<CR>

set background=dark

"SYNTAX HIGHLIGHTING:
"--------------------
syntax on

" golang bindings
map <leader>tw :GoTestFunc<cr>
map <leader>tt :GoTest<cr>
map <leader>tc :GoCoverageToggle<cr>
map <leader>tf :GoBuildTags
" map <leader>la :CocAction<cr>
map <leader>li :GoInfo<cr>
map <leader>lI :GoImports<cr>
map <leader>ld :GoDecls<cr>
imap <F9> <C-o>:ArgWrap<cr>
" imap <F10> <C-o>:CocAction<cr>

" WINDOOOOWZ
nnoremap <silent> C-h :TmuxNavigateLeft<cr>
nnoremap <silent> C-j :TmuxNavigateDown<cr>
nnoremap <silent> C-k :TmuxNavigateUp<cr>
nnoremap <silent> C-l :TmuxNavigateRight<cr>
nnoremap <silent> <leader>wm :only<cr>
nnoremap <leader>wd :quit<cr>

set colorcolumn=80
"let g:netrw_liststyle = 3
let g:netrw_banner = 0
"let g:argwrap_tail_comma = 1
"let g:netrw_browse_split = 1 " horiz split
"let g:netrw_winsize = 25


nnoremap <silent> <leader>fa :ArgWrap<cr>

nnoremap <leader>fs :write<cr>

"HIGHLIGHTING
"-------------
nnoremap <leader>c :nohl<CR>
" Highlight the current line the cursor is on
set cursorline
set guicursor+=n-v-c:blinkon1

:hi Comment guifg=#CBC0B8 "#c8ae9d #a5a6b5

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" let g:go_term_enabled = 1
" let g:go_term_close_on_exit = 0

let g:go_term_width = 90

autocmd BufWritePre * %s/\s\+$//e

"python
let g:python3_host_prog = expand('/Users/mannyschneck/venv/neovim/bin/python3')

" STATUS BAR
set statusline=%f\ %{FugitiveStatusline()}\ %c
set tabline=""

highlight DiffAdd     gui=none guifg=bg guibg=#557355
highlight DiffDelete  gui=none guifg=bg guibg=#735555
highlight DiffChange  gui=none guifg=bg guibg=#555573
highlight DiffText    gui=none guifg=bg guibg=#888888
hi  StatusLineNC guifg=#999999 guibg=#222222
hi  StatusLine guifg=#999999 guibg=#222222


" lua <<EOF
" require('indent_guides').setup({
" 	indent_levels = 30;
" 	indent_guide_size = 8;
" 	indent_start_level = 1;
" 	indent_enable = true;
" 	indent_space_guides = true;
" 	indent_tab_guides = true;
" 	indent_soft_pattern = '\\s';
" 	exclude_filetypes = {'help','dashboard','dashpreview','NvimTree','vista','sagahover'};
" 	 even_colors = { fg ='#fa3834',bg='#433b46' };
" 	odd_colors = {fg='#f32b36',bg='#4a4854'};
" })
" EOF


" workaround for: https://github.com/neovim/neovim/issues/11330
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
set cmdheight=1

