export LC_ALL=zh_TW.UTF-8
export LANG=zh_TW
export PATH="$HOME/bin:$HOME/.bin:$PATH"
export TERM="screen-256color"
export CLICOLOR='true'
export LSCOLORS="exdxcxexbxegbeabagacad"

#alias grep='grep --color=auto'
alias grep='grep --color'
alias composer="php -d allow_url_fopen=1 ~/bin/composer"

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


