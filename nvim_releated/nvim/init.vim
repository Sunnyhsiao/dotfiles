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
call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-powerline'
"Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'wincent/Command-T'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/phpfolding.vim'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()

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


"===自动化===
"==coc配置==
" 查看：https://github.com/neoclide/coc.nvim 中Extensions的列表
" 执行命令安装coc对相应语言的补全

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
