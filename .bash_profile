export LC_ALL=no_NO.UTF-8
export LANG=no_NO.UTF-8

export PATH=$PATH:$HOME/Library/Python/2.7/bin
/Users/sma/Library/Python/2.7/bin/powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/sma/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

alias vi='vim'
alias vm-th1='ssh deploy@51.144.52.179'
alias vm-th2='ssh deploy@51.144.48.58'
alias gc='git commit -m'
alias ga='git add'
alias gp='git push'
alias gpr='git pull --rebase'
alias mci='mvn clean install'
alias k='kubectl'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pods'
alias kl='kubectl logs'
alias hl='helm list'
alias h='helm'
alias gs='git status'
alias aass='az account set --subscription'
alias aas='az account show'
alias aal='az account list'
alias al='az login'
alias vb='vim ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias pb='cat ~/.bash_profile'

alias tcurl='kubectl run -i --tty curl --image=tutum/curl --restart=Never -- sh'
alias dtcurl='kubectl delete pod curl'
alias ka='kgp --all-namespaces'
alias ll='ls -lah'
alias gt='ga . && gc "." && gp'
