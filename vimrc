" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0

" => Essential {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
    " disable vi compatible mode
    set nocompatible
    " handwritten stuff is synchronized on git
    set runtimepath+=~/dotfiles/vim
    " NeoBundle, required
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

filetype off
NeoBundleCheck
"}}}

" => Load Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'MarcWeber/vim-addon-local-vimrc'
" vimproc {{{
NeoBundle 'Shougo/vimproc.vim', {
\ 'build': {
    \ 'mac': 'make -f make_mac.mak',
    \ 'unix': 'make -f make_unix.mak',
    \ 'cygwin': 'make -f make_cygwin.mak',
    \ 'windows': '"C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\nmake.exe" make_msvc32.mak',
  \ },
\ } "}}}
NeoBundle 'pydave/AsyncCommand'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-session'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'hrsh7th/vim-unite-vcs'
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':['tag','tag/file']}}
NeoBundle 'hrsh7th/vim-versions'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'wellle/targets.vim'
NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Valloric/YouCompleteMe', { 'vim_version':'7.3.584'}
NeoBundleLazy 'scrooloose/syntastic', {'autoload' : {'filetypes' : ['python', 'javascript', 'c', 'c++'] } }
NeoBundle 'sjl/gundo.vim'
NeoBundleLazy 'sethwoodworth/vim-cute-python', {'autoload' : {'filetypes' : ['python'] } }
NeoBundleLazy 'Twinside/vim-haskellConceal', {'autoload' : {'filetypes' : ['haskell'] } }
NeoBundleLazy 'eagletmt/ghcmod-vim', {'autoload' : {'filetypes' : ['haskell'] } }
NeoBundle 'vim-scripts/Boost-Build-v2-BBv2-syntax'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'chrisbra/SudoEdit.vim'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'vimwiki'

filetype plugin indent on     " required!
"}}}

" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sets how many lines of history VIM has to remember
set history=1000

" reload an open file if it is changed from outside
set autoread

" don't update the display while executing macros
set lazyredraw

" vim sets terminal title
set title

" sane default
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,default,latin1

set helplang=en

" remove trailing whitespaces on save
" autocmd BufRead,BufWritePre * if ! &bin | silent! %s/\s\+$// | endif

" search from current directory upwards for ctags file
set tags+=tags;/

