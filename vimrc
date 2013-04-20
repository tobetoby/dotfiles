" version 0.1


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

Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|BoostBuild$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.P$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_max_height = 20
" let g:ctrlp_extensions = ['tag']


" list open buffers in a split
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplorerMoreThanOne = 1 " next version: let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplForceSyntaxEnable = 1

" load cscope and add some shortcuts
Bundle 'brookhong/cscope.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'Raimondi/delimitMate'
Bundle 'Raimondi/YAIFA'
Bundle 'sethwoodworth/vim-cute-python'

" show recent modifications in a tree
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Twinside/vim-haskellConceal'
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'Chiel92/vim-autoformat'

" autoindent pasted text
Bundle 'sickill/vim-pasta'

" upgrade clearance
Bundle 'chrisbra/SudoEdit.vim'

if v:version > 703 || (v:version == 703 && has('patch584'))
  Bundle 'Valloric/YouCompleteMe'
  let g:ycm_confirm_extra_conf = 0
endif
Bundle 'scrooloose/syntastic'
Bundle 'pydave/AsyncCommand'

" Bundle 'autoload_cscope.vim'
Bundle 'vimwiki'

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

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

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
" set guifont=Anonymous\ Pro\ for\ Powerline\ 11
set guifont=Anonymous\ Pro\ 11

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" enable the pop-up-list for command and argument completion in
" command mode
set wildmenu
set wildmode=list:full

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

" enable auto indentation and set tab width
set smartindent
set shiftwidth=2
set softtabstop=2
" always convert tabs to spaces
set expandtab

" enable extended % matching
runtime macros/matchit.vim

set encoding=utf-8
set list listchars=tab:¦\ ,trail:˽
"set listchars=tab:▶\ ,eol:★
"set listchars+=trail:◥
set listchars+=extends:❯ "〉
set listchars+=precedes:❮

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't write backup files, they clutter your fs folders and
" you won't know the state of your file after a recover...
set nobackup
set nowb
set noswapfile

"noremap  h
"noremap <NL> j
"noremap  k
"noremap  l

" If you like control + vim direction key to navigate
" windows then perform the remapping
"
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" If you like <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
"
noremap <C-TAB> :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>
"
" Or, in MRU fashion
"
" noremap <C-TAB> :MBEbf<CR>
" noremap <C-S-TAB> :MBEbb<CR>

"noremap <C-[> : cs find s <C-R>=expand("<cword>")<CR><CR>
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

set balloondelay=100
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
" When using ,b on normal mode, it will compile the
" project
nmap <LEADER>b :<C-u>AsyncMake -j<CR><CR>
nmap <LEADER>B :<C-u>AsyncMake clean <bar> :<C-u>AsyncMake -j<CR><CR>

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
  autocmd bufwritepost .vimrc source $MYVIMRC
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
