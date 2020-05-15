"要記得改.bashrc 裡面的git.completion.bash & BASH_IT 路徑

"vimrc_mix_two 合併vimrc & .vimrc_origin的
目前先把vimrc_mix_two的設定檔在local設定為.vimrc的設定
但是因為他會有迴圈問題，所以先暫時不放上gitlab (還未找出原因)

"taglist 功能: 長出檔案的list檔，目前我預設用F9 叫出，在.vimrc (map <F9> :Tlist<CR>)

"ctags : 像taglist，用brew install安裝，但是下完指令以後會建立指令底下的list，目前有人有設定檔可以參考(但是我還沒用也還沒研究)，這樣像supertab 就可以按"ctrl+ ]" 跳到相對應的位置
目前只下這個指令
    ctags -R --exclude=.git --exclude=log *
和在.vimrc 設定 set tags=./tags,tags;$HOME
(所以現在會在Home & 下指令的地方看到tags，目前已經先手動把HOME產生的tags刪掉了)
網址: https://gist.github.com/erickpatrick/c329c0a81f286d148d0a043708c9ee46
之後要再整理ctags的話可能會需要參考這一篇設定.ctags檔案
