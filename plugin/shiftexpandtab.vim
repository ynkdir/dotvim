" Toggle expandtab temporarily by <S-Tab>

inoremap <script> <S-Tab> <SID>ToggleExpandtab<Tab><SID>ToggleExpandtab
inoremap <expr> <SID>ToggleExpandtab <SID>ToggleExpandtab()

function s:ToggleExpandtab()
  setl expandtab!
  return ""
endfunction
