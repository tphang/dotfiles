""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/auto-pairs-gentle'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'

" Language Server
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

" autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Theme
Plug 'dikiaap/minimalist'

Plug 'tphang/vim-tmx'
Plug 'git@github.com:tphang/vim-apex.git'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEOPLETE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
      \ 'apexcode': ['/Users/timothyphang/bin/test.sh']
      \}
set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FAST TERMINAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi NonText cterm=NONE ctermfg=NONE
" Don't load matchit.vim (paren/bracket matching)
let loaded_matchparen=1
" Don't show match parentheses/brackets
set noshowmatch
" Don't paint cursor line
set nocursorline
" Don't paint cursor column
set nocursorcolumn
" Wait to redraw
set lazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=1000
" tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showtabline=2
set autoindent
" show status
set laststatus=2
set showmatch
" search
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set cmdheight=2
set switchbuf=useopen
" keep more context when scrolling off the end of a buffer
set scrolloff=10
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
" turn on line numbers
set nu
let mapleader=","
" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100
" Hilight entire row for quick scanning
set cursorline
set noeb vb t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set t_ut=
" Enable highlighting for syntax
syntax on
set hlsearch
"use minimalist theme
colo minimalist
highlight Search ctermfg=NONE ctermbg=89 guibg=Purple guifg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
if has('nvim')
  " for some reason nvim interprets c-h as backspace
  nnoremap <bs> <c-w>h
endif
" LeaderLeader commands to switch files and leave insert quickly
nnoremap <leader><leader> <c-^>
inoremap <leader><leader> <ESC>
vnoremap <leader><leader> <ESC>
" NerdTree
let NERDTreeShowHidden=1
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
" Clear search
nnoremap <leader>/ :nohlsearch<CR>
" Yank to system clipboard
vnoremap <c-c> "*y
vnoremap <leader>y "*y
" Easier window resizing
nnoremap <leader>> <c-w>15>
nnoremap <leader>< <c-w>15<
" toggle spelling
nmap <silent><leader>sc :set spell!<CR>
" STATUS LINE
" set statusline=%<%f\ (%{&ft})\ %-4(%m%)
" set statusline+=%=%#visual#%{fugitive#statusline()}%*\ \ \
" set statusline+=%-10(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAILING WHITESPACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermfg=NONE ctermbg=88 guifg=#ffafaf guibg=#af0000
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXPANDABLE DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
