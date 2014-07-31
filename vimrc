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
  nnoremap <silent> >f :CtrlP<CR>
  nnoremap <silent> >b :CtrlPBuffer<CR>
  nnoremap <silent> >d :CtrlPDir<CR>

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-repeat'

Bundle 'tpope/vim-unimpaired'

Bundle 'flazz/vim-colorschemes'

Bundle 'xolox/vim-colorscheme-switcher'

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
  " tabline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#fnamemod = ':t'

Bundle 'jelera/vim-javascript-syntax'

Bundle 'hail2u/vim-css3-syntax'

Bundle 'kchmck/vim-coffee-script'

Bundle 'derekwyatt/vim-scala'

Bundle 'othree/html5-syntax.vim'

Bundle 'krisajenkins/vim-pipe'

Bundle 'ervandew/supertab'

Bundle 'LargeFile'
  let g:LargeFile=1

Bundle 'bufkill.vim'

Bundle 'tpope/vim-haml'

Bundle 'mhinz/vim-signify'
  let g:signify_disable_by_default = 1

Bundle 'cmdalias.vim'
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

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
end

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
"set background=dark
"color desert

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
    silent! color solarized
    silent! AirlineTheme solarized
  elseif a:scheme == 'dark'
    set background=dark
    silent! color solarized
    silent! AirlineTheme solarized
  end
endfunction

command! Dark  call s:ChangeScheme('dark')
command! Light call s:ChangeScheme('light')
autocmd VimEnter *  Alias light Light
autocmd VimEnter *  Alias dark  Dark
" set default scheme
autocmd VimEnter * Dark

" }}}

" Change working language by profile {{{
function! s:ChangeLang(lang)
    if a:lang == 'en'
      if has('win32') || has('win64')
          set guifont=Fira_Mono:h10
      else
          set guifont=Fira\ Mono\ 10
      endif
    elseif a:lang == 'th'
      if has('win32') || has('win64')
          set guifont=Tlwg_Typo:h11
      else
          set guifont=Tlwg\ Typo\ 11
      endif
    end
endfunction

command! En call s:ChangeLang('en')
command! Th call s:ChangeLang('th')
autocmd VimEnter *  Alias th Th
autocmd VimEnter *  Alias en En

" set default lang
autocmd VimEnter * En
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
