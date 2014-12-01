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
NeoBundle 'bling/vim-airline'
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
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'swaroopch/vim-markdown-preview'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-commentary'

NeoBundle 't9md/vim-chef', {'name': 't9md-vim-chef'}
NeoBundle 'dougireton/vim-chef', {'name': 'dougireton-vim-chef'}

NeoBundle 'Shougo/neocomplete.vim'


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
  colo solarized
endif

if has('gui_running')
  " http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 16
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
" airline and bufferline config
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1


" http://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
inoremap <C-S-v> <C-o>"+p
vmap <C-S-v> "+p
vmap <C-S-c> "+y

" {{{ Shougo/neocomplete.vim
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" }}}

" {{{ Shougo/neosnippet.vim

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets by 'honza/vim-snippets'
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" will change the behavior of the <Enter> key when the popup menu is visible.
" In that case the Enter key will simply select the highlighted menu item,
" just as <C-Y> does.
" inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

" remove 'Related' from default, I want to find 'Related' explicitly.
let g:chef.any_finders = ['Attribute', 'Source', 'Recipe', 'Definition']

function! s:SetupChef()
    " Mouse:
    " Left mouse click to GO!
    nnoremap <buffer> <silent> <2-LeftMouse> :<C-u>ChefFindAny<CR>
    " Right mouse click to Back!
    nnoremap <buffer> <silent> <RightMouse> <C-o>

    " Keyboard:
    nnoremap <buffer> <silent> <M-a>      :<C-u>ChefFindAny<CR>
    nnoremap <buffer> <silent> <M-f>      :<C-u>ChefFindAnySplit<CR>
    nnoremap <buffer> <silent> <M-r>      :<C-u>ChefFindRelated<CR>
endfunction


