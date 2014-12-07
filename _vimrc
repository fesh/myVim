if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif

"判断是终端还是VIM
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
colorscheme molokai 

let mapleader=";"
"for windows vimrc
" Set helplang
set helplang=cn
"Fast reloading of the _vimrc
map <silent> <leader>ss :source $vim/_vimrc<cr>
"Fast editing of _vimrc
map <silent> <leader>ee :e $vim/_vimrc<cr>
"When _vimrc is edited, reload it
autocmd! bufwritepost _vimrc source $vim/_vimrc

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
if(g:iswindows==1)
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif
set nobomb


"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"set lines=100 columns=120

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile
"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
"set autoindent
"set cindent

"开启语法高亮功能
syntax enable
syntax on

"指定配色方案为256色
set t_Co=256
"档文件在外部被修改时，自动重新读取
set autoread

"设置搜索时忽略大小写
set ignorecase

"自动缩进
set ai
"智能缩进
set si

set nofen
set fdl=10

set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
if(g:iswindows==1) "允许鼠标的使用
    "防止linux终端下无法拷贝
    if has('mouse')
        set mouse=a
    endif
    au GUIEnter * simalt ~x
endif

"设置Tab宽度
set tabstop=4
"禁止自动缩进
set noautoindent
"与windows共享剪贴板
set clipboard+=unnamed
"php编码规范
autocmd FileType php set expandtab
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab
set guifont=Consolas:h12:cANSI
"在GVIM中高亮当前行
if(g:isGUI)
    set cursorline
    hi cursorline guibg=#333333
    hi CursorColumn guibg=#333333
    "set guifont=Consolas\14
    "set guifontwide=Consolas\14
endif

" Vundle Need  
filetype off  
" linux:  
" set rtp+=~/.vim/bundle/vundle/  
" windows:   
set rtp+=$VIM/vimfiles/bundle/vundle/  
call vundle#rc('$VIM/vimfiles/bundle/')  
  
" let Vundle manage Vundle  
" required!   
Bundle 'gmarik/vundle'    

Bundle 'Lokaltog/vim-powerline'
set laststatus=2
let g:Powline_symbols='fancy'

" NerdTree use <F2>  
Bundle 'scrooloose/nerdtree'  
let NERDTreeWinPos='right'  
let NERDTreeWinSize=31  
let NERDTreeChDirMode=1  
map <F2> :NERDTreeToggle<CR>  
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif  
  
" Taglist  use <F3>  
Bundle 'taglist.vim'  
let Tlist_Auto_Update=1  
let Tlist_Auto_Open = 0  
let Tlist_Use_Right_Window=1    
let Tlist_Show_One_File=0    
let Tlist_File_Fold_Auto_Close=0    
let Tlist_Exit_OnlyWindow=1  
map <F3> :TlistToggle<CR>  
  
"HTML  use <c-e> <c-n> <c-p>  
Bundle 'mattn/emmet-vim'  
let g:user_emmet_expandabbr_key='<tab>'
let g:user_emmet_complete_tag=1  
let g:user_emmet_next_key='<c-b>'  
let g:user_emmet_prev_key='<c-p>'
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = {  
\  'html' : {  
\    'filters' : 'html',  
\    'snippets' : {  
\      'bt' : "<!DOCTYPE html>\n<html>\n  <head>\n    <meta charset=\"UTF-8\">\n    <title></title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\">\n    <!--[if lt IE 9]>\n      <script src=\"/assets/js/html5shiv.js\"></script>\n      <script src=\"/assets/js/respond.min.js\"></script>\n    <![endif]-->\n  </head>\n  <body>\n    ${cursor}${child}\n    <script src=\"js/jquery.min.js\"></script>\n    <script src=\"js/bootstrap.min.js\"></script>\n  </body>\n</html>",  
\      'mn'      : "#include <functional>\n#include <algorithm>\n#include <iostream>\n#include <fstream>\n#include <sstream>\n#include <iomanip>\n#include <numeric>\n#include <cstring>\n#include <climits>\n#include <cassert>\n#include <cstdio>\n#include <string>\n#include <vector>\n#include <bitset>\n#include <queue>\n#include <stack>\n#include <cmath>\n#include <ctime>\n#include <list>\n#include <set>\n#include <map>\nusing namespace std;\ntypedef long long LL;\nconst int MOD =1e9 + 7;\nconst int INF = 0x3f3f3f3f;\n\nconst int MXN=1e6;\nint N,M;\n\nvoid Rush()\n{\n\tint T;\n\tscanf(\"%d\",&T);\n\tfor(int kas=1;kas<=T;++kas)\n\t{\n\t\tprintf(\"Case %d: \",kas);\n\t}\n}\nint main() \n{\n\t${cursor}\n\treturn 0;\n}\n",  
\    },  
\  },  
\}  
"语法高亮
Bundle 'Mark'
"Bundle 'vim-scripts/YankRing.vim'
"quick key <mapleader>ig
"Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git' 
Bundle 'matchit.zip'
Bundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1  
let g:neocomplcache_enable_auto_select = 1 

"Bundle 'https://github.com/terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_key='<F8>'
"let g:multi_cursor_next_key='<c-1>'

filetype plugin indent on
filetype plugin on  

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

