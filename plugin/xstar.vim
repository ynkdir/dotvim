" star in visual mode
xnoremap * "9y/<C-R>='\V'.substitute(escape(@9,'\/'),'\n','\\n','g')<CR><CR>
