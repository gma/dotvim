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
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('lepture/vim-jinja')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('msanders/snipmate.vim')
  call minpac#add('mustache/vim-mustache-handlebars')
  call minpac#add('mxw/vim-jsx')
  call minpac#add('nelstrom/vim-textobj-rubyblock')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('pantharshit00/vim-prisma')
  call minpac#add('pearofducks/ansible-vim')
  call minpac#add('posva/vim-vue')
  call minpac#add('psf/black')
  call minpac#add('sunaku/vim-ruby-minitest')
  call minpac#add('tpope/vim-bundler')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-git')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-rake')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('vim-ruby/vim-ruby')
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

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //2<CR>

" fzf.vim
nnoremap <C-p> :Files<cr>
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fc :Commits<cr>
nnoremap <leader>fb :BCommits<cr>
nnoremap <leader>fC :Commands<cr>
nnoremap <leader>fh :Helptags<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fm :Maps<cr>

" markdown
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

" vim-ruby
let g:ruby_indent_private_protected_style = 'indent'

" vim-test
let test#strategy = "vimux"
let g:test#echo_command = 0
let g:test#preserve_screen = 1

let test#ruby#minitest#executable = 'docker compose exec web ruby -Itest'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>
