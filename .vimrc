" 請把以下內容加到 ~/.vimrc
" ============================================================
" 要注意目前vimrc
" 好像會跑迴圈，每存一次檔案就會多跑一次，所以存越多次會跑越久，
" 不確定是因為vim的版本還是什麼問題，
" 目前要編輯的話盡量存一兩次就關掉重開
" 要測試的話可以存檔以後按Ctrl+c 打斷 (還沒找到問題)
" ============================================================

" 從此之後，你就可以用 F12 來開關  你從 windows 複製，在 putty 或 pietty
" 按右鍵時貼上的內容，資料的內容就不會亂跑嘍
"
set pastetoggle=<F12>

set nocompatible
set number
set autoread

"http://yyq123.blogspot.com/2010/10/vim-indent.html
"autoindent 在这种缩进形式中，新增加的行和前一行使用相同的缩进形式。可以使用以下命令，启用autoindent缩进形式。也可以点击==键进行缩进。
set autoindent
"smartindent
"在这种缩进模式中，每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出花括号，当遇到右花括号（}），则取消缩进形式。此外还增加了识别C语言关键字的功能。如果一行是以#开头的，那么这种格式将会被特殊对待而不采用缩进格式。可以使用以下命令，启用smartindent缩进结构
"When having it on you also should have autoindent on
set smartindent
set cursorline
set nohls               "快速查詢模式(自動搜尋)"
set incsearch           "修改文件後,自動備份"
set showmode            "在狀態列顯示目前的模式，例如是 Insert mode 或是 Visual mode。當然平常的 normal mode(commond mode)是不顯示的。在載入檔案的同時，會在這個地方顯示檔案名稱及其總行數、總字元數。
set hlsearch
set ignorecase
set smartcase
set wildmenu
set backspace=2 " allow backspacing over everything in insert mode / bs = 2
set laststatus=2 "顯示狀態行

set shiftwidth=4
set tabstop=4 "用tab產生4個空格/ts = 4
set expandtab
set nobackup            " keep a backup file

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set t_Co=256
set ruler
"It tells Vim to look for a tags file in the directory of the current file, in the current directory and up and up until your $HOME : https://stackoverflow.com/questions/11975316/vim-ctags-tag-not-found
set tags=./tags,tags;$HOME

color darkblue
"set clipboard=unnamed
"Try 了上面的 但是好像沒有用?

"自動完成ctrl+x, ctrl+o (可看底下phpcomplete網址範例)
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP "https://www.simplified.guide/vim/auto-complete-php
au BufRead *.php set ft=php.html  "這兩行是想要讓編輯php時編輯html也能自動對齊
au BufNewFile *.php set ft=php.html
syntax on "語法上色

autocmd bufwritepost .vimrc source ~/.vimrc
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"底下這個為測試程式碼，按F2(不用按fn鍵，就可以在底下欄位看到echo的東西，也不用重跑)
"//參考範例 http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" map 區別可參考 (http://yyq123.blogspot.tw/2010/12/vim-map.html)
" map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR>
map <S-L> gt
map <S-H> gT
map <F9> :Tlist<CR>
vnoremap < <gv
vnoremap > >gv
"底下的參考網址:
"http://hugedream.blogspot.tw/2010/05/vim.html，(Enter好像會抓不到)
nmap <F4> :tabn <CR>
nmap <F3> :tabp <CR>
"https://blog.longwin.com.tw/2009/02/vim-tree-explorer-nerdtree-plugin-2009/
nnoremap <silent> <F10> :NERDTree<CR>

" Display space at the end
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Vundle
" setup steps:
" 1.確定有裝curl & git
" 2.安裝vundle:$git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 3.確認設定無誤以後，Launch vim and run :PluginInstall
" 參考來源: https://github.com/VundleVim/Vundle.vim
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'wincent/Command-T'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/phpfolding.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'neoclide/coc.nvim'

call vundle#end()
filetype plugin indent on " required!

"scrooloose/syntastic 語法檢查設定
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 1
let g:syntastic_php_checkers = ['phpcs', 'phpmd', 'php']
let g:syntastic_html_tidy_ignore_errors = [
	\ "proprietary attribute ",
	\ "trimming empty <", "unescaped &",
	\ "lacks \"action",
	\ "is not recognized!",
	\ "discarding unexpected "
\ ]

" Configure vim-airline extension
let g:airline#extensions#syntastic#enabled = 1

"上面的空行代表下面開始的是自己後來裝的
"安裝某些Bundle後的額外設定
"php foldeing開合方式:za
let php_folding = 1 "php folding設定: 開啟 *.php 時自動執行folding

"php folding設定: 存檔時重新解析一遍 php fold 的位置
"因為會有error先關掉
 "autocmd BufWrite *.php :EnablePHPFolds<CR>

" Auto remove all trailing whitespace when save file ,若要啟用請把下面註解拿掉
"autocmd BufWritePre * :%s/\s\+$//e

"利用以下命令，可以在状态行中显示：当前文件名稱，編碼，行數等等資訊。
"http://nano-chicken.blogspot.com/2014/07/vim-statusline.html
set statusline=
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %F\                                "File
"set statusline+=%2*\ %<%F\                                "File+path
set statusline+=%3*\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}\  "Encoding
set statusline+=%4*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%5*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%6*\ row:%l/%L\ col:%03c\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
hi User2 ctermfg=3  ctermbg=0
hi User6 ctermfg=3  ctermbg=4

let s:vimcomment = "0"    "用 F11 來開關  /*  ~  */ 的註解 ，目前不確定會不會work
func! Comment_Toggle()
  if s:vimcomment == "0"
    set foldmethod=marker
    set foldmarker=/*,*/
    let s:vimcomment = "1"
  else
    set foldmethod=syntax
    let s:vimcomment = "0"
  endif
endf
map! <F11> : call Comment_Toggle()<CR>
