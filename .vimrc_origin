highlight Normal ctermfg=grey ctermbg=black

set encoding=utf8
set termencoding=utf8
set fileencoding=utf8
set fileencodings=utf8,gb2312,ucs-bom,big5
set ruler
set clipboard=unnamed

set omnifunc=htmlcomplete#CompleteTags  "自動補齊html"
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
au BufRead *.php set ft=php.html  "這兩行是想要讓編輯php時編輯html也能自動對齊,但好像沒用...
au BufNewFile *.php set ft=php.html

filetype on          "Enable filetype detection
filetype indent on   "Enable filetype-specific indenting
filetype plugin on   "Enable filetype-spcific plugins

syntax on  "語法上色
set shiftwidth=4
set smartindent
set autoindent

set cursorline
set nohls               "快速查詢模式(自動搜尋)"
set incsearch           "修改文件後,自動備份"
set showmode            "在狀態列顯示目前的模式，例如是 Insert mode 或是 Visual mode。當然平常的 normal mode(commond mode)是不顯示的。在載入檔案的同時，會在這個地方顯示檔案名稱及其總行數、總字元數。
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set nobackup            " keep a backup file
set nu

set ts=4         "用tab產生4個空格
set expandtab      "同上

set laststatus=2    "顯示狀態行

" Auto remove all trailing whitespace when save file ,若要啟用請把下面註解拿掉
"autocmd BufWritePre * :%s/\s\+$//e


"以下五行利用以下命令，可以在状态行中显示：当前文件名，文件格式(DOS, Unix)，文件类型 (XHTML)，当前位置和文件总行数。
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%2*%n%m%r%h%w%*\ %F\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [TYPE=%2*%Y%1*]\ [COL=%2*%03v%1*]\ [ROW=%2*%03l%1*/%3*%L(%p%%)%1*]\
"hi User1 guifg=gray
"hi User2 guifg=red
"hi User3 guifg=white

let s:vimcomment = "0"    "用 F11 來開關  /*  ~  */ 的註解
func Comment_Toggle()
  if s:vimcomment == "0"
       set foldmethod=marker
            set foldmarker=/*,*/
	         let s:vimcomment = "1"
		   else
		        set foldmethod=syntax
			     let s:vimcomment = "0"
			       endif
			       endf
			       map <F11> : call Comment_Toggle()<CR>


set pastetoggle=<F12>  "可以用 F12 來開關  你從 windows 複製，在 putty 或 pietty 按右鍵時貼上的內容，資料的內容就不會亂跑嘍
