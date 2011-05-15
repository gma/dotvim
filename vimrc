set nocompatible

silent! call pathogen#runtime_append_all_bundles()

set tabstop=2               " default size of a real tab stop
set softtabstop=2           " pressing tab/backspaces inserts/removes 2 chars
set shiftwidth=2            " the number of spaces used by << and >>
set expandtab               " insert spaces instead of tabs
set textwidth=72            " right margin to use when wrapping text

set autoindent
set nowrap                  " disable line wrapping
" set hlsearch                " incremental highlighting
set incsearch               " show search matches as you type

set hidden                  " open multiple files in one 'window'
set number                  " show line numbers
set laststatus=2            " always show status bar
set ruler                   " display the ruler at the bottom of the window
set wildmenu                " nice tab completion just above the status bar

set history=1000            " remember more than 20 commands/search patterns
set noswapfile

colorscheme solarized
set background=light

" colorscheme desert
" colorscheme ir_black
" colorscheme railscasts
" colorscheme mac_classic
" colorscheme topfunky-light

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" Show whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

nmap <LEADER>d :NERDTreeToggle<CR>
let NERDSpaceDelims=1

if has("autocmd")
  filetype plugin indent on  " enable filetype detection
endif

" Indentation
if has("autocmd")
  autocmd FileType sh setlocal shiftwidth=4
  autocmd FileType css setlocal shiftwidth=4
  autocmd FileType python setlocal shiftwidth=4
endif

" Markdown
if has("autocmd")
  autocmd FileType markdown set wrap
  autocmd FileType markdown set linebreak
endif

" Ruby
nmap <LEADER>E :s/_eventually//<CR>
nmap <LEADER>e :s/should/should_eventually/<CR>

" Web
if has("autocmd")
  autocmd FileType haml set nowrap
endif
 
" Useful for running vi within irb
" From http://vimcasts.org/episodes/running-vim-within-irb/
if has("autocmd")
  " Restore cursor position
  "autocmd BufReadPost *
  "  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  "  \   exe "normal! g`\"" |
  "  \ endif
endif
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Functions
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
