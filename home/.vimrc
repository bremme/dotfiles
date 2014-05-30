
set nocompatible              " be iMproved, required
filetype off                  " required
""set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

  Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
  Plugin 'scrooloose/nerdtree'
  Plugin 'sjl/gundo.vim.git'
  Plugin 'tpope/vim-fugitive' " git plugin
  Plugin 'tpope/vim-commentary'
  Plugin 'kien/ctrlp.vim'

  "Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex' "latex support
  Plugin 'LaTeX-Box-Team/LaTeX-Box'
  Plugin 'bling/vim-airline' "lean & mean status/tabline for vim that's light as air.

  Plugin 'Valloric/YouCompleteMe' " Code completion
  Plugin 'ervandew/supertab'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'scrooloose/nerdcommenter'

  "----Syntax highlighting--------------------------------------------------------
  Plugin 'plasticboy/vim-markdown' " Markdown 
  Plugin 'digitaltoad/vim-jade' " Jade 

  "----THEMES---------------------------------------------------------------------
  Plugin 'tomasr/molokai' " Color themes

"----Intactive------------------------------------------------------------------
" Plugin 'fholgado/minibufexpl.vim'
" Plugin minibufexpl.vim
" Plugin 'msanders/snipmate.vim.git'
" Plugin 'garbas/vim-snipmate'

"" The following are examples of different formats supported.
"Plugin 'tpope/vim-fugitive' (github)
"Plugin 'L9' (vim-script.org)
"Plugin 'git://git.wincent.com/command-t.git' (non github)
"Plugin 'file:///home/gmarik/path/to/plugin' (local machine)

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

"----Theming & Color-----------------------------------------------

" Enable syntax highlighting
syntax enable
if ! has("gui_running")
    set t_Co=256
endif
colorscheme molokai


"----EDITOR---------------------------------------------------------------------

"enable copy/paste from/to X11 clipboard (important! make <C-S-v> and middle
"click work)
set clipboard=unnamedplus,unnamed

"give column 80 a color
set colorcolumn=81

" show white spaces
set list
set listchars=tab:→\ ,trail:·,nbsp:·

"set a fold column (to display the folds)
set foldcolumn=4

" Custom highlight for spellchecking
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" where it should get the dictionary files
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

"Switch between buffers without saving
set hidden

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
" set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
" set nostartofline

" Always display the status line, even if only one window is displayed
set laststatus=2

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

"----Searching------------------------------------------------------------------ 

" Highlight searches 
set hlsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Makes search act like search in modern browsers
set incsearch

"----TextWrapping---------------------------------------------------------------

" softwrap text at full words
set wrap linebreak nolist

"----Indentation----------------------------------------------------------------

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

"----LATEX----------------------------------------------------------------

let g:ycm_filetype_blacklist = {
  \ 'tex' : 1,
  \}

let g:LatexBox_latexmk_options ='-pvc -pdfps -auxdir=build' 
"let g:LatexBox_latexmk_options ='-pvc - pdfps'
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_build_dir='build'
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

"----KEYMAPPINGS---------------------------------------------------------------- 

" Remap the leader key (default is \)
let mapleader = ","
let g:mapleader = ","

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"" Map ctrl-movement keys to window switching
"map <C-k> <C-w><Up>
"map <C-j> <C-w><Down>
"map <C-l> <C-w><Right>
"map <C-h> <C-w><Left>
map <C-n> :NERDTreeToggle<CR>
map <C-g> :GundoToggle<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

"--------NORMALMODE-------------------------------------------------------------
" I like it better to just insert blank lines in normal mode
nnoremap o o<Esc>
nnoremap O O<Esc>

"Saves time; maps the spacebar to colon
nmap <space> :

" workaround for gnome-terminal for <A-x> mapping
" See http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
"let c='a'
"while c <= 'z'
  "exec "set <A-".c.">=\e".c
  "exec "imap \e".c." <A-".c.">"
  "let c = nr2char(1+char2nr(c))
"endw
" move a line of text using ALT-{h,j,k,l} (does not work in termal without a
" hack)
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
"--------INSERTMODE-------------------------------------------------------------

"Map escape key to jj -- much faster
imap jj <esc>

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" move a line of text using ALT-{h,j,k,l} (does not work in termal without a
" hack)
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi

"--------VISUALMODE-------------------------------------------------------------

" move a line of text using ALT-{h,j,k,l} (does not work in termal without a
" hack)
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

"--------LEADER-----------------------------------------------------------------

" other option: cterm=underline 
"turn spellchecking on or off
nnoremap <leader>spu :setlocal spell spelllang=en_us<CR>
nnoremap <Leader>spg :setlocal spell spelllang=en_gb<CR>
nnoremap <Leader>spn :setlocal spell spelllang=nl_nl<CR>
nnoremap <Leader>spo :setlocal nospell<CR> 

" moving between buffers
nnoremap <leader>bj :bprevious<CR>
nnoremap <leader>bk :bnext<CR>
nnoremap <leader>bb :bnext<CR>
nnoremap <leader>bh :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>bd :bd<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :quitall<CR>
nnoremap <leader>qo :only<CR,

nnoremap <leader>rl :source ~/.vimrc<CR>:nohl<CR>
nnoremap <leader>evm :e ~/.vimrc<CR>

"--------COMMANDMODE------------------------------------------------------------

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap W w !sudo tee > /dev/null %

"----NERDTree-------------------------------------------------------------------

" Open NERDtree is no file is openend
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if only NERDtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" turn spellcheck on for .tex, .md
autocmd FileType tex,md setlocal spell spelllang=en_us

"----Window title-------------------------------------------------------------

" Automatically set screen title
let &titlestring = hostname() . ": vim -> " . expand("%:t") 
if &term == "screen"
  set t_ts=^[k
    set t_fs=^[\
  endif
if &term == "screen" || &term == "xterm"
  set title
endif

"----Airline------------------------------------------------

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "dark"


"----CtrlP---------------------------------------------------------------------

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPMRU'


