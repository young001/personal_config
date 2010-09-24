set nocp
filetype plugin indent on
set history=50
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
syntax on
set hlsearch
set nobackup
setlocal noswapfile
set bufhidden=hide
set ruler
set nu
set showcmd
set mouse=a
set shortmess=atI
set ignorecase
set incsearch
set smartindent
set autoindent
"set guifont=Courier\ 10\ Pitch\ 10
set guifont=DejaVu\ Sans\ Mono\ 10  
"set guifont=WenQuanYi\ Micro\ Hei\ 9
"set guifont=FreeSans\ 7 
"Set mapleader
let mapleader = ","
set path=.,/home/young001/programming,,/home/young001,/home/young001/文档
"if filereadable(".viminfo")
 "   rviminfo .viminfo
"endif
"if filereadable("Session.vim")
"source /home/young001/programming/Session.vim
"endif
"au Filetype perl :set equalprg=perltidy
"au Filetype c :set equalprg=indent
"au VimLeave * WMToggle
"au VimLeave * !rm /home/young001/Session.vim
au VimLeave * mksession! /home/young001/Session.vim
au VimLeave * wviminfo! /home/young001/young001.viminfo
"au VimEnter * WMToggle
"source /home/young001/Session.vim
"rviminfo /home/young001/young001.viminfo
"au VimEnter * WMToggle
"Fast reloading of the .vimrc
map <silent> <leader>sg :source ~/.gvimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.gvimrc<cr>
"When .vimrc is edited, reload it
"autocmd! bufwritepost .vimrc source ~/.vimrc
"map <silent> <leader>ss :source ~/.gvimrc<cr>
map <C-s> :w<cr>
map <C-t> :sp<cr>
map <C-v> "+gP<cr>
map <C-c> "+y<cr>
map <C-x> "+x<cr>
map <C-q> :wq<cr>
map <A-q> :bd<cr>
map :q :bd<cr>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Show_Menu = 1
let Tlist_Use_SingleClick = 1
"let Tlist_Auto_Open = 1
"map <F7> :TlistToggle<cr>
"let g:netrw_winsize = 20
"map <silent> <F6> :Sexplore!<cr>
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1 "  Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30 "  Split width
"let g:bufExplorerUseCurrentWindow=1 "  Open in new window.autocmd BufWinEnter \[Buf\ List\] setl nonumber
autocmd BufWinEnter \[Buf\ List\] setl nonumber
let g:winManagerWindowLayout = "BufExplorer|FileExplorer|TagList"
"let g:winManagerWindowLayout = "BufExplorer|FileExplorer"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <leader>vt :FirstExplorerWindow<cr>
nmap <leader>vb :BottomExplorerWindow<cr>
nmap <silent> <F8> :WMToggle<cr>
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
nmap <silent> <leader>ll :LUBufs<cr>
" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry
    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
let g:LookupFile_TagExpr = '"/home/young001/programming/filenametags"'
setlocal bufhidden=hide
colorscheme desert
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>   
"next error
nmap <leader>cb :cp<cr>
"last error
nmap <leader>cv :cw 8<cr>
"show 8 error
set sessionoptions-=curdir
set sessionoptions+=sesdir
"set sessionoptions=blank,buffers,folds,help,options,tabpages,winsize,sesdir
set sessionoptions=blank,folds,help,options,tabpages,winsize,sesdir
set guioptions-=s
"close menu-bar
set guioptions-=m
"close toolbar
set guioptions-=T
nmap <leader>ss :source /home/young001/Session.vim<cr>
nmap <leader>cf :!ctags -R /home/young001/programming<cr>
nmap <leader>cppf :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q /home/young001/programming<cr>
"cut vertical
"nmap <leader>cv <C-w><C-v><cr>
nmap <leader>cv <C-w><C-v><cr>
",vj向上,vk是向下,vh相左,vl向右
nmap <leader>vk <C-w><C-k><cr>
nmap <leader>vj <C-w><C-j><cr>
nmap <leader>vh <C-w><C-R><cr>
nmap <leader>vl <C-w><C-r><cr>
"let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "context"
"fold the codes by syntax
"autocmd FileType c,cpp setl fdm=syntax | setl fen
let g:pydiction_location = '~/.vim/complete-dict'
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20 
"set makeprg=gcc\ -Wall\ -ohello\ hello.c
"inoremap <C-p> <C-X><C-O>
"inoremap <C-F> <C-X><C-F>
"inoremap <C-D> <C-X><C-D>
"inoremap <C-L> <C-X><C-L>
"setting for completion
set completeopt=menu
set pumheight=8
