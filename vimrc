" version 0.2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Essential
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable vi compatible mode
set nocompatible
let s:cpo_save=&cpo
set cpo&vim
" see where an option was last set when checking for its value
" set verbose=1
":verbose au
":verbose hi
":verbose set sts

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


" the directories where to search for vim scripts and help tags
set runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after
" handwritten stuff is synchronized on git
set runtimepath+=~/dotfiles/vim
" add Vundle plugin manager to rtp
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugin and script bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" github scripts
Bundle 'MarcWeber/vim-addon-local-vimrc'

Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'Shougo/unite-session'
Bundle 'hrsh7th/vim-unite-vcs'
Bundle 'hrsh7th/vim-versions'

" list open buffers in a split
" Bundle 'fholgado/minibufexpl.vim'
" Bundle 'techlivezheng/vim-plugin-minibufexpl'
" Bundle 'vim-scripts/buftabs'

" asynchronous execution of external commands
Bundle 'tpope/vim-dispatch'
" When using ,b on normal mode, it will compile the
" project
nmap <LEADER>b :Make! -j<CR>
nmap <LEADER>B :Make! clean <bar> :Make! -j<CR>

" load cscope and add some shortcuts
Bundle 'brookhong/cscope.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'Raimondi/delimitMate'
let delimitMate_expand_space = 1
Bundle 'Raimondi/YAIFA'
Bundle 'kana/vim-smartinput'
Bundle 'sethwoodworth/vim-cute-python'
Bundle 'SirVer/ultisnips'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-function'
Bundle 'coderifous/textobj-word-column.vim'

" show recent modifications in a tree
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

Bundle 'eagletmt/ghcmod-vim'
Bundle 'Twinside/vim-haskellConceal'

" run ack directly and put results in location list
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'Chiel92/vim-autoformat'

Bundle 'vim-scripts/bufkill.vim'


" autoindent pasted text
Bundle 'sickill/vim-pasta'

" upgrade clearance
Bundle 'chrisbra/SudoEdit.vim'

" isolate part of a buffer
Bundle 'chrisbra/NrrwRgn'

if v:version > 703 || (v:version == 703 && has('patch584'))
  Bundle 'Valloric/YouCompleteMe'
  let g:ycm_confirm_extra_conf = 0
  let g:ycm_complete_in_comments = 1
  let g:ycm_allow_changing_updatetime = 0
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_key_invoke_completion = '<C-TAB>'
endif
Bundle 'scrooloose/syntastic'
Bundle 'mhinz/vim-signify'
Bundle 'pydave/AsyncCommand'

" Bundle 'autoload_cscope.vim'
Bundle 'vimwiki'

Bundle 'vim-scripts/Boost-Build-v2-BBv2-syntax'

" Bundle 'chriskempson/base16-vim'
" Bundle 'w0ng/vim-hybrid'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" reload an open file if it is changed from outside
set autoread

" don't update the display while executing macros
set lazyredraw

" fast saving
nmap <leader>w :w!<cr>

" remove trailing whitespaces on save
autocmd BufRead,BufWritePre * if ! &bin | silent! %s/\s\+$// | endif

" search from current directory upwards for ctags file
set tags+=tags;/

