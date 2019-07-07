:set nu
:set tabstop=4
:set mouse=a
syntax on

set shiftwidth=4
set number
set showcmd
set enc=utf8

set mouse=a

filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
cs add $CSCOPE_DB


"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"提供多文件同时编辑功能,操作缓存buffer窗口
Plugin 'minibufexplorerpp'         
let g:miniBufExplMapWindowNavVim = 1 "Ctrl-<hjkl> to move to window 
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)

call vundle#end()  
"-------------- PLUGINS END --------------------
filetype plugin indent on



nnoremap <silent> <F5> :NERDTree<CR>
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置 let g:tagbar_ctags_bin='ctags' "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置 
map <F3> :Tagbar<CR> 
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启

set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
