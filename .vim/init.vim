"set nocompatible
set hidden
set number
set relativenumber
set ruler

set encoding=utf-8

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set list listchars=tab:\ \ ,trail:·

set hlsearch
set incsearch
set ignorecase
set smartcase

set t_Co=256

filetype off

set guifont=Inconsolata:h16

set backupdir=~/.vim/backup
set directory=~/.vim/backup

runtime! macros/matchit.vim

set showcmd

" Commands
set pastetoggle=<F10>
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

let mapleader = "\<Space>"
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :b
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>v :vs<CR>
nmap <Leader><Leader> V

" elixir test runner commands
" let g:extest_exunit_run_test_cmd = "elixir '%f'"
" let g:extest_exunit_run_file_cmd = "elixir '%f'"
" map <leader>T :ExTestRunFile<CR>
" map <leader>t :ExTestRunTest<CR>
" map <leader>lt :ExTestRunLast<CR>

" vim-go maps
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>m <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-l>     neocomplete#complete_common_string()


"YouCompleteMe settings:
"autoclose scratch window after completion
let g:ycm_path_to_python_interpreter = '/home/jrankin/.pyenv/shims/python'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"Rust stuff
"let g:rustfmt_autosave = 1

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

" Treate eco files as html for autoclose
au Filetype eco so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

" Haskell stuff from: http://www.stephendiehl.com/posts/vim_2016.html
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>


"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

let python_highlight_all=1

" Vundle and plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'

Plugin 'vim-scripts/matchit.zip'
Plugin 'scrooloose/syntastic'
" Plugin "MarcWeber/vim-addon-mw-utils"
" Plugin "tomtom/tlib_vim"
" Plugin "garbas/vim-snipmate"

Plugin 'kchmck/vim-coffee-script'
Plugin 'AndrewRadev/vim-eco'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'fatih/vim-go'

" Plugin 'ekalinin/Dockerfile.vim'
" Plugin 'matthewsimo/angular-vim-snippets'

Plugin 'wting/rust.vim'
Plugin 'racer-rust/vim-racer'

Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent'
Plugin 'eagletmt/ghcmod-vim'
" Plugin 'elixir-lang/vim-elixir'
" Plugin 'BjRo/vim-extest'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimproc.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'leafgarland/typescript-vim'

Plugin 'Shougo/deoplete.vim'
" Python
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" Optional:
" Plugin 'honza/vim-snippets'
" Ember Stuff
" Plugin 'mustache/vim-mustache-handlebars'
call vundle#end()

syntax enable
filetype plugin indent on

" Don't autoinstall go plugins every startup
let g:go_disable_autoinstall = 1
" Set jscs as linter for js files
let g:syntastic_javascript_checkers=['eslint']