alias _c="clear"
alias _bash="vi ~/.bashrc"
alias _bashreload="source ~/.bashrc"
alias la="ls -lat"
alias ll="ls -la"
alias _dr1list="curl -k https://docker-registry/v1/search | python -m json.tool"
alias _dr2list="curl -k https://docker-registry01/v2/_catalog | python -m json.tool"

function _dr1repo() {
	curl -k https://docker-registry/v1/repositories/library/$1/tags | python -m json.tool
	curl -k https://docker-registry/v1/repositories/library/$1/tags | python -m json.tool | wc -l
}

function _dr2repo() {
	curl -k https://docker-registry01/v2/$1/tags/list | python -m json.tool
	curl -k https://docker-registry01/v2/$1/tags/list | python -m json.tool | wc -l
}

function _ps() {
	ps aux | grep $1
}

function _print() {                                                   
  grep -o "_[a-z0-9_]*[(|=]" ~/configs/.bashrc | awk -F '=' '{print $1}' | awk -F '(' '{print $1}'
}                                                                     

