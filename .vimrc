"set showcmd " Show (partial) command in status line.
"set showmatch " Show matching brackets.
"set ignorecase " Do case insensitive matching
"set smartcase " Do smart case matching
"set incsearch " Incremental search
"set autowrite " Automatically save before commands like :next and :make
"set hidden " Hide buffers when they are abandoned
"set mouse=a " Enable mouse usage (all modes) in terminals

" 设置颜色
colorscheme desert
"colorscheme peachpuff
"colorscheme torte
"colorscheme morning
"colorscheme koehler
"colorscheme murphy
"colorscheme delek
"colorscheme ron

" 自动对齐
set autoindent
set cindent
" set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 shiftwidth=2 tabstop=8

" tab缩进
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" 显示行号
set nu

" 高亮显示搜索结果
set hlsearch

" 匹配时忽略大小写
set ignorecase
set smartcase
