set statusline=%f\ %m%r%y%{_bomb()}%{_fenc()}%{_ff()}%#Error#%{_qf()}%{_loc()}%*%=%v\ %l/%L

augroup Statusline
  au!
  " update qf statusline
  autocmd QuickFixCmdPost,WinEnter * let g:__qf = len(getqflist())
  autocmd QuickFixCmdPost,WinEnter * let w:__loc = len(getloclist(0))
  " dont copy location list
  autocmd VimEnter,WinEnter *
        \   if !exists('w:_dont_copy_location_list')
        \ |   let w:_dont_copy_location_list = 1
        \ |   lexpr []
        \ |   doautocmd QuickFixCmdPost
        \ | endif
augroup END

function _bomb()
  return &bomb ? '[bomb]' : ''
endfunction

function _fenc()
  return '[' . ((&fenc == '') ? &enc : &fenc) . ']'
endfunction

function _ff()
  return '[' . &ff . ']'
endfunction

function _qf()
  let n = get(g:, '__qf', 0)
  if n == 0
    return ''
  endif
  return '[G:' . n . ']'
endfunction

function _loc()
  let n = get(w:, '__loc', 0)
  if n == 0
    return ''
  endif
  return '[L:' . n . ']'
endfunction
