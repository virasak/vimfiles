let mapleader=" "

" Setup Vundle ---------------- {{{
set nocompatible
let s:bundle_path = expand('<sfile>:p:h') . "/bundle"
let s:vundle_path = s:bundle_path . "/Vundle.vim"
filetype off
let &rtp .= ',' . s:vundle_path
" }}}

" Load bundles {{{
call vundle#begin(s:bundle_path)

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
  let NERDTreeIgnore = ['^\.', '\~$', '^Applications$', '\.pyc$']
  let NERDTreeIgnore += []
  let NERDTreeDirArrows=1
  let NERDTreeWinSize=30
  nnoremap <silent> <leader><Space> :NERDTreeToggle<CR>
  nnoremap <silent> <leader>. :NERDTreeFind<CR>


Plugin 'scrooloose/nerdcommenter'

Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_cmd = 'CtrlPLastMode'
  let g:ctrlp_custom_ignore = 'target\|node_modues\|.git'
  let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>', '<c-l>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>', 'c-h>'],
    \ }
  nnoremap <silent> >f :CtrlP<CR>
  nnoremap <silent> >b :CtrlPBuffer<CR>
  nnoremap <silent> >d :CtrlPDir<CR>

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-unimpaired'

Plugin 'matchit.zip'

Plugin 'junegunn/vim-easy-align'
  vnoremap <silent> <Enter> :EasyAlign<CR>

Plugin 'vim-airline/vim-airline'
  set noshowmode
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_exclude_preview = 1

Plugin 'Donaldttt/fuzzyy'

call vundle#end()
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
set t_Co=256

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

set background=dark

set spelllang=en_us
" }}}

" insert mode key mapping {{{
" inoremap <S-CR> <CR><UP>
" inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
" }}}

" visual mode key mapping {{{
vnoremap <silent> < <gv
vnoremap <silent> > >gv
" }}}

" normal mode key mapping {{{
nnoremap <silent> <Space>    <Nop>
nnoremap <silent> <NL>       i<CR><Esc>
nnoremap <silent> <Tab>      <NOP>
nnoremap <silent> <Tab><Tab> <C-w>w
nnoremap <silent> <Tab>h     <C-w>h
nnoremap <silent> <Tab>j     <C-w>j
nnoremap <silent> <Tab>k     <C-w>k
nnoremap <silent> <Tab>l     <C-w>l
nnoremap <silent> <Tab>o     <C-w>o

nnoremap <silent> Y y$

nnoremap <expr> <C-h> tabpagenr('$') == 1 ? ":bprev\<CR>" : ":tabprev\<CR>"
nnoremap <expr> <C-l> tabpagenr('$') == 1 ? ":bnext\<CR>" : ":tabnext\<CR>"

nnoremap <silent> >e :Explore<CR>

" }}}

" command mode key mapping {{{
cnoremap <S-CR> <Home>\<<End>\><CR>

cnoremap w!! %!sudo tee > /dev/null %
" }}}

" netrw plugin setting {{{
let g:netrw_banner=0
let g:netrw_liststyle=3

" }}}

" misc. command {{{
command! FixTrailingSpaces %s/\s\+$//
command! DiffSaved call diff#WithSaved()
" }}}
"

" via: http://vim.wikia.com/wiki/HTML_entities
function! HtmlEscape()
  silent '<,'>s/&/\&amp;/eg
  silent '<,'>s/</\&lt;/eg
  silent '<,'>s/>/\&gt;/eg
endfunction

function! HtmlUnEscape()
  silent '<,'>s/&lt;/</eg
  silent '<,'>s/&gt;/>/eg
  silent '<,'>s/&amp;/\&/eg
endfunction

vnoremap <silent> <Leader>he :call HtmlEscape()<CR>
vnoremap <silent> <Leader>hu :call HtmlUnEscape()<CR>

" vim:ts=2:sw=2:foldmethod=marker
