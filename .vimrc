set nocompatible
filetype off

"Setup Vundle, the plugin manager
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

"Plugins goes here
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

call vundle#end()
filetype plugin indent on

"Show commands
set showcmd

"Show cursor position
set ruler

"Turn off sound
set noeb

"Save info from last session
set vi=%,'50
set vi+=\"100,:100
set vi+=n~/.viminfo

"Enable filetype plugins and syntax highlighting
filetype on
filetype plugin on
filetype indent on
syntax enable
set grepprg=grep\ -nH\ $*

"Colorscheme and more precise colors
colorscheme desert
set t_Co=256

"Grey line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"1 tab == 4 spaces
set softtabstop=4
set shiftwidth=4

"Use smart tabs
set smarttab

"Spaces instead of tab
set expandtab

set ai   "Auto indent
set si   "Smart indent
set wrap "Wrap lines

"For Python, 1 tab == 2 spaces
autocmd Filetype python setlocal expandtab shiftwidth=2 softtabstop=2

"Set linebreak on 500 characters
set lbr
set tw=500

"Display line numbers and use width 3
set nu
set numberwidth=3

"Enable folding but open files unfolded
set foldmethod=syntax
set nofoldenable

"Use wildmenu for command completion
set wildmenu
set wildmode=list:longest,full

"Enable mouse
set mouse=a

"Make backspace better
set backspace=2

"Make searching better (in my opinion)
set ignorecase
set smartcase
set incsearch
set hlsearch

"Turn off search highlighting after a search by hitting Enter
nnoremap <CR> :noh<CR><CR>

"Remove buffer when closing tab
set nohidden

"Highlight current line
set cursorline

"Always show status line
"set laststatus=2

"Don't confirm whether to use .ycm_extra_conf.py (for code completion) every time a file is opened
let g:ycm_confirm_extra_conf=0

"Restore cursor position to where it was before (borrowed function)
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

"Delete trailing whitespaces for python and coffee (borrowed function)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

