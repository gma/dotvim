function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Plugins loaded at start
  call minpac#add('benmills/vimux')
  call minpac#add('davidhalter/jedi-vim')
  call minpac#add('fnune/base16-vim')
  call minpac#add('gabrielelana/vim-markdown')
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('itspriddle/vim-shellcheck')
  call minpac#add('jremmen/vim-ripgrep')
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

  " Optional plugins, load them with `:packadd <name>`
endfunction

" Plugin settings

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
