alias _c="clear"
alias _bash="vi ~/configs/.bashrc"
alias _bashreload="source ~/.bashrc"
alias la="ls -lat"
alias ll="ls -la"
alias _tr_1list="curl -k https://docker-registry/v1/search | python -m json.tool"
alias _trlist="curl -k https://docker-registry01/v2/_catalog | python -m json.tool"
alias _krlist="curl -k https://doc-kurs-reg01/v2/_catalog | python -m json.tool"
alias _prlist="curl -k https://doc-prod-reg01/v2/_catalog | python -m json.tool"
alias _dps="docker ps"
alias _dc="docker ps -a"
alias _di="docker images"
alias _dcup="./up.sh"
alias _tm="docker -H doc-test-master:2375"
alias _t1="docker -H doc-test-node01:2375"
alias _t2="docker -H doc-test-node02:2375"
alias _t3="docker -H doc-test-node03:2375"
alias _tsm="docker -H doc-test-master:2376"
alias _tmssh="ssh doc-test-master"
alias _t1ssh="ssh doc-test-node01"
alias _t2ssh="ssh doc-test-node02"
alias _t3ssh="ssh doc-test-node03"
alias _pmssh="ssh doc-prod-master"
alias _p1ssh="ssh doc-prod-node01"
alias _prssh="ssh doc-prod-reg01"
alias _p2ssh="ssh doc-prod-node02"
alias _p3ssh="ssh doc-prod-node03"
alias _pm="docker -H doc-test-master:2375"
alias _tr="docker -H docker-registry01:2375"
alias _p1="docker -H doc-prod-node01:2375"
alias _p2="docker -H doc-prod-node02:2375"
alias _p3="docker -H doc-prod-node03:2375"
alias _psm="docker -H doc-prod-master:2376"
alias _pr="docker -H doc-prod-reg01:2375"
alias _dm="docker -H doc-dev-master:2375"
alias _d1="docker -H doc-dev-node01:2375"
alias _d2="docker -H doc-dev-node02:2375"
alias _dsm="docker -H doc-dev-master:2376"
alias _dmssh="ssh doc-dev-master"
alias _d1ssh="ssh doc-dev-node01"
alias _d2ssh="ssh doc-dev-node02"
alias _d1="docker -H doc-dev-node01:2375"
alias _km="docker -H doc-kurs-master:2375"
alias _k1="docker -H doc-kurs-node01:2375"
alias _kr="docker -H doc-kurs-reg01:2375"
alias _kmssh="ssh doc-kurs-master"
alias _k1ssh="ssh doc-kurs-node01"
alias _krssh="ssh doc-kurs-reg01"

function _startlan_prod() {
	tmp_url=$(dig prod.startlan-esoknad.service.doc-prod +short | head -1)
	url=$(echo "${tmp_url%?}")
	realRev=$(http $url/api/startlan-esoknad/systeminfo 'Host:startlan.husbanken.no')

	tmp_url2=$(dig prod.startlan-esoknad.service.doc-prod +short | head -1)
	url2=$(echo "${tmp_url2%?}")
	wrongRev=$(http $url2/api/startlan-esoknad/systeminfo)

  echo "With Host:startlan.husbanken.no"
  echo $realRev | jq
  echo ""
  echo "Without Host header"
  echo $wrongRev | jq
}

function _startlan_test() {
  tmp_url=$(dig openam-startlan.startlan-esoknad.service.doc-test +short | head -1)
  url=$(echo "${tmp_url%?}")
  realRev=$(http $url/api/startlan-esoknad/systeminfo 'Host:openam-startlan.local.husbanken.no')

  tmp_url2=$(dig openam-startlan.startlan-esoknad.service.doc-test +short | head -1)
  url2=$(echo "${tmp_url2%?}")
  wrongRev=$(http $url2/api/startlan-esoknad/systeminfo)

	echo "With Host:openam-startlan.local.husbanken.no"
	echo $realRev | jq
	echo ""
	echo "Without Host header"
	echo $wrongRev | jq
}


function _dl() {
	docker logs $1
}

function _dcdel() {
	docker stop $1 && docker rm $1
}

function _didel() {
	docker rmi -f $1
}

function _tr_1() {
	curl -k https://docker-registry/v1/repositories/library/$1/tags | python -m json.tool
	curl -k https://docker-registry/v1/repositories/library/$1/tags | python -m json.tool | wc -l
}

function _tr_2() {
	curl -k https://docker-registry01/v2/$1/tags/list | python -m json.tool
	curl -k https://docker-registry01/v2/$1/tags/list | python -m json.tool | wc -l
}
function _pr_2() {
	curl -k https://doc-prod-reg01/v2/$1/tags/list | python -m json.tool
	curl -k https://doc-prod-reg01/v2/$1/tags/list | python -m json.tool | wc -l
}

function _kr_2() {
	curl -k https://doc-kurs-reg01/v2/$1/tags/list | python -m json.tool
	curl -k https://doc-kurs-reg01/v2/$1/tags/list | python -m json.tool | wc -l
}
function _ps() {
	ps aux | grep $1
}

function _print() {                                                   
  grep -o "_[a-z0-9_]*[(|=]" ~/configs/.bashrc | awk -F '=' '{print $1}' | awk -F '(' '{print $1}'
}                                                                     


#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time24h="\t"
Time24a="\A"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}
# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better
source /etc/bash_completion.d/git
export PS1=$IBlack$Time24h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off'\$ "; \
fi)'



tmux
