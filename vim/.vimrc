call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'felikz/ctrlp-py-matcher'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'valloric/youcompleteme', {'do': './install.py'}
Plug 'janko-m/vim-test'
" Plug 'justinmk/vim-dirvish'
" Plug 'tpope/vim-dispatch'
" Plug 'python-mode/python-mode'
" Plug 'skywind3000/asyncrun.vim'
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

let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set colorcolumn=+1 "https://github.com/scrooloose/vimfiles/blob/master/vimrc#L82
set hidden

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR><CR>
nnoremap ,ww :w<CR>

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

" make test commands execute using dispatch.vim
" let test#strategy = 'dispatch'

" http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_doc = 0
let g:pymode_folding = 0

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
let mapleader=','

nnoremap ,t :TestNearest<CR>

