" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" eva is broken -> mapping for backspace
:imap  <BS>

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
"set mouse=n
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
"--------------------------------------------------------------------------------------------------------------------------------------

" zapíná pathogen
execute pathogen#infect()

" nastavení kompilátoru
" set makeprg=gcc\ -std=c99\ -Wextra\ -Wall\ -pedantic\ -O2\ -o\ %<\ %
autocmd Filetype c setlocal makeprg=gcc\ -std=c99\ -Wextra\ -Wall\ -pedantic\ -O2\ -o\ %<\ %
autocmd Filetype cpp setlocal makeprg=mpic++\ -o\ %<\ %
autocmd Filetype cc setlocal makeprg=mpic++\ -o\ %<\ %
" set makeprg=mpic++\ -o\ %<\ %

" NerdTree
map <F12> :NERDTree<CR>
" uložení aktuálně editovaného souboru F2
 map <F5> :w<cr>
" skok na předchozí chybové hlášení F3
 map <F6> :cp<cr>
" " skok na následující chybové hlášení F4
 map <F7> :cn<cr>
map <F8> :w<cr>:sh<cr>
imap <F8> <Esc>:w<cr>:sh<cr>
" " uložení aktuálně editovaného souboru a spuštění překladu
map <F9> :w<cr>:make<cr>
imap <F9> <Esc>:w<cr>:make<cr>
" " výpis všech chybových hlášení překladače
map <F10> :cl<cr><cr>
nmap <F11> :TagbarToggle<CR>

imap <F6> <C-n>
imap <F5> <Esc>:w<CR>
imap <F4> <Esc>:u<CR><Ins><Right>

" --------------------------------------- Solarized ----------------------
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
if has('gui_running')
        set background=dark
        colorscheme solarized
        set mouse=a
        set ttymouse=xterm
    else
        " set background=dark
        set mouse=n
        set ttymouse=xterm2
    endif

" ---------------------------------------- Omni completion -------------------------------
"set omnifunc=syntaxcomplete#Complete
" vypne vybrání první nápovědy
set completeopt=longest,menuone

"--------------------------------------- nastavení syntastic -------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11'
"------------------------------------------------------------------------------------------------

"map <F9> :w<CR> :!gcc % -o %<.x -Wall -Wextra -pedantic -std=c99 2>errors.err; cat errors.err<CR>
set helplang=cs
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"set helplang=cs
"set ruler
"set showmode
"set nocompatible
"set backspace=2
"set spelllang=cs
"set spell
"syntax on
"set fileencodings=utf-8,latin2

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
