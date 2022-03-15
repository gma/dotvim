function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Plugins loaded at start
  call minpac#add('benmills/vimux')
  call minpac#add('fnune/base16-vim')
  call minpac#add('gabrielelana/vim-markdown')
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('itspriddle/vim-shellcheck')
  call minpac#add('jremmen/vim-ripgrep')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kchmck/vim-coffee-script')
  call minpac#add('kien/ctrlp.vim')
  call minpac#add('lepture/vim-jinja')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('msanders/snipmate.vim')
  call minpac#add('mustache/vim-mustache-handlebars')
  call minpac#add('mxw/vim-jsx')
  call minpac#add('nelstrom/vim-textobj-rubyblock')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('pearofducks/ansible-vim')
  call minpac#add('posva/vim-vue')
  call minpac#add('psf/black')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('sunaku/vim-ruby-minitest')
  call minpac#add('tpope/vim-bundler')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-git')
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-rake')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('fatih/vim-go')
  call minpac#add('vim-ruby/vim-ruby')
  call minpac#add('vim-scripts/YankRing.vim')
  call minpac#add('vim-scripts/indentpython.vim')
  call minpac#add('vim-test/vim-test')

  " Optional plugins, load them with `:packadd <name>`
endfunction

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" base16-theme and vim-airline-themes
let base16colorspace=256
let theme = 'base16-' . readfile(expand('~/.config/base16-theme'))[0]
execute('colorscheme ' . theme)
let g:airline_theme = join(split(theme, '-'), '_')

" ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'a'

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //2<CR>

" fzf.vim
nmap <leader>ff :Files<cr>
nmap <leader>fg :GFiles<cr>
nmap <leader>fl :Lines<cr>
nmap <leader>fL :BLines<cr>
nmap <leader>fc :Commits<cr>
nmap <leader>fC :BCommits<cr>
nmap <leader>ft :Tags<cr>
nmap <leader>fm :Maps<cr>

" markdown
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

" nerdcommenter
let NERDSpaceDelims=1

" vim-ruby
let g:ruby_indent_private_protected_style = 'indent'

" vim-test
let test#strategy = "vimux"
let g:test#echo_command = 0
let g:test#preserve_screen = 1

let test#ruby#minitest#executable = 'docker compose exec web ruby -Itest'

nmap <silent> <leader>Tn :TestNearest<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>Ts :TestSuite<CR>
nmap <silent> <leader>Tl :TestLast<CR>
nmap <silent> <leader>Tv :TestVisit<CR>

" vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>

" YankRing
nmap <leader>y :YRShow<CR>
let g:yankring_history_dir = '~/.vim'
