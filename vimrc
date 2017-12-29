" modeline and Notes {
" vim: ts=8 sts=2 fdm=marker nowrap
" vim: set foldmarker={,} foldlevel=0 :
" }

" Basics {
    " 配置改动时自动加载
    autocmd! bufwritepost vimrc source ~/.vimrc	
    " 打开文件自动跳到上次编辑的位置	
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    set background=dark " we plan to use a dark background
    syntax on " syntax highlighting on
    set helplang=cn
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    set noerrorbells " don't make noise
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
    "设置键码超时为100ms，设置映射超时为2000ms
    set timeout timeoutlen=2000 ttimeoutlen=100
" }

" Vim UI {
    "colorscheme molokai
    "set cursorcolumn " highlight the current column
    set cursorline " highlight current line

    set incsearch " BUT do highlight as you type you
                   " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines
                     " betweens rows
    "set list " we do what to show tabs, to ensure we get them
             " out of my files
    "set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink
                     " matching brackets for
    "set nohlsearch " do not highlight searched for phrases
    set hls
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    "set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    set completeopt= " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return,
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent,
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with
                   " set list on
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default
                        " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still
                      " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
    function! SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function
                                   " (cleaner than default)
" }

" Plugin Settings {
    " TagList Settings {
        let Tlist_Auto_Open=0 " let the tag list open automagically
        let Tlist_Compact_Format = 1 " show small menu
        let Tlist_Ctags_Cmd = 'ctags' " location of ctags
        let Tlist_Enable_Fold_Column = 0 " do show folding tree
        let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
        let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill
                                        " yourself
        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
        let Tlist_Sort_Type = "name" " order by
        let Tlist_Use_Right_Window = 1 " split to the right side
                                        " of the screen
        let Tlist_WinWidth = 30 " 40 cols wide, so i can (almost always)
                                 " read my functions
        let Tlist_Auto_Highlight_Tag = 1
        "let Tlist_Auto_Update = 1
        let Tlist_Close_On_Select = 0
        let Tlist_Compact_Format = 0
        let Tlist_Display_Prototype = 0
        let Tlist_Display_Tag_Scope = 1
        let Tlist_Enable_Fold_Column = 0
        let Tlist_File_Fold_Auto_Close = 0
        let Tlist_GainFocus_On_ToggleOpen = 1
        let Tlist_Hightlight_Tag_On_BufEnter = 1
        let Tlist_Inc_Winwidth = 0
        let Tlist_Max_Submenu_Items = 1
        let Tlist_Max_Tag_Length = 30
        let Tlist_Process_File_Always = 0
        let Tlist_Show_Menu = 0
        let Tlist_Sort_Type = "order"
        let Tlist_Use_Horiz_Window = 0

        " Language Specifics {
            " just functions and classes please
            let tlist_aspjscript_settings = 'asp;f:function;c:class' 
            " just functions and subs please
            let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
            " don't show variables in freaking php
            let tlist_php_settings = 'php;c:class;d:constant;f:function' 
            " just functions and classes please
            let tlist_vb_settings = 'asp;f:function;c:class' 
            " }
        " }
    " lookupfile setting {
        let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
        let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
        let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
        let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
        let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
        if filereadable("./filenametags")                "设置tag文件的名字
            let g:LookupFile_TagExpr = '"./filenametags"'
        endif
        " }
    " Nerdtree settings {
    " 让Tree把自己给装饰得多姿多彩漂亮点
    let NERDChristmasTree=1
    " 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
    let NERDTreeAutoCenter=1
    " 指定书签文件
    let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
    " 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
    let NERDTreeMouseMode=2
    " 是否默认显示书签列表
    let NERDTreeShowBookmarks=1
    " 是否默认显示文件
    let NERDTreeShowFiles=1
    " 是否默认显示隐藏文件
    let NERDTreeShowHidden=1
    " 是否默认显示行号
    let NERDTreeShowLineNumbers=0
    " 窗口位置（'left' or 'right'）
    let NERDTreeWinPos='left'
    " 窗口宽度
    let NERDTreeWinSize=31
	" }
" }

" Map settings {
    " 自定义的键映射 {
    let mapleader = ","
    let g:mapleader = ","
    nnoremap <leader>e :e ~/.vimrc<CR>
    " }

    " 折叠相关的快捷键 {
    "zR 打开所有的折叠
    "za Open/Close (toggle) a folded group of lines.
    "zA Open a Closed fold or close and open fold recursively.
    "zi 全部 展开/关闭 折叠
    "zo 打开 (open) 在光标下的折叠
    "zc 关闭 (close) 在光标下的折叠
    "zC 循环关闭 (Close) 在光标下的所有折叠
    "zM 关闭所有可折叠区域
    " }

    " :W sudo saves the file 
    " (useful for handling the permission-denied error) {
    command W w !sudo tee % > /dev/null
    " }


    set paste
    " 实现了CTRL-C、CTRL-V复制粘贴，CTRL-S保存操作的映射 {
    set pastetoggle=<F10>


if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " for mac os
        set clipboard=unnamed
        vmap y :w !pbcopy<CR><CR>
        nmap yy :.w !pbcopy<CR><CR>
        nmap p :r !pbpaste<CR><CR>
    else
        " for linux
        inoremap <c-v> <C-r>+
        imap <c-s> <Esc>:w<CR>
        vnoremap <C-c> "+y
        cnoremap <C-v> <C-r>"
    endif
