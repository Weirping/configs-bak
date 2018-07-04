set nocompatible              " required
filetype off                  " required

"====================Vundle start=====================================
":BundleList              -列举列表(也就是.vimrc)中配置的所有插件
":BundleInstall          -安装列表中的全部插件
":BundleInstall!         -更新列表中的全部插件
":BundleSearch foo   -查找foo插件
":BundleSearch! foo  -刷新foo插件缓存
":BundleClean           -清除列表中没有的插件

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold' "用于代码折叠
Plugin 'vim-scripts/indentpython.vim' "python 自动缩进
Plugin 'ap/vim-buftabline' " Buftabline takes over the tabline and renders the buffer list in it
Plugin 'scrooloose/syntastic' "每次保存文件时Vim都会检查代码的语法
Plugin 'nvie/vim-flake8' "添加PEP8代码风格检查
Plugin 'scrooloose/nerdtree' "文件树形结构
Plugin 'jistr/vim-nerdtree-tabs' "
Plugin 'kien/ctrlp.vim' "超级搜索 按Ctrl+P就可以进行搜索
Plugin 'Lokaltog/vim-powerline' "用于美化状态栏
Plugin 'Yggdroot/indentLine' "缩进线
Plugin 'tell-k/vim-autopep8' "自动格式化工具
Plugin 'jiangmiao/auto-pairs' "自动补全括号
Plugin 'scrooloose/nerdcommenter' "注释
Plugin 'mbbill/undotree' "文件保存历史
Plugin 'vim-scripts/TaskList.vim' "TODOList
Plugin 'taglist.vim'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized' "主题插件
Plugin 'dracula/vim'    "主题插件
Plugin 'derekwyatt/vim-fswitch' "用于在.cpp文件和对应的.h文件之间跳转
Plugin 'derekwyatt/vim-protodef' "根据 .h文件生成.cpp里面的实现，该插件依赖vim-fswitch
Plugin 'SirVer/ultisnips' " 模块自动补全插件 如 if--else--
Plugin 'honza/vim-snippets' "ultisnips需要用到的各种模板（ultisnips没有自带的模板，下载后ultisnips自动识别）
Plugin 'dyng/ctrlsf.vim'  "在工程中查找关键词的插件
Plugin 'terryma/vim-multiple-cursors' " 光标多选功能
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"====================Vundle end========================================

"====================config start======================================
" filetype on "开启文件类型检查
" filetype plugin on " 开启插件支持
" filetype indent on " 自动适应不同语言的只能缩进

autocmd BufWritePost $MYVIMRC source $MYVIMRC

"<leader>
let mapleader=';'
set fileformat=unix     "设置以unix的格式保存文件
set fileencoding=utf-8  "文件编码
set encoding=utf-8      "支持UTF-8编码
set noswapfile          "无备份文件

" 代码缩进
set smartindent
set smarttab
set tabstop=4           "编辑时tab键4个空格
set shiftwidth=4        "格式化 其他文件 时tab占用的空格数
set softtabstop=4       "编辑时 按删除键的时候 如果遇到tab出来的4空格，则直接删除4个空格（与tabstop对应）
set expandtab           "把制表符转换为多个空格，具体空格数量参考 tabstop 和 shiftwidth 变量
" 可以使用  retab  对别人的代码进行格式化（如果别人的缩进和以上配置不一样时）

set backspace=2         "允许退格键删除和tab操作
set textwidth=1500      " 
 
set wildmenu            " visual autocomplete for command menu
set showcmd             " 输入的命令显示出来，看的清楚些
set showmatch           "显示匹配的括号
set laststatus=2        "命令行为两行
set number              "显示行号
"set relativenumber number "显示相对行号
"set cursorline         "突出显示当前行
"set cursorcolumn       "突出显示当前列
set showmode            "显示当前的模式
set laststatus=2         " 总是显示状态栏
set ruler               " 总是显示光标当前位置（光标所在行号高亮显示）

"语法高亮 以下两行代码要在靠前的位置，后面所有关于颜色的配置都需要在这两行之后
syntax enable            "开启代码高亮功能
syntax on               "允许用制定的语法高亮配色方案代替默认方案
set t_Co=256            " 设置颜色深度
let python_highlight_all=1
"syntax keyword cppSTLtype initializer_list " cpp stl 语法高亮

