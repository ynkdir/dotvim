" highlight code block in any text
"
" Usage:
"   :set syntax=spre
"
" Example:
"   #spre vim
"   :echo "hello, world"
"   #end

" Do not check b:current_syntax, so that spre can be combined with other
" syntax (e.g. set syntax=text.spre)
" if exists("b:current_syntax")
"   finish
" endif

function! s:Setup()
  if exists("b:current_syntax")
    let current_syntax_save = b:current_syntax
  endif

  let synlist = {}
  let re = '^#spre\s\+\(\w\+\)$'
  let pos = getpos('.')
  call cursor(1, 1)
  while search(re, line('.') == 1 ? 'cW' : 'W') != 0
    let synname = matchlist(getline('.'), re)[1]
    let synlist[synname] = 1
  endwhile
  call setpos('.', pos)

  for syn in keys(synlist)
    if syn == 'spre'
      continue
    endif
    unlet! b:current_syntax
    try
      execute 'syntax include @Spre' . syn . ' syntax/' . syn . '.vim'
      execute 'syntax region Spre matchgroup=SpreTag start=/^#spre\s\+' . syn . '$/ end=/^#end$/ contains=@Spre' . syn . ' keepend extend fold'
    catch
      " pass
    endtry
  endfor

  let b:current_syntax = "spre"

  if exists("current_syntax_save")
    let b:current_syntax = current_syntax_save
  endif
endfunction

call s:Setup()

hi link SpreTag Macro
