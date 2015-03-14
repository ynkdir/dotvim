" save backup/swapfile/undofile to tmpdir

let s:username = matchstr([$USER, $USERNAME], '.')
let s:tmpdir = matchstr([$TMPDIR, $TMP], '.')
if s:username != '' && s:tmpdir != ''
  let s:tmpvim = printf('%s/dotvim-%s', s:tmpdir, s:username)
  let &backupdir = s:tmpvim . '/backup'
  let &backup = isdirectory(&backupdir) || mkdir(&backupdir, 'p')
  let &writebackup = &backup
  let &directory = s:tmpvim . '/swapfile'
  let &swapfile = isdirectory(&directory) || mkdir(&directory, 'p')
  let &undodir = s:tmpvim . '/undo'
  let &undofile = isdirectory(&undodir) || mkdir(&undodir, 'p')
endif
