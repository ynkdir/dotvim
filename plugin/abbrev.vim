inoremap <expr> <C-]> <SID>Abbrev(strpart(getline('.'), 0, col('.') - 1))
cnoremap <expr> <C-]> <SID>Abbrev(strpart(getcmdline(), 0, getcmdpos() - 1))

let s:abbrev = [
      \ ['mode() =~ "[ic]"', '\<date$', 'strftime("%Y-%m-%d")'],
      \ ['mode() =~ "[ic]"', '\<time$', 'strftime("%H:%S:%M")'],
      \ ['mode() =~ "[ic]"', '\<dir$', 's:AbbrevFileDir()'],
      \ ['mode() =~ "[i]"', '\ze[\\/]$', '"\<C-R>=_AbbrevFile()\<CR>"'],
      \ ]

function! s:Abbrev(src)
  for [cond, pat, expr] in s:abbrev
    if eval(cond)
      let _ = matchlist(a:src, pat)
      if !empty(_)
        return repeat("\<BS>", len(_[0])) . eval(expr)
      endif
    endif
  endfor
  return ''
endfunction

function! s:AbbrevFileDir()
  let sep = has('win32') ? '\' : '/'
  let dir = expand('%:h') . sep
  if mode() == 'c'
    let dir = escape(dir, ' ')
  endif
  return dir
endfunction

function! _AbbrevFile()
  let src = strpart(getline('.'), 0, col('.') - 1)
  let sep = has('win32') ? '\' : '/'
  for i in range(len(src))
    if src[i - 1] !~ '\f' && isdirectory(src[i : ])
      let path = src[i : ]
      break
    endif
  endfor
  if exists('path')
    let lst = split(glob(substitute(path, '[\\/]*$', '/*', '')), '\n')
    let lst = map(lst, 'isdirectory(v:val) ? v:val . sep : v:val')
    call complete(col('.') - len(path), lst)
  endif
  return ''
endfunction
