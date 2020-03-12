:set tabstop=4
:set mouse=a
syntax on
colorscheme monokai
set bs=2
set shiftwidth=4
set number
set showcmd
set enc=utf8

set mouse=a
set ff=unix
set fdm=syntax
"set tags = tags
filetype off 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'  "設定全域性配置檔案的路徑
let g:ycm_seed_identifiers_with_syntax=1    " 語法關鍵字補全
let g:ycm_confirm_extra_conf=0  " 開啟vim時不再詢問是否載入ycm_extra_conf.py配置
let g:ycm_key_invoke_completion = '<C-a>' " ctrl + a 觸發補全
let g:ycm_server_python_interpreter='/usr/bin/python3'
set completeopt=longest,menu
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
cs add $CSCOPE_DB
hi Comment ctermfg = darkyellow
let mapleader = '-'

"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"提供多文件同时编辑功能,操作缓存buffer窗口
Plugin 'minibufexplorerpp'         
Plugin 'Valloric/YouCompleteMe'
Plugin 'johngrib/vim-game-code-break'
let g:miniBufExplMapWindowNavVim = 1 "Ctrl-<hjkl> to move to window 
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()  
"-------------- PLUGINS END --------------------
filetype plugin indent on



nnoremap <silent> <F3> :NERDTree<CR>
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置 let g:tagbar_ctags_bin='ctags' "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置 
map <F5> :Tagbar<CR> 
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

nnoremap <Leader>fd :CtrlPFunky<Cr>
nnoremap <Leader>fw :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


"let g:ctrlp_map = '<leader>p'
"let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
"let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"    \ }
"let g:ctrlp_working_path_mode='c'
"let g:ctrlp_match_window_bottom=1
"let g:ctrlp_max_height=15
"let g:ctrlp_match_window_reversed=0
"let g:ctrlp_mruf_max=500
"let g:ctrlp_follow_symlinks=1


let g:ackprg = 'ag --nogroup --nocolor --column'



map <c-n> :Ack<space> <C-R>=expand("<cword>")<CR>
""map <c-n> : call Test_cword()<cr>
""function Test_cword()
""	let w = expand("<cword>")
""	call feedkeys(w,"n")
""endfunction 
"map <c-n>:call Copy_no_exec()<cr>
"function Copy_no_exec()
"	let w = expand("<cword>")i
"	execute "Ack " .w
"endfunction

map <c-f> : call Search_word()<cr>
function Search_word()
	let w = expand("<cword>")
	execute "Ack --cc --hh --cpp -w " . w
endfunction

nmap <leader>d :syn match TempKeyword /\<<C-R>=expand("<cword>")<CR>\>/<CR>
nmap <leader>s :syn clear TempKeyword<CR>
hi TempKeyword ctermfg=Yellow


