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

map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR>
map <S-L> gt
map <S-H> gT
vnoremap < <gv
vnoremap > >gv

" Display space at the end
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Vundle
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'mattn/emmet-vim'
Bundle 'wincent/Command-T'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/phpfolding.vim'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
filetype plugin indent on " required!

"安裝某些Bundle後的額外設定
"php foldeing開合方式:za
let php_folding = 1 "php folding設定: 開啟 *.php 時自動執行folding
autocmd BufWrite *.php :EnablePHPFolds<CR> "php folding設定: 存檔時重新解析一遍 php fold 的位置

