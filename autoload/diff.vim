" Diff current buffer with its saved file {{{
function diff#WithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe 'setlocal bt=nofile bh=wipe nobl noswf ro ft=' . filetype
endfunction
" }}}
