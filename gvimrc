" change font size/linespace {{{
set guioptions=i
set guifont=JetBrainsMono_NFM:h11
colorscheme codeschool

" +/- font size
nnoremap <silent> <C-Up>   :silent! let &gfn = substitute(&gfn,'\d\+','\=eval(submatch(0)+1)', '')<CR>
nnoremap <silent> <C-Down> :silent! let &gfn = substitute(&gfn,'\d\+','\=eval(submatch(0)-1)', '')<CR>

" +/- line space
nnoremap <silent> <C-Right> :set linespace+=1<CR>
nnoremap <silent> <C-Left>  :set linespace-=1<CR>
" }}}

