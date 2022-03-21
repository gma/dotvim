set tabstop=2               " default size of a real tab stop
set softtabstop=2           " pressing tab/backspaces inserts/removes 2 chars
set shiftwidth=2            " the number of spaces used by << and >>
set shiftround              " round spaces indented by <, > to multiple of width
set expandtab               " insert spaces instead of tabs
set copyindent              " if this line uses tabs, use them on next line
set preserveindent          " don't replace existing tabs to spaces on re-indent
set textwidth=72            " right margin to use when wrapping text

set autoindent
set nowrap                  " disable line wrapping
" set hlsearch                " highlight search matches
set incsearch               " incremental search
set ignorecase              " case insensitive search...
set smartcase               " ...unless you use a capital in your search

set matchtime=2             " time to highlight matching parentheses (x 0.1s)
set scrolloff=5             " scroll buffer when cursor approaches top/bottom

set hidden                  " open multiple files in one 'window'
set laststatus=2            " always show status bar
set ruler                   " display the ruler at the bottom of the window

set history=1000            " remember more than 20 commands/search patterns
set noswapfile
set nobackup                " don't create file called foo~ when editing foo

set splitbelow              " open new split below, and
set splitright              " to the right of the current pane

set dictionary+=/usr/share/dict/words  " useful for <C-x> <C-k> completion

set path=.,,**              " enable :find to search beneath cwd
set wildmenu                " nice tab completion just above the status bar
set wildmode=list:full      " tab completes common prefix, but lists choices
set wildignore=tmp/cache/**

set colorcolumn=81
set cursorline
