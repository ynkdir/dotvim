" Copy :number output to register
" :[range]Number [reg]

command! -range -register -bang Number call s:Number(<line1>, <line2>, "<reg>", "<bang>")

function s:Number(first, last, reg, bang)
  if a:bang == ""
    let list_save = &l:list
    setl nolist
  endif
  redir => str
  execute printf("%d,%dnumber", a:first, a:last)
  redir END
  if a:bang == ""
    let &l:list = list_save
  endif
  let str = substitute(str, '^\n\|\s\+\ze\n', '', 'g')
  call setreg(a:reg, str, "V")
endfunction
