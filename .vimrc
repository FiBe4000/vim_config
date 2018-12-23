
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""Vundle""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

"Plugins go here
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'raimondi/delimitmate'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'thaerkh/vim-indentguides'
Plugin 'majutsushi/tagbar'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'zchee/deoplete-clang'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
"Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Plugins """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""" Deoplete """"""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
let g:deoplete#enable_smart_case = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" completion bracket
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""" Delimitmate """"""""""""""""""""""""""""""""""
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""" NERDTree  """""""""""""""""""""""""""""""""""
let NERDTreeMinimalUI = 1

" Close Vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""" Tagbar """""""""""""""""""""""""""""""""""""
let g:tagbar_compact = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""" Airline """"""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""" Indentguides """"""""""""""""""""""""""""""""""
" Stop vim-indentguides to set list
let g:indentguides_toggleListMode=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""" Polyglot """""""""""""""""""""""""""""""""""
let g:polyglot_disabled = ['c']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Keymaps """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap leader
let mapleader = ","

" Turn off search highlighting after a search by hitting Enter
nnoremap <silent> <CR> :noh<CR><CR>

" Key map for toggling NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Key map for toggling Tagbar
nnoremap <silent> <F3> :TagbarToggle<CR>

map <silent> ,i :IndentGuidesToggle<CR>
map <silent> ,f :NERDTreeToggle<CR>

" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" General Settings """""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change title of shell window
set title

" Persistent undo
set undofile
set undodir=~/.vim/undodir

" Show commands
set showcmd

" Show cursor position
set ruler

" Turn off sound
set noeb

" Set fixed window height
set wfh

" Set Python version
set pyxversion=3

" Set encoding
set encoding=UTF-8

" Save info from last session
set vi=%,'50
set vi+=\"100,:100
set vi+=n~/.viminfo

" Set linebreak on 500 characters
set lbr
set tw=500

" Display line numbers and use width 3
set nu
set numberwidth=3
set relativenumber

" Enable mouse
set mouse=a

" Make backspace better
set backspace=2

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" Remove buffer when closing tab
set nohidden

" Open vertical splits to the right and horizontal splits below
set splitbelow
set splitright

" Search for tags file to use
set tags =./tags

" Decrease update time
set updatetime=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" Programming """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins and syntax highlighting
filetype on
filetype plugin on
filetype indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Tab settings
set softtabstop=2
set shiftwidth=2

" Use smart tabs
set smarttab

" Spaces instead of tab
set expandtab

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Enable folding but open files unfolded
set foldmethod=syntax
set nofoldenable

" Use wildmenu for command completion
set wildmenu
set wildmode=list:longest,full

" Delete trailing whitespaces
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" Visuals """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colors and colorscheme
set t_Co=256
set background=dark
colorscheme solarized

" Highlight current line
set cursorline

" Highlight columns after column 80
let &colorcolumn=join(range(81,999),",")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" Functions """""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""" Restore cursor position to where it was before (borrowed function) """"""
augroup JumpCursorOnEdit
    au!
        autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
    "Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""" Delete trailing whitespaces (borrowed function) """"""""""""""""
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""" Automatic toggling between line nr modes """""""""""""""""""
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