" ignore the following file endings completely
set wildignore=*.swp,*.o,*.oo,*.pyc,*.info,*.aux,*.dvi,*.bbl,*.blg
set wildignore+=*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc
set wildignore+=*/tmp/*,*.so,*.a,*.la,*.zip,*.bz2,*.gz,*.tar

" give the following file endings less priority
set suffixes=.bak,~,.log,.h,.P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable

" set colors and font according to preferences
colorscheme desert_mod
set guifont=Anonymous\ Pro\ for\ Powerline\ 11
" set guifont=Anonymous\ Pro\ 11

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" enable the pop-up-list for command and argument completion in
" command mode
set wildmenu
set wildmode=list:longest,full

" show the current cursor position (line,column and file %)
set ruler

" do not ask for confirmation after displaying messages
set shortmess+=filmnrxoOtT

" make the command bar 2 lines high
set cmdheight=2

" highlight current line
set cursorline

" let backspace traverse line breaks and delete indentations
" in indentation step size (tabstop)
set backspace=indent,eol,start

" enable case sensitive searches when the search term contains
" upper case characters, otherwise not
set ignorecase
set smartcase

" highlight search results
set hlsearch
" search as you type
set incsearch

" enable auto indentation and set tab width
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
" always convert tabs to spaces
set expandtab

" set \m to default for regexes
" set magic " this is the default

" the mode is indicated by powerline if available
set noshowmode

" enable extended % matching
runtime macros/matchit.vim

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

set encoding=utf-8
set list listchars=tab:¦\ ,trail:˽
"set listchars=tab:▶\ ,eol:★
"set listchars+=trail:◥
set listchars+=extends:❯ "〉
set listchars+=precedes:❮


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings for MBE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:miniBufExplorerMoreThanOne = 1 " next version: let g:miniBufExplBuffersNeeded = 1
"let g:miniBufExplForceSyntaxEnable = 1

" If you like <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
"
" noremap <C-TAB> :MBEbn<CR>
" noremap <C-S-TAB> :MBEbp<CR>
"
" Or, in MRU fashion
"
noremap <C-TAB> :MBEbf<CR>
noremap <C-S-TAB> :MBEbb<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line Mode Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Ctrl-Space: Show history
cnoremap <c-@> <c-f>

cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-f> <left>
cnoremap <c-g> <right>

" Ctrl-Delete: Delete previous word. HACK ALERT! Ctrl-Delete sends d in iTerm2
cnoremap <c-d> <c-w>

" Ctrl-v: Paste
cnoremap <c-v> <c-r>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings for Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.svn/',
      \ '\.hg/',
      \ 'BoostBuild/',
      \ '\.o$',
      \ '\.so$',
      \ '\.a$',
      \ '\.la$',
      \ ], '\|'))

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
" nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Quick vcs
nnoremap <silent> [unite]v :<C-u>Unite -buffer-name=vcslog vcs/log<CR>

nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_data_directory = '~/.cache/unite'
let g:unite_update_time = 200
let g:unite_source_file_mru_limit = 10
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
" Match whole word only. This might/might not be a good idea
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't write backup files, they clutter your fs folders and
" you won't know the state of your file after a recover...
"set nobackup
"set nowb
set noswapfile

" If you like control + vim direction key to navigate
" windows then perform the remapping
"
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

noremap <leader>h : help <C-R>=expand("<cword>")<CR><CR><C-W>p

" delete without yanking
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

noremap <C-Right> l
noremap <C-Left> h
noremap <C-Up> k
noremap <C-Down> j

if has ('balloon_eval')
  set balloondelay=100
endif
set noequalalways
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set mouse=a
set showmatch
set termencoding=utf-8
set updatetime=300
" vim: set ft=vim :

function! CloseHiddenBuffers()
  let lastBuffer = bufnr('$')
  let currentBuffer = 1
  while currentBuffer <= lastBuffer
    if bufexists(currentBuffer) && buflisted(currentBuffer) && bufwinnr(currentBuffer) < 0
      execute 'bdelete' currentBuffer
    endif
    let currentBuffer = currentBuffer + 1
  endwhile
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


" press j+k to escape from insert mode
inoremap jk <ESC>
inoremap kj <ESC>


" nnoremap <C-L> :nohlsearch<CR><C-L>

" do not beep or flash
" important: t_vb= must be set in gvimrc as well!
set noerrorbells
set visualbell
set t_vb=

" the timeout for key combinations and mappings
set timeoutlen=500


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" language specific settings
let c_space_errors = 1

" use patched fonts for powerline
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""
" => Filetype specific settings
""""""""""""""""""""""""""""""
filetype plugin indent on
autocmd FileType python setlocal sw=2 sts=2 noexpandtab
autocmd FileType haskell call QuickFixHaskell()

" Close the QuickFix window just with the q
au FileType qf nnoremap <buffer> q :<C-u>cclose<CR>

" After compiling, open the QuickFix window if there
" is any error
au QuickFixCmdPost make call OpenQuickFixBuffer()
au QuickFixCmdPost AsyncMake call OpenQuickFixBuffer()

" Column scroll-binding on <leader>sb
noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc,.gvimrc nested
    \ source $MYVIMRC | if has ('gui_running') | source $MYGVIMRC | endif
endif

" whitelist for .lvimrcs
let localvimrc_whitelist=[]

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}TimeStamp \).*#\1' .
          \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun

let g:UltiSnipsExpandTrigger="<c-l>"

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = split(filter(split(&fillchars, ','), 'v:val =~# "fold"')[0], ':')[-1]
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let length = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g'))
  return foldtextstart . repeat(foldchar, winwidth(0)-length) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2

" This will set the variables that QuickFix needs
" in order to compile, if you are on a project that
" has a cabal file, use "cabal build", otherwise
" use "ghc --make" on the current file
function! QuickFixHaskell()
  let l:cabalFilePresent = filereadable(glob('*.cabal'))
  if l:cabalFilePresent
    setl makeprg=cabal\ build
  else
    let l:currentFile = expand('%')
    if !exists('b:qfOutputdir')
      let b:qfOutputdir = tempname()
      call mkdir(b:qfOutputdir)
    endif
    let &l:makeprg = 'ghc --make % -outputdir ' . b:qfOutputdir
  endif
" Previous format given by Martin Norbäck
"setl errorformat+=%A%f:%l:\ %m,%A%f:%l:,%C%\\s%m,%Z
" New format taken from haskellmode.vim
  setl errorformat=
                   \%-Z\ %#,
                   \%W%f:%l:%c:\ Warning:\ %m,
                   \%E%f:%l:%c:\ %m,
                   \%E%>%f:%l:%c:,
                   \%+C\ \ %#%m,
                   \%W%>%f:%l:%c:,
                   \%+C\ \ %#%tarning:\ %m,
endfunction

function! OpenQuickFixBuffer()
  let qflist = getqflist()
  if empty(qflist)
    cclose
  else
    cwindow
  endif
endfunction

function! s:ExecuteInShell(command, bang)
  let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

  if (_ != '')
    let s:_ = _
    let bufnr = bufnr('%')
    let winnr = bufwinnr('^' . _ . '$')
    silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
    silent! :%d
    let message = 'Execute ' . _ . '...'
    call append(0, message)
    echo message
    silent! 2d | resize 1 | redraw
    silent! execute 'silent! %!'. _
    silent! execute 'resize ' . line('$')
    silent! execute 'syntax on'
    silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
    silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
    silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
    nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
    silent! syntax on
  endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell
