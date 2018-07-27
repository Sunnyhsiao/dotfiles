" 請把以下內容加到 ~/.vimrc
" " 從此之後，你就可以用 F12 來開關  你從 windows 複製，在 putty 或 pietty
" 按右鍵時貼上的內容，資料的內容就不會亂跑嘍
"
set pastetoggle=<F12>

set nocompatible
set number
set autoread
set autoindent
set smartindent
set hlsearch
set ignorecase
set smartcase
set wildmenu
set backspace=2
set laststatus=2

set shiftwidth=4
set tabstop=4
set expandtab

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set t_Co=256
color darkblue

syntax on

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
vnoremap < <gv
vnoremap > >gv
"底下的參考網址:
"http://hugedream.blogspot.tw/2010/05/vim.html，(Enter好像會抓不到)
nmap <F4> :tabn <CR>
nmap <F3> :tabp <CR>

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