endif

    " cno即cnoremap缩写
    cno $q <C-\>eDeleteTillSlash()<cr>

    " Bash like keys for the command line
    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

    func! DeleteTillSlash()
        let g:cmd = getcmdline()

        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
        endif

        if g:cmd == g:cmd_edited
            if has("win16") || has("win32")
                let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
            else
                let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
            endif
        endif   

        return g:cmd_edited
    endfunc

    "vnoremap <c-c> "+y
    "inoremap <c-v> <esc>"+p<CR>i
    "imap <c-s> <Esc>:w<CR>
    " }

    " F12或,回车 取消高亮 {
    map <silent> <F12> :nohlsearch<CR>
    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>
    " }

    " 使用CTRL+[hjkl]在窗口间导航 map <C-j> <C-W>j {
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l
    nnoremap <C-j> <C-W>j
	" }     

    " 使用CTRL+[kj]在插入模式下的上下移动 map <UP> <DOWN> <LEFT> <RIGHT> {
    inoremap <C-k> <UP>
    inoremap <C-h> <LEFT>
    inoremap <C-l> <RIGHT>
    inoremap <C-j> <DOWN>
	" }

    " 使用箭头导航buffer {
    map <right> :bn<cr>
    map <left> :bp<cr>
	" }

    " 标签页的操作 {
    map <leader>tn :tabnew<cr>
    map <leader>te :tabedit
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove
	" }

    " 括号匹配 {
    "vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    "vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    "vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    "vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    "vnoremap $q <esc>`>a'<esc>`<i'<esc>
    "vnoremap $e <esc>`>a"<esc>`<i"<esc>
    " 非常好用的括号匹配，实际是自动生成括号
    " 实现便利和兼容的折中
    "inoremap $1 ()<esc>i
    "inoremap $2 []<esc>i
    "inoremap $3 {}<esc>i
    "inoremap $4 {<esc>o}<esc>O
    "inoremap $q ''<esc>i
    "inoremap $e ""<esc>i
    "inoremap $t <><esc>i
	" }

    " taglist plugin maps {
    set tags+=./../tags,./../../tags,./../../../tags,./../../../../tags
    nnoremap <leader>tl :TlistToggle<CR>
	" }

    " lookup plugin maps {
    "映射LookupFile为,lk
    nmap <silent> <leader>lk :LUTags<cr>
    "映射LUBufs为,ll
    nmap <silent> <leader>ll :LUBufs<cr>
    "映射LUWalk为,lw
    nmap <silent> <leader>lw :LUWalk<cr>
	" nerdtree plugin maps
    nnoremap <Leader>tt :NERDTree<CR>
	" }

    " 注释映射 {
    nnoremap <leader>//   i/* [ jcli : <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr> ]  */<left><left><left>
	" }
    
    " 在当前目录加载或卸载tags文件 {
   	" cta 加载tags
   	" ctd 卸载tags
   	map cta :call Add_tags()<CR>
   	map ctd :call Del_tags()<CR>
   	function! Add_tags()
   	    let dir =expand("%:p:h") 
   	    let curtags = dir."/tags"
   	    let curtags=substitute(curtags,'\\','\','g')
   	    if filereadable(curtags)
   	        exec "set tags+=".curtags
   	        echohl WarningMsg | echo "Succ to add tags![".curtags."]" | echohl None
   	    else
   	        echohl WarningMsg | echo "Fail to add tags! No tags in this file's path.[".curtags."]" | echohl None
   	    endif
   	endfunction
   	function! Del_tags()
   	    let dir =expand("%:p:h") 
   	    let curtags = dir."/tags"
   	    let curtags=substitute(curtags,'\\','\','g')
   	    exec "set tags-=".curtags
   	    if filereadable(curtags)
   	        echohl WarningMsg | echo "Succ to del tags![".curtags."]" | echohl None
   	    else
   	        echohl WarningMsg | echo "Succ to del tags! But no tags in this file's path.[".curtags."]" | echohl None
   	    endif
   	endfunction
   		" }

"
" }
"
" {
"

nnoremap <silent> <Leader>f :call Gather(input("Search for: "))<CR>
nnoremap <silent> <Leader>F :call Gather(@/)<CR>
nnoremap <silent> <Leader><Esc> :call CloseScratch()<CR>

" Gather search hits, and display in a new scratch buffer.
" see http://vim.wikia.com/wiki/Filter_buffer_on_a_search_result
function! Gather(pattern)
  if !empty(a:pattern)
    let save_cursor = getpos(".")
    let orig_ft = &ft
    " append search hits to results list
    let results = []
    execute "g/" . a:pattern . "/call add(results, getline('.'))"
    call setpos('.', save_cursor)
    if !empty(results)
      " put list in new scratch buffer
      new
      setlocal buftype=nofile bufhidden=hide noswapfile
      execute "setlocal filetype=".orig_ft
      call append(1, results)
      " delete initial blank line
      silent 1d
    endif
  endif
endfunction

" Delete the current buffer if it is a scratch buffer (any changes are lost).
function! CloseScratch()
  if &buftype == "nofile" && &bufhidden == "hide" && !&swapfile
    " this is a scratch buffer
    bdelete
    return 1
  endif
  return 0
endfunction

"
" }

