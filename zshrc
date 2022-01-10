# git
alias gadd='git add -u'
alias gb='git branch --sort=-committerdate'
alias gcam='git commit -am'
alias gcm='git commit -m'
alias gco='git checkout'
alias gpush='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gst='git status'
alias pyclean='find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +'
alias grep='grep --color=auto -n'

# sourcing
alias sse="source ~/.zshenv"
alias sie="vi ~/.zshenv"
alias ssr="source ~/.zshrc"
alias sir="vi ~/.zshrc"

# cd'ing
alias gotemp="cd `mktemp -d`"
alias mkdate='mkdir $(date +"%Y-%m-%d")'
alias cddate='cd $(date +"%Y-%m-%d")'