" ignore the following file endings completely
set wildignore=*.swp,*.o,*.oo,*.pyc,*.info,*.aux,*.dvi,*.bbl,*.blg
set wildignore+=*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc
set wildignore+=*/tmp/*,*.so,*.a,*.la,*.zip,*.bz2,*.gz,*.tar

" give the following file endings less priority
set suffixes=.bak,~,.log,.h,.P

" save central undo files
set undofile
set undodir=~/.vim/tmp/undo

set backup
set backupdir=~/.vim/tmp/backup

set noswapfile
"}}}

" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable

" set colors and font according to preferences
"colorscheme desert_mod
colorscheme desert
" set guifont=Anonymous\ Pro\ 11
" set guifont=Anonymous\ Pro\ for\ Powerline\ 11
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" allow mouse interaction
set mouse=a

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

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ --ignore\ tags
  set grepformat=%f:%l:%c:%m
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
elseif executable('ack-grep')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif

" enable auto indentation and set tab width

set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
" always convert tabs to spaces
set expandtab

" set \m to default for regexes
" set magic " this is the default

" always draw a status line
set laststatus=2

" the mode is indicated by powerline if available
set noshowmode

" enable extended % matching
runtime macros/matchit.vim

" highlight matching ()[]{}...
set showmatch

" time to wait until swap file is written / cursorhold autocomd is fired
set updatetime=300

" the timeout for key combinations and mappings
set timeoutlen=300

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" do not beep or flash
" important: t_vb= must be set in gvimrc as well!
set noerrorbells
set visualbell
set t_vb=

if has ('balloon_eval')
  set balloondelay=100
endif
set noequalalways

set list listchars=tab:¦\ ,trail:˽
"set listchars=tab:▶\ ,eol:★
"set listchars+=trail:◥
set listchars+=extends:❯ "〉
set listchars+=precedes:❮
  if has('conceal')
    set conceallevel=1
    set listchars+=conceal:Δ
  endif
" Mark lines that have been wrapped
set showbreak=↪

if has('gui_running')
" open maximized
    "set lines=999 columns=9999
    "if s:is_windows
    "  autocmd GUIEnter * simalt ~x
    "endif

    set guioptions+=t "tear off menu items
    set guioptions-=T "toolbar icons

    "if s:is_macvim
    "  set gfn=Ubuntu_Mono:h14
    "  set transparency=2
    "endif

    "if s:is_windows
    "  set gfn=Ubuntu_Mono:h10
    "endif

    "if has('gui_gtk')
    "  set gfn=Ubuntu\ Mono\ 11
    "endif
  else
    if $COLORTERM == 'gnome-terminal'
      set t_Co=256 "why you no tell me correct colors?!?!
    endif
    if $TERM_PROGRAM == 'iTerm.app'
" different cursors for insert vs normal mode
      if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
      else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
      endif
    endif
  endif
"}}}

" => Functions {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" function! TStwo() and TSfour() {{{
function! TStwo()
    setlocal tabstop=2 softtabstop=2 shiftwidth=2
endfunction

function! TSfour()
    setlocal tabstop=4 softtabstop=4 shiftwidth=4
endfunction
"}}}

" function! LastModified() {{{
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
endfunction "}}}

function! Preserve(command) "{{{
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    execute a:command
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction "}}}

function! StripTrailingWhitespace() "{{{
    call Preserve("%s/\\s\\+$//e")
endfunction "}}}

function! EnsureExists(path) "{{{
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path))
    endif
endfunction "}}}
"}}}

" => Keymappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

" Y yanks from cursor to $
map Y y$

" If you like control + vim direction key to navigate
" windows then perform the remapping
"
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" lookup vim help for the word under cursor
noremap <leader>h : help <C-R>=expand("<cword>")<CR><CR><C-W>p

" overwrite selection and preserve the default register
vnoremap <leader>p "_dP

" fast saving
nnoremap <leader>w :w!<cr>

" press j+k to escape from insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" append current line to the next
nnoremap <leader>J :m+1<CR>kJ
" }}}

" => Command-line Mode keymappings {{{
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
" }}}

" => Plugins section starts here {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'tpope/vim-dispatch' "{{{
" When using ,b on normal mode, it will compile the project
nmap <LEADER>b :Make! -j<CR>
nmap <LEADER>B :Make! clean <bar> :Make! -j<CR> "}}}

" -> delimitMate {{{
    let g:delimitMate_smart_quotes = 1
"}}}

" -> Unite {{{2
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
      \ 'build/',
      \ 'BoostBuild/',
      \ '\.o$',
      \ '\.so$',
      \ '\.a$',
      \ '\.la$',
      \ '\.hi$',
      \ '\tags$',
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
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}} "{{{
    nnoremap <silent> [unite]o :<C-u>Unite -vertical -buffer-name=outline outline<cr>
"}}}

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
" Grep for word under cursor
nnoremap <silent> [unite]; :<C-u>UniteWithCursorWord -buffer-name=grep grep<CR>

NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':['tag','tag/file']}} "{{{
    nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
"}}}
"
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

" Quick buffer change
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<CR>

nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_data_directory = '~/.vim/tmp/unite'
let g:unite_update_time = 200
let g:unite_source_file_mru_limit = 10
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'

" For ack.
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--ignore tags --noheading --nocolor -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
" Match whole word only. This might/might not be a good idea
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
endif
"}}}2

" NeoBundle 'bling/vim-airline' "{{{
" when only one tab is open, show all of the open buffers
" let g:airline#extensions#tabline#enabled = 1
" user powerline patched fonts
let g:airline_powerline_fonts = 1
" dict of configurably unicode symbols. mmmmmmmmmm
let g:airline_symbols = {}
let g:airline_symbols.brach = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ' "}}}

" NeoBundle 'junegunn/vim-easy-align' "{{{
vnoremap <Enter> <Plug>(EasyAlign)
nnoremap <Leader>a <Plug>(EasyAlign) "}}}

" NeoBundle 'SirVer/ultisnips' "{{{
    "let g:UltiSnipsExpandTrigger="<TAB>"
    "let g:UltiSnipsJumpForwardTrigger="<TAB>"
    "let g:UltiSnipsJumpBackwardTrigger="<s-TAB>"
    "let g:UltiSnipsSnippetsDir='~/.vim/snippets'

    function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
            if pumvisible()
                return "\<C-n>"
            else
                call UltiSnips_JumpForwards()
                if g:ulti_jump_forwards_res == 0
                   return "\<TAB>"
                endif
            endif
        endif
        return ""
    endfunction

    au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsListSnippets="<c-e>"
"}}}

" NeoBundle 'Valloric/YouCompleteMe', { 'vim_version':'7.3.584'} "{{{
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_allow_changing_updatetime = 0
    let g:ycm_complete_in_comments_and_strings=1
    "let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
    "let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
    let g:ycm_filetype_blacklist={'unite': 1}
    let g:ycm_autoclose_preview_window_after_completion = 1
    "let g:ycm_key_invoke_completion = '<C-TAB>' "}}}

" NeoBundleLazy 'scrooloose/syntastic', {'autoload' : {'filetypes' : ['python', 'javascript', 'c', 'c++'] } } "{{{
let g:syntastic_error_symbol='⧰'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=0 " Do not jump to first error on save/open
let g:syntastic_stl_format = '[%E{⧰: #%e l%fe}%B{, }%W{⚠: #%w %fw}]' "}}}

" NeoBundle 'sjl/gundo.vim' "{{{
nnoremap <F5> :GundoToggle<CR> "}}}

" NeoBundle 'junegunn/vim-easy-align' "{{{
    " Start interactive EasyAlign in visual mode
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign with a Vim movement
    nmap <Leader>a <Plug>(EasyAlign) "}}}
"}}}

" => filetype specific stuff {{{
" -> Python {{{
" NeoBundleLazy 'sethwoodworth/vim-cute-python', {'autoload' : {'filetypes' : ['python'] } }
"}}}

" -> Haskell {{{
" NeoBundleLazy 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM', {'autoload' : {'filetypes' : ['haskell'] } }
" NeoBundleLazy 'Twinside/vim-haskellConceal', {'autoload' : {'filetypes' : ['haskell'] } }
" NeoBundleLazy 'eagletmt/ghcmod-vim', {'autoload' : {'filetypes' : ['haskell'] } }
let g:ghcmod_ghc_options = ['-fglasgow-exts']

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

  setl errorformat=
                   \%-Z\ %#,
                   \%W%f:%l:%c:\ Warning:\ %m,
                   \%E%f:%l:%c:\ %m,
                   \%E%>%f:%l:%c:,
                   \%+C\ \ %#%m,
                   \%W%>%f:%l:%c:,
                   \%+C\ \ %#%tarning:\ %m,
endfunction
"}}}

" Bundle 'vim-scripts/bufkill.vim'

" }}}
