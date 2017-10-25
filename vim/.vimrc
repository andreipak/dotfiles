call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'felikz/ctrlp-py-matcher'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'valloric/youcompleteme', {'do': './install.py'}
Plug 'janko-m/vim-test'
Plug 'python-mode/python-mode'
call plug#end()


if ($COLORTERM == 'gnome-terminal') || ($TERM == 'screen-256color') || ($TERM == 'xterm-256color')
  let g:solarized_termcolors=256
  set background=light
  set t_Co=256
  colo solarized
endif

if has('gui_running')
  set guioptions=a
  set guifont=Monaco\ for\ Powerline:h15
  set background=dark
  colo solarized
  set lines=60 columns=119
endif

" http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
let g:backupdir = $HOME . '/.vim/backup'
if !isdirectory(expand(g:backupdir))
  call mkdir(g:backupdir, 'p')
endif

" where to put backup file
execute 'set backupdir=' . g:backupdir
set backup " make backup file and leave it around

let g:tmpdir = $HOME . '/.vim/temp'
if !isdirectory(expand(g:tmpdir))
  call mkdir(g:tmpdir, 'p')
endif

" where to put swap file
execute 'set directory=' .  g:tmpdir
if has('persistent_undo')
  " store undofiles in a tmp dir
  execute 'set undodir=' . g:tmpdir
  set undofile " enable persistent undo
endif

let test#strategy = 'iterm'

" http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

let g:pymode = 1
let g:pymode_breakpoint = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_doc = 0
let g:pymode_folding = 0

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
let mapleader=','

nnoremap ,t	:TestNearest<CR>
nnoremap ,ev	:e $MYVIMRC<CR>
nnoremap ,cd	:cd %:p:h<CR>:pwd<CR><CR> " http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
nnoremap ,ww	:w<CR> " save file
nnoremap ,m	:CtrlPMRUFiles<CR> " open mru dialog
nnoremap ,p	:CtrlP<CR> " open ctrl-p

set completeopt=menuone "no preview window for YCM
set colorcolumn=+1 " column after 'textwidth'
set hidden " keep the changed buffer without saving it 

