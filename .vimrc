" BASIC OPTIONS --------------------------------------------------------------------------------
"{{{
" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable filetype detection. Vim will detect the type of file in use
filetype on

" Enable plugins and load plugin for the detected filetype
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Turn syntax highlighting on 
syntax on

" Add numbers to each line on the left hand side
set number

" Highlight cursor line underneath the cursor horizontally
" set cursorline
set nocursorline

" Highlight the cursor vertically
set nocursorcolumn
" set cursorcolumn

" Set tab width to 4 columns
set tabstop=4


" Vim search options and configurations

" While searching through a file, incrementally highlight matching characters as you type
set incsearch
" Make search CaPs sensitive if caps are typed
set smartcase
" Highlight the searched letters
set hlsearch
" Show matching words during a search
set showmatch

" Show the mode you are on in the last line
set showmode

" Show the command you type in the last line of the screen
set showcmd


" Enable autocompletion menu after pressing tab for vim commands and ignore certain filetypes with :e

set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" Make wildmenu behave similar to Bash completion
set wildmode=list:longest

"}}}
" PLUGINS-------------------------------------------------------------------------------------
"{{{
" Vim plugin code goes here

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'


call plug#end()

" }}}
" MAPPINGS-----------------------------------------------------------------------------------
"{{{
" Key mapping code goes here
" Mapping capslock to the escape key
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"You can split the window in vim by typing :vsplit for vertical split or
":split for horizontal split
"The keybind for vsplit is CTRL+W->V and for split, it's CTRL+W->S
"To switch between those windows, use CTRL+<H,J,K,L>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"Resize the split windows using CTRL+SHIFT+<H,J,K,L>
noremap <c-s>k <c-w>+
noremap <c-s>j <c-w>-
noremap <c-s>h <c-w><
noremap <c-s>l <c-w>>

"NERDTree Specific Mappings
"NerdTree is that one weird directory file manager that I still sort of need
"to learn
"Map SHIFT+F to opening nerdtree
nnoremap <s-f> :NERDTreeToggle<cr>

" }}}
" VIMSCRIPT--------------------------------------------------------------------------------
"{{{
" This will enable code folding 
" Using the marker method of folding
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

"If the current file is html, set indentation to 2 spaces
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

"if vim version is equal to or greater than 7.3 enable undofile
"This allows you to undo changes to a file even after saving it
if version >=703
		set undodir=~/.vim/backup
		set undofile
		set undoreload=10000
endif

"}}}
" STATUS LINE-----------------------------------------------------------------------------
"{{{
" Status bar code goes here

"Clear status line when vimrc is reloaded
set statusline=

"Status line left side
set statusline+=\ %F\ %M\ %Y\ %R
"%F -> Display full path of current file
"%M -> Modified flag shows if file is unsaved
"%Y -> Type of file in buffer
"%R -> Displays the read-only flag

"Use a divider to separate the left and right sides
set statusline+=%=

"Status line right side
set statusline+=\[%l\,%c\]\ percent:%p%%

"Show the status on the second to last line
set laststatus=2

"}}}