"窗口分割位置
set splitbelow
set splitright

"代码折叠（Code Folding)
set foldmethod=indent    " 根据缩进折叠代码
"set foldmethod=syntax   " 根据语法折叠
set foldlevel=99
let g:SimpylFold_docstring_preview=1 "显示doc
nnoremap <space> za     "使用空格键折叠代码

" search
"set ic                 "ignore case 搜索时忽略大小写
set hls                 "hlsearch 高亮显示搜索结果
set is                  "insearch

"配色方案
set background=dark
"colorscheme solarized
colorscheme desert
"auto BufRead,BufNewFile *.py colorscheme desert " 如果是python文件使用该主题

" 修改Search结果的高亮配色方案
hi Search ctermfg=230 ctermbg=33 guifg=#fdf6e3 guibg=#268bd2
"标示不必要的空白字符
highlight BadWhitespace ctermbg=239 guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"窗口分割
"sv <filename> #open file in a splited window
"split window navigations 存在分割窗口时切换到不同窗口
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 重口大小调整
nmap z- :resize -5<CR>
nmap z= :resize +5<CR>
nmap z, :vertical resize -5<CR>
nmap z. :vertical resize +5<CR>

"缓冲区
"ls 查看打开的文件:
":b filename 打开缓冲区中的文件
"buf 跳转
nmap <leader>bp :bprevious<CR>
nmap <leader>bn :bnext<CR>
nmap <leader>bd :bdelete%<CR>


