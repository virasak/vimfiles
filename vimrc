let mapleader=" "

" Setup Vundle ---------------- {{{
set nocompatible
filetype off
if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle
  call vundle#rc('~/vimfiles/bundle')
else
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
endif
" }}}

" Load bundles {{{
Bundle 'gmarik/vundle'

Bundle 'jlanzarotta/bufexplorer'
  let g:bufExplorerDisableDefaultKeyMapping=1
  let g:bufExplorerDefaultHelp=0
  function! s:SwitchBuffers()
      if &filetype != 'nerdtree'
          BufExplorer
      end
  endfunction
  nnoremap <silent> <S-Space> :call <SID>SwitchBuffers()<CR>

Bundle 'joonty/vdebug'

Bundle 'tpope/vim-fugitive'

Bundle 'scrooloose/syntastic'

Bundle 'scrooloose/nerdtree'
  if has('win32') || has('win64')
    let NERDTreeIgnore=['^NTUSER*', '^ntuser*', '\~$', '\$Recycle.Bin', '^\.$', '^\.\.$']
  endif
  let NERDTreeDirArrows=1
  let NERDTreeWinSize=30
  nnoremap <silent> <leader><Space> :NERDTreeToggle<CR>

Bundle 'scrooloose/nerdcommenter'

Bundle 'kien/ctrlp.vim'
  let g:ctrlp_cmd = 'CtrlPLastMode'

Bundle 'Shougo/unite.vim'

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-repeat'

Bundle 'tpope/vim-unimpaired'

Bundle 'flazz/vim-colorschemes'

Bundle 'AfterColors.vim'

Bundle 'xolox/vim-colorscheme-switcher'

Bundle 'mattn/webapi-vim'

Bundle 'mattn/gist-vim'

Bundle 'matchit.zip'

Bundle 'mileszs/ack.vim'
  if has('win32') || has('win64')
    let g:ackprg='ack.cmd  -H --nocolor --nogroup --column'
  endif

Bundle 'xolox/vim-misc'

Bundle 'xolox/vim-session'
  let g:session_autoload='no'
  let g:session_autosave='yes'

Bundle 'xolox/vim-notes'
  let g:notes_directories=['~/Documents/Notes']
  let g:notes_suffix='.txt'

Bundle 'honza/vim-snippets'
  let g:snips_author='Virasak Dungsrikaew'

Bundle 'MarcWeber/vim-addon-mw-utils'

Bundle 'tomtom/tlib_vim'

Bundle 'garbas/vim-snipmate'
  snoremap <silent> <BS> <Space><BS>

Bundle 'bronson/vim-visual-star-search'

Bundle 'terryma/vim-multiple-cursors'
  let g:multi_cursor_exit_from_visual_mode = 0
  let g:multi_cursor_exit_from_insert_mode = 0

Bundle 'junegunn/vim-easy-align'
  vnoremap <silent> <Enter> :EasyAlign<CR>

Bundle 'bling/vim-airline'
  set noshowmode
  au VimEnter *  :AirlineTheme lucius
  " statusline
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols = {'branch': '⭠', 'readonly': '⭤', 'linenr': '⭡'}
  " tabline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

Bundle 'jelera/vim-javascript-syntax'

Bundle 'hail2u/vim-css3-syntax'

Bundle 'kchmck/vim-coffee-script'

Bundle 'derekwyatt/vim-scala'

Bundle 'othree/html5-syntax.vim'

Bundle 'justinmk/vim-sneak'
  "replace 'f' with inclusive 1-char Sneak
    nmap f <Plug>Sneak_f
    nmap F <Plug>Sneak_F
    xmap f <Plug>Sneak_f
    xmap F <Plug>Sneak_F
    omap f <Plug>Sneak_f
    omap F <Plug>Sneak_F
    "replace 't' with exclusive 1-char Sneak
    nmap t <Plug>Sneak_t
    nmap T <Plug>Sneak_T
    xmap t <Plug>Sneak_t
    xmap T <Plug>Sneak_T
    omap t <Plug>Sneak_t
    omap T <Plug>Sneak_T

Bundle 'krisajenkins/vim-pipe'

Bundle 'ervandew/supertab'

Bundle 'LargeFile'
  let g:LargeFile=1

Bundle 'bufkill.vim'

Bundle 'tpope/vim-haml'

Bundle 'mhinz/vim-signify'
  let g:signify_disable_by_default = 0

