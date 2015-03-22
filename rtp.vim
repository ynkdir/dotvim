" separate dotvim from ~/.vim
" keep usage $vim --cmd "set rtp+=someplugin"
let s:dotvim = expand('<sfile>:p:h')
let s:homevim = expand(has('win32') ? '~/vimfiles' : '~/.vim')
let s:myrtp = join([s:homevim, s:dotvim, $VIMRUNTIME, s:homevim . '/after', s:dotvim . '/after'], ',')
let s:currtp = &runtimepath
set runtimepath&
let &runtimepath = substitute(s:currtp, escape(&runtimepath, '\'), escape(s:myrtp, '\'), '')