"================================function==========================================
"新建python文件 自动插入头文件
autocmd BufNewFile *.py,*.cpp exec ":call SetTitle()"
func! SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."),"\# coding: utf-8")
        call append(line(".")+1, "\# ========================================================================")
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author: Weirping")
        call append(line(".")+4, "\# mail: zhangweiping1988@gmail.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%c"))
        call append(line(".")+6, "\# =======================================================================")
    endif
    if &filetype == 'python'
        call setline(1,"\#!/usr/bin/evn python")
        call append(line("."),"\# coding: utf-8")
        call append(line(".")+1, "\# ========================================================================")
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author: Weirping")
        call append(line(".")+4, "\# mail: zhangweiping1988@gmail.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%c"))
        call append(line(".")+6, "\# =======================================================================")
        call append(line(".")+7, "'''")
        call append(line(".")+8, "")
        call append(line(".")+9, "'''")
        call append(line(".")+10, "")
        call append(line(".")+11, "import sys")
        call append(line(".")+12, "reload(sys)")
        call append(line(".")+13, "sys.setdefaultencoding('utf-8')")
    endif
    if &filetype == 'cpp'
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Weirping") 
        call append(line(".")+2, "    > Mail: zhangweiping1988@gmail.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    "if &filetype == 'h'
        "call setline(1, "/*************************************************************************") 
        "call append(line("."), "    > File Name: ".expand("%")) 
        "call append(line(".")+1, "    > Author: Weirping") 
        "call append(line(".")+2, "    > Mail: zhangweiping1988@gmail.com")
        "call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        "call append(line(".")+4, " ************************************************************************/") 
        "call append(line(".")+5, "")
        "call append(line(".")+6, "")
    "endif
    autocmd BufNewFile * normal G
endfunc


"toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

"按F5运行python"
map <F5> :call CompileRunFunc()<CR>
func! CompileRunFunc()
    exec "w"
    if &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        exec "!time bash %"
    endif
endfunc
"============================config end=============================================

"============================插件config start=============================================
"supertab
"将tab键映射为jedi-vim的自动完成
"let g:SuperTabDefaultCompletionType = "<C-N>"

"syntastic 语法检查插件
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pep8']
let g:syntastic_python_pep8_args='--ignore=E501,E116'

"AutoPep8
let g:autopep8_max_line_length=150
let g:autopep8_ignore='E501,E116'

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'   "order matching files top to bottom
let g:ctrlp_switch_buffer = 0                   "always open files in new buffer
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' "change the working directory during a Vim session and make CtrlP respect that change

"NERDTree
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25
"打开文件是默认同时打开目录树
"autocmd BufRead,BufNewFile * NERDTreeToggle

"indentLine 缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1 "显示缩进线

"nerdcommenter
"多行注释只需要在normal模式下按v并移动光标选择需要注释的行
"<leader>ci  "toggle comment

"gundo
"j/k   上下选择
"p     查看diff
"回车  回滚文件到这个时刻的版本
"<leader>h  关闭(或者wq关闭gundo打开的窗口)
nnoremap <F4> :UndotreeToggle<CR>
let g:undotree_WindowLayout="Style 1"
"打开文件是默认同时打开undotree
"auto BufRead,BufNewFile * UndotreeToggle

"TagList
let Tlist_Show_One_File=1  "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags"  "将taglist与ctags关联
" 当前选中的tag的高亮色
hi TagListTagName ctermfg=230 ctermbg=33 guifg=#fdf6e3 guibg=#268bd2 
"保存文件时自动更新tag
"cnoremap w<cr> :w<cr>:TlistUpdate<cr>
nnoremap <F3> :TlistToggle<CR>

"TaskList
let g:tlTokenList = ["FIXME", "TODO", "WARN"]
let g:tlWindowPosition = 1
let g:tlRememberPosition = 1
map <F12> :TaskList<CR>

" Buftabline
let g:buftabline_numbers=1      " 小时buf序号
let g:buftabline_indicators=1   "显示buf是否被修改
hi BufTabLineCurrent term=reverse ctermbg=9 gui=undercurl guisp=Red
hi BufTabLineActive term=reverse ctermbg=12 gui=undercurl guisp=Blue
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" powerline 设置状态来的主题风格
"let g:Powerline_theme='solarized256'
let g:Powerline_colorscheme='solarized256' " powerline的主题
let g:Powerline_symbols = 'unicode' " powerline 使用的符号系统

" vim-fswitch .h 和 .cpp 文件跳转
nmap <silent> <Leader>sw :FSHere<cr>

" protodef
let g:disable_protodef_sorting=1    " 成员函数的实现顺序与声明顺序一致
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl' " 设置 pullproto.pl 脚本路径.pullproto.pl 是 protodef 自带的 perl 脚本，默认位于 ~/.vim 目录，由于改用 Vundle 管理插件，所以路径需重新设置。
" <leader>PP 大写的P，定义文件a.h,在文件a.cpp中使用该键将会自动出现函数实现

" ultisnips
let g:UltiSnipsUsePythonVersion = 2     "To use python version 2.x

" YCM 配置
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=~/.vim/tags/cpp
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt=longest,menu,preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全            
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDeclaration <CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>
nnoremap <leader>jp :YcmCompleter GetParent<CR>
nnoremap <leader>jk :YcmCompleter GetDoc<CR>

" CtrlSF 配置
let g:ctrlsf_ackprg = '/home/zhangweiping/opt/ack/bin/ack'  " 设置 ack路径
let g:ctrlsf_winsize = '30%'  " 设置ctrlsf窗口占当前串口的百分比
nnoremap <leader>sp :CtrlSF<CR>
nnoremap <F6> :CtrlSFToggle <CR>

"====================插件config end========================================

"====================一些快捷键 start======================================
" <C-O> 返回上一个（停留过）位置
" <C-T> 返回上一个（停留过）tag
" <C-i> 调到下一个（停留过）位置

"====================一些快捷键 start======================================

" ack
" 由于CtrlSF依赖于ack 所以需要先安装ack
" 安装方法自行搜索，比较简单。安装后在上面设置ack的路径

"设置 python 环境变量
"PYTHONPATH=${HOME}/opt/anaconda2/lib/python2.7/site-packages:$PYTHONPATH
"export PYTHONPATH
"PYTHON_HOME=${HOME}/opt/anaconda2
"PATH=$PYTHON_HOME/bin:$PATH
"export PATH
"
"
" stdc++ tags 生成
"       Create stdc++ tags: Download and unpack the modified libstdc++ headers to ~/.vim/tags/cpp_src
"       cd ~/.vim/tags
"       ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src
"       以下三个根据需求安装
"       ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gl /usr/include/GL/   # for OpenGL
"       ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f sdl /usr/include/SDL/ # for SDL
"       ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt4 /usr/include/qt4/ # for QT4