Bundle 'cmdalias.vim'
  au VimEnter *  :Alias th Th
  au VimEnter *  :Alias en En
  au VimEnter *  :Alias light Light
  au VimEnter *  :Alias dark  Dark
  au VimEnter *  :Alias git Git
" }}}

" Set default options {{{
filetype plugin indent on
syntax on

set number numberwidth=5
set showcmd
set nowrap
set hidden
set incsearch
set autoindent
set nosmartindent
set nocindent
set hlsearch
set encoding=utf-8
set fileformats=unix,dos
set fileencodings=utf-8,cp874
set expandtab tabstop=4 shiftwidth=4
set mouse=a
set showbreak=>>>
set list listchars=tab:»·,trail:·,precedes:«,extends:»,nbsp:.
set laststatus=2
set wildchar=<Tab> wildmenu wildmode=longest,list,full
set virtualedit=block


" turn off error sound
set noerrorbells
set visualbell t_vb=
"

set nobackup
set noswapfile

"
set scrolloff=4
set sidescrolloff=10
set sidescroll=1
"
" preserve column position after some actions
set nostartofline

set backspace=indent,eol,start

" fallback colorscheme
set background=dark
color desert

set spelllang=en_us
" }}}

" visual mode key mapping {{{
vnoremap <silent> < <gv
vnoremap <silent> > >gv
" }}}

" normal mode key mapping {{{
nnoremap <silent> <Space> <Nop>
nnoremap <silent> <NL> i<CR><Esc>
nnoremap <silent> <Tab>   <C-w>w
nnoremap <silent> <S-Tab> <C-w>W

nnoremap <silent> Y y$

function s:NextTabLine()
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
endfunction

function s:PrevTabLine()
  if tabpagenr('$') == 1
    bprev
  else
    tabprev
  endif
endfunction

nnoremap <silent> H :call <SID>PrevTabLine()<CR>
nnoremap <silent> L :call <SID>NextTabLine()<CR>

" }}}

" command mode key mapping {{{
cnoremap <S-CR> <Home>\<<End>\><CR>

if has('unix')
  cnoremap w!! %!sudo tee > /dev/null %
endif
" }}}

" change colorscheme by profile {{{
function! s:ChangeScheme(scheme)
  if a:scheme == 'light'
    set background=light
    if has('gui_running')
      silent! color osx_like
      "silent! color habiLight
      "silent! color rainbow_fruit
    endif
  elseif a:scheme == 'dark'
    set background=dark
    if has('gui_running')
      silent! color mdark
      "silent! color fu
      "silent! color candyman
      "silent! color monokai
      "silent! color cobalt
      "silent! color solarized
    else
      silent! color blackbeauty
    end
  end
endfunction
command! Dark call s:ChangeScheme('dark')
command! Light call s:ChangeScheme('light')
" set default scheme
Dark
" }}}

" Change working language by profile {{{
function! s:ChangeLang(lang)
    if a:lang == 'en'
      if has('win32') || has('win64')
          "set guifont=Envy_Code_R:h11
          set guifont=Consolas_for_Powerline_FixedD:h11
          "set guifont=Consolas:h11
      else
          set guifont=Liberation\ Mono\ 9
      endif
    elseif a:lang == 'th'
      if has('win32') || has('win64')
          set guifont=Tlwg_Typo:h11
      else
          set guifont=Tlwg_Typo:h11
      endif
    end
endfunction

command! En call s:ChangeLang('en')
command! Th call s:ChangeLang('th')

" set default lang
En
" }}}

" change font size/linespace {{{
if has('gui_running')
  set guioptions=i

  " +/- font size
  nnoremap <silent> <C-Up>   :silent! let &gfn = substitute(&gfn,'\d\+','\=eval(submatch(0)+1)', '')<CR>
  nnoremap <silent> <C-Down> :silent! let &gfn = substitute(&gfn,'\d\+','\=eval(submatch(0)-1)', '')<CR>

  " +/- line space
  nnoremap <silent> <C-Right> :set linespace+=1<CR>
  nnoremap <silent> <C-Left>  :set linespace-=1<CR>

endif
" }}}

" netrw plugin setting {{{
let g:netrw_banner=0
let g:netrw_liststyle=3

" }}}

" misc. command {{{
command! FixTrailingSpaces %s/\s\+$
command! DiffSaved call diff#WithSaved()
" }}}

" vim:ts=2:sw=2:foldmethod=marker
