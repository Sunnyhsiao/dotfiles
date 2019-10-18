export LC_ALL=zh_TW.UTF-8
export LANG=zh_TW
export PATH="$HOME/bin:$HOME/.bin:$PATH"
export TERM="screen-256color"
export CLICOLOR='true'
export LSCOLORS="exdxcxexbxegbeabagacad"
export BASH_SILENCE_DEPRECATION_WARNING=1 # 關閉macOS Catalina 預設zsh警告
source "/Users/sunnyhsiao/dotfiles/bash-it-uselist/git.completion.bash"

#alias grep='grep --color=auto'
alias grep='grep --color'
# https://n.sfs.tw/content/index/11080 (ls 說明參考網址)
# 看起來“ - color = tty”不能在BSD OS中使用，例如MacOS，而如果使用“ - G”則可以。
# (visual studio code 目前我的環境只能用-G)
# https://endoyuta.com/2015/05/13/mac-yosemite-ls/
alias ls='ls -G'
#alias composer="php -d allow_url_fopen=1 ~/bin/composer" 目前這台電腦用brew install 安裝，就不用另外寫了
#git clone PHP_CodeSniffer以後記得要開啟
#可以用 --standard=PSR2 就只看有沒有follow PSR2的規則， 目前我的預設值已經設定為PSR2了
#可參考https://clouding.city/php-phpcs-phpcbf/
alias phpcs="php -d allow_url_fopen=1 ~/dotfiles/PHP_CodeSniffer/bin/phpcs"
alias phpcbf="php -d allow_url_fopen=1 ~/dotfiles/PHP_CodeSniffer/bin/phpcbf"

# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

function git_branch {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
echo "("${ref#refs/heads/}") ";
}
 
function git_since_last_commit {
now=`date +%s`;
last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
seconds_since_last_commit=$((now-last_commit));
minutes_since_last_commit=$((seconds_since_last_commit/60));
hours_since_last_commit=$((minutes_since_last_commit/60));
minutes_since_last_commit=$((minutes_since_last_commit%60));
 
echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}
 
PS1="\[\e[0;35m\]\h#\[\033[0m\][\[\e[0;32m\]\u\[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ "

#bash-it
#不過目前應該沒有用到，(至少主題沒有)，自己要去載來安裝
# Path to the bash it configuration
export BASH_IT="/Users/sunnyhsiao/dotfiles/bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
