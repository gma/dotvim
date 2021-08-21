set nocompatible
runtime macros/matchit.vim

silent! call pathogen#infect()

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

set hidden                  " open multiple files in one 'window'
set laststatus=2            " always show status bar
set ruler                   " display the ruler at the bottom of the window
set wildmenu                " nice tab completion just above the status bar
set wildmode=list:full      " tab completes common prefix, but lists choices

set history=1000            " remember more than 20 commands/search patterns
set noswapfile
set nobackup                " don't create file called foo~ when editing foo

set splitbelow              " open new split below, and
set splitright              " to the right of the current pane

set dictionary+=/usr/share/dict/words  " useful for <C-x> <C-k> completion

set wildignore=tmp/cache/**


let g:solarized_termtrans=1
set colorcolumn=81
set background=dark

set cursorline

" colorscheme jellybeans
" colorscheme desert
" colorscheme ir_black
" colorscheme railscasts
" colorscheme mac_classic
colorscheme palenight
" colorscheme topfunky-light

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Setup shorthand mappings
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

""" Make it easy to modify vim settings on the fly.
""
" From http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
" Quickly open the vim config file in a new tab.
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Show whitespace
set listchars=tab:>-,trail:·,eol:$,extends:#,nbsp:·
nmap <silent> <leader>s :set nolist!<CR>

nmap <LEADER>y :YRShow<CR>
nmap <LEADER>d :NERDTreeToggle<CR>
let NERDTreeDirArrows=1
let NERDSpaceDelims=1

" Text bubbling (http://vimcasts.org/episodes/bubbling-text/)
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

if has("autocmd")
  filetype plugin indent on  " enable filetype detection
endif

filetype plugin on

" Editing mail
if has("autocmd")
  autocmd FileType mail setlocal wrap
  autocmd FileType mail setlocal linebreak    " wrap on word boundaries
  autocmd FileType mail setlocal nojs
  autocmd FileType mail setlocal nosmartindent
  autocmd FileType mail match Visual '\s\+$'
endif

" Indentation
if has("autocmd")
  autocmd FileType sh setlocal shiftwidth=4
  autocmd FileType css setlocal shiftwidth=4
  autocmd FileType elm setlocal shiftwidth=4
endif

" Git
if has("autocmd")
  " don't jump to last position within .git/COMMIT_EDITMSG files
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
endif

" Make files
if has("autocmd")
  autocmd FileType make set tabstop=8
  autocmd FileType make setlocal shiftwidth=8
endif

" Markdown
if has("autocmd")
  autocmd FileType markdown set wrap
  autocmd FileType markdown set linebreak
endif
let g:markdown_enable_spell_checking = 0

nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

" Python
if has("autocmd")
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal textwidth=0
  autocmd FileType python setlocal wrapmargin=0
  if filereadable(".use-black")
    autocmd BufWritePre */Projects/*/*.py execute ':Black'
  endif
endif
nnoremap <F9> :Black<CR>
let g:black_linelength = 80
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0


" Ruby
if has("autocmd")
  autocmd FileType ruby setlocal wrapmargin=0
end
nmap <LEADER>E :s/_eventually//<CR>
nmap <LEADER>e :s/it/it_eventually/<CR>
nmap <LEADER>bd F{%clend<ESC>bXi<CR><ESC>``cldo<ESC>f<bar>;a<CR><ESC>var=
nmap <LEADER>b{ ?do <BAR><CR>%ce}<ESC>``ce{<ESC>JJ$
nmap <LEADER>dst [[f(ldi)]mOattr_accessor <ESC>po<CR>def initialize()<CR><ESC>pjo<ESC>[mjk$P:s,:,,g<ESC>j?< Struct<ESC>hD]mj:s/, /\r/eg<CR>vir:s,:\([a-z0-9_]\+\),@\1 = \1,<CR>vir=
nmap <LEADER>hh /=><ESC>F:xepldf>
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.jbuilder setf ruby
set completefunc=syntaxcomplete#Complete  " for vim-ruby-minitest
set tags+=gems.tags

let g:vimux_ruby_clear_console_on_run = 0
nmap <LEADER>T :RunRubyFocusedTest<CR>

" Parse Rails deprecation warnings from logs
" (load them into quickfix window with `vi -q log`)
set errorformat+=DEPRECATION\ WARNING:\ %m\ \(called\ %.%\\+\ %f:%l\)

" Sysadmin
if has("autocmd")
  autocmd FileType tf set nowrap   " Terraform
endif

" Web
if has("autocmd")
  autocmd FileType haml set nowrap
  autocmd FileType sass set textwidth=0
  " autocmd BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!
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

" Functions and commands
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

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ","), "\n")
endfunction

" Plugin configuration
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_working_path_mode = 'a'
let g:ruby_indent_private_protected_style = 'indent'
let g:yankring_history_dir = '~/.vim'

" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vt :VimuxPromptCommand("ruby -Itest " . bufname("%"))<CR>
map <Leader>dt :VimuxPromptCommand("docker-compose exec web ruby -Itest " . bufname("%"))<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>

" Automation
if has("autocmd")
  autocmd BufWritePost */suckless/*/config.h !make && sudo make install
endif

" Host specific config
let hostfile = $HOME . '/.vim/vimrc-' . substitute(hostname(), "\\..*", "", "")
if filereadable(hostfile)
  exe 'source ' . hostfile
endif
