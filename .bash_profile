export LC_ALL=no_NO.UTF-8
export LANG=no_NO.UTF-8

export PATH=$PATH:$HOME/Library/Python/2.7/bin
/Users/sma/Library/Python/2.7/bin/powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/sma/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

alias js='ssh sma@gf-jump.vipps.io'
alias sshkey='cat ~/.ssh/id_rsa.pub'
alias vi='vim'
alias vm-th1='ssh deploy@13.81.175.160'
alias vm-th2='ssh deploy@51.144.48.58'
alias vm-th3='ssh deploy@65.52.132.69'
alias req='ssh deploy@51.145.133.233'
alias gc='git commit -m'
alias ga='git add'
alias gp='git push'
alias gpr='git pull --rebase'
alias mci='mvn clean install'
alias k='kubectl'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pods'
alias kl='kubectl logs'
alias hlt='helm list --tls --tls-cert  /Users/sma/.helm/helm.cert.pem.test --tls-key  /Users/sma/.helm/helm.key.pem.test'
alias hdt='helm delete --tls --tls-cert  /Users/sma/.helm/helm.cert.pem.test --tls-key  /Users/sma/.helm/helm.key.pem.test --purge'
alias hlp='helm list --tls --tls-cert  /Users/sma/.helm/helm.cert.pem.prod --tls-key  /Users/sma/.helm/helm.key.pem.prod'
alias pbu='helm upgrade --tls --tls-cert  /Users/sma/.helm/helm.cert.pem.test --tls-key  /Users/sma/.helm/helm.key.pem.test -f deploy/charts/paymentsbatch/values.test.yaml --namespace payments --install paymentsbatch ./deploy/charts/paymentsbatch'
alias h='helm'
alias gs='git status'
alias aass='az account set --subscription'
alias aas='az account show'
alias aal='az account list'
alias al='az login'
alias vb='vim ~/git/configs/.bash_profile'
alias sb='source ~/.bash_profile'
alias pb='cat ~/git/configs/.bash_profile'

alias tcurl='kubectl run -i --tty curl --image=tutum/curl --restart=Never -- sh'
alias dpod='kubectl delete pod'
alias ka='kgp --all-namespaces'
alias ks='kubectl get services --all-namespaces'
alias ll='ls -lah'
alias gx='ga . && gc "." && gp'
alias gco='git checkout'
alias grhh='git reset --hard HEAD'
alias gb='git branch -a'
alias gl='git log'

function yaml2Json() {
	python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < $1 > $2 
}
alias gpu='git push --set-upstream origin'
