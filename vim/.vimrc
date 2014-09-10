"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim
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
"NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'bling/vim-airline'
"NeoBundle 'wincent/command-t'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "honza/vim-snippets"
NeoBundle 'vadv/vim-chef'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'airblade/vim-gitgutter'
" NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'scrooloose/nerdcommenter'
" NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'swaroopch/vim-markdown-preview'
"NeoBundle 'suan/vim-instant-markdown'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"End NeoBundle Scripts-------------------------

if ($COLORTERM == 'gnome-terminal') || ($TERM == 'screen-256color')
  set t_Co=256
  set background=dark
  let g:solarized_termcolors=256
  " let g:solarized_termtrans=1
  " let g:solarized_visibility="high"
  " let g:solarized_contrast="high"
  colo solarized
  " colo wombat256
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
  set lines=60 columns=119
endif
set laststatus=2

let mapleader=','

" http://ua.opennet.ru/openforum/vsluhforumID15/1390.html
" http://ru.wikibooks.org/wiki/Vim

set keymap=russian-jcukenwin " use Ctrl+^ to switch to toggle russian
set iminsert=0 " latin layout by default
set imsearch=0 " latin layout  while searching by default
set iskeyword=@,48-57,_,192-255

set hidden
set virtualedit=all

let NERDTreeWinSize = 30
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <silent> <leader>u :GundoToggle<CR>
" https://github.com/AndrewRadev/switch.vim
nnoremap - :Switch<cr>

au FileType ruby,eruby set filetype=ruby.eruby.chef
au FileType vim,sh,javascript,ruby,eruby setl sw=2 sts=2 et ai

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

let g:ctrlp_clear_cache_on_exit = 0
let g:is_bash = 1
let g:agprg = "/usr/bin/ag --column --hidden"

let g:backupdir = '~/.vim/backup'
let g:tmpdir = '/tmp'
if !isdirectory(expand(g:backupdir))
  call mkdir(g:backupdir, 'p')
endif
" where to put backup file
execute 'set backupdir=' . g:backupdir
set backup " make backup file and leave it around
" where to put swap file
execute 'set directory=' .  g:tmpdir
if has('persistent_undo')
  " store undofiles in a tmp dir
  execute 'set undodir=' . g:tmpdir
  set undofile " enable persistent undo
endif

" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd FileType vim,python,sh,ruby,eruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" https://github.com/edkolev/tmuxline.vim
let g:airline#extensions#tmuxline#enabled = 0

" http://superuser.com/questions/701496/no-syntax-highlight-on-md-files
" autocmd BufRead,BufNew *.md set filetype=markdown
" https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype markdown map <F5> :MarkdownPreview<CR>
autocmd Filetype markdown map <leader>r :MarkdownPreview<CR>

" http://vim.wikia.com/wiki/Redirect_g_search_output
" http://stackoverflow.com/questions/2573021/how-to-redirect-ex-command-output-into-current-buffer-or-file
nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:setlocal bt=nofile<CR>:put! a<CR>

" https://github.com/klen/.vim/blob/master/rc.vim
" Allow command line editing like emacs
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Buffer commands
noremap <silent> ,bp :bp<CR>
noremap <silent> ,bn :bn<CR>
noremap <silent> ,bd :bd<CR>
noremap <silent> ,be :CtrlPBuffer<CR>


" https://github.com/bling/vim-bufferline/issues/3
" bufferline config
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1

"autocmd VimEnter *
"\ let &statusline='%{bufferline#refresh_status()}' . bufferline#get_status_string()

"" airline config
"let g:airline_powerline_fonts = 1
"if $USER=='root'
  "let g:airline_theme = 'light'
"else
  "let g:airline_theme = 'laederon'
"endif


set shell=zsh\ --login
