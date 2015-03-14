" Minimize small inactive window

augroup MinimizeWindow
  au!
  autocmd WinEnter * call s:MinimizeWindow(3)
augroup END

function! s:MinimizeWindow(threshold)
  " don't close completion preview window
  if mode() == 'n' && winheight(winnr('#')) <= a:threshold
    execute winnr('#') . 'resize 0'
  endif
endfunction
