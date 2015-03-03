"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
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
NeoBundle 'bling/vim-airline'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle "tomtom/tlib_vim"
" NeoBundle "garbas/vim-snipmate"
NeoBundle 'vadv/vim-chef'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-markdown'
" NeoBundle 'swaroopch/vim-markdown-preview'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-commentary'

NeoBundle 't9md/vim-chef', {'name': 't9md-vim-chef'}
NeoBundle 'dougireton/vim-chef', {'name': 'dougireton-vim-chef'}
" NeoBundle 'Shougo/neocomplete.vim'

" http://vimcasts.org/blog/2010/12/a-text-object-for-ruby-blocks/
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-vspec'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nvie/vim-flake8'

NeoBundle 'sirver/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'dougireton/vim-json'
" NeoBundle 'ConflictMotions'

" TODO: use https://github.com/gmarik/Vundle.vim/blob/v0.10.2/doc/vundle.txt#L372-L396

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"End NeoBundle Scripts-------------------------

if ($COLORTERM == 'gnome-terminal') || ($TERM == 'screen-256color') || ($TERM == 'xterm-256color')
  let g:solarized_termcolors=256
  set t_Co=256
  colo solarized
endif

if has('gui_running')
  " http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  if has("mac")
    set guifont=Monaco\ for\ Powerline:h15
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 16
  endif
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

au FileType yaml,vim,sh,zsh,javascript,ruby,eruby setl sw=2 sts=2 et ai

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

let g:ctrlp_clear_cache_on_exit = 0
let g:is_bash = 1
let g:agprg = "/usr/bin/ag --column --hidden"

let g:backupdir = $HOME . '/.vim/backup'
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
noremap <silent> ,ls :CtrlPBuffer<CR>

" https://github.com/bling/vim-bufferline/issues/3
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1

" http://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
inoremap <C-S-v> <C-o>"+p
vmap <C-S-v> "+p
vmap <C-S-c> "+y

" https://github.com/t9md/vim-chef/blob/master/doc/chef.txt#L185
au BufNewFile,BufRead */*cookbooks/*  call s:SetupChef()
function! ChefNerdTreeFind(env)
    try
        :NERDTreeFind
        let scrolloff_orig = &scrolloff
        let &scrolloff = 15
        normal! jk
        wincmd p
    finally
        let &scrolloff = scrolloff_orig
    endtry
endfunction

let g:chef = {}
let g:chef.hooks = ['ChefNerdTreeFind']
let g:chef.any_finders = ['Attribute', 'Source', 'Recipe', 'Definition']

function! s:SetupChef()
    nnoremap ,a :<C-u>ChefFindAny<CR>
    nnoremap ,r :<C-u>ChefFindRelated<CR>
endfunction

runtime macros/matchit.vim

nmap ,t :TagbarToggle<CR>

" https://github.com/scrooloose/syntastic/issues/1118
" let g:syntastic_javascript_checkers=['jsonlint']
" let g:Synstatic_javascript_jslint_conf="~/.jshintrc"
let g:syntastic_aggregate_errors=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'         " Error Symbol
let g:syntastic_warning_symbol='⚠'       " Warning Symbol
let g:syntastic_style_error_symbol='✗'   " Style Error Symbol
let g:syntastic_style_warning_symbol='⚠' " Style Warning Symbol


" https://vimeo.com/93364612
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" https://github.com/nathanaelkane/vim-indent-guides/issues/24
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

"https://github.com/dougireton/vim-json
let g:vim_json_syntax_conceal = 0
