"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc.vim', { 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tomtom/tcomment_vim'

let g:airline_powerline_fonts=1
NeoBundle 'bling/vim-airline'

NeoBundle 'wincent/command-t'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'Raimondi/delimitMate'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  " let g:solarized_visibility="high"
  let g:solarized_contrast="high"
  colo solarized
endif

if has('gui_running')
  " http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  set background=dark
  colo solarized
  set lines=48 columns=144
endif
set laststatus=2

nnoremap <F2> :NERDTreeToggle<CR>

if has("gui_macvim")
  map <D-t> :CommandT<CR>
endif

let g:agprg="/usr/bin/ag --column --hidden"
let mapleader=','
