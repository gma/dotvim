set nocompatible

silent! call pathogen#runtime_append_all_bundles()

set tabstop=8               " default size of a real tab stop
set softtabstop=2           " pressing tab/backspaces inserts/removes 2 chars
set shiftwidth=2            " the number of spaces used by << and >>
set expandtab               " insert spaces instead of tabs

set autoindent
set nowrap                  " disable line wrapping
" set hlsearch                " incremental highlighting
set incsearch               " show search matches as you type

set hidden                  " open multiple files in one 'window'
set number                  " show line numbers
set laststatus=2            " always show status bar
set ruler                   " display the ruler at the bottom of the window
set wildmenu                " nice tab completion just above the status bar

" colorscheme desert
" colorscheme ir_black
colorscheme railscasts
" colorscheme vibrantink

""" Make it easy to modify vim settings on the fly.
""
" From http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/

" Automatically source the config file on save.
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
endif

" Quickly open the vim config file in a new tab.
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
 
""" Useful for running vi within irb
""
" From http://vimcasts.org/episodes/running-vim-within-irb/

if has("autocmd")
  filetype plugin indent on  " enable filetype detection

  " Restore cursor position
  "autocmd BufReadPost *
  "  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  "  \   exe "normal! g`\"" |
  "  \ endif
endif
if &t_Co > 2 || has("gui_running")
  syntax on
endif

""" Ruby
""
" From the PeepCode Smashing Into Vim II video
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
