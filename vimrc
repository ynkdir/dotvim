set fileencodings=ucs-bom,utf-8,cp932
set history=100               " keep 100 lines of command line history
set ignorecase
set smartcase
set incsearch                 " do incremental searching
set hlsearch
set list
set listchars=tab:>-,trail:-
set showcmd
set laststatus=2
set wildmenu
set winminheight=0
set noequalalways
set backspace=indent,eol,start
set formatoptions+=nmB formatoptions-=t formatoptions-=c
set autoindent
set tags+=./tags;
set mouse=nvi
set mousemodel=popup
set wildignorecase
set visualbell t_vb=          " turn off beep
set cryptmethod=blowfish2     " keep safe method

colorscheme delek
syntax on
filetype plugin indent on

runtime macros/matchit.vim
