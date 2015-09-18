# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
#Make Alias
# function mkalias ()
# {
#         if [[ $1 && $2 ]]
#         then
#         echo -e "alias $1=\"$2\"" >> ~/.bashrc
#         alias $1="$2"
#         fi
# }
#Clean unused kernels
cleankernels() {
    dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get purge
}
#mkdir+cd
function mkcd() {
  mkdir -p "$1" && cd "$1";
}
###############History######################
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.
export HISTIGNORE="&:ls:bg:fg:clear"
shopt -s histappend
shopt -s cmdhist
#####################CD####################
shopt -s cdspell
export CDPATH='.:~:/home/walid/Desktop:/var/www/'
alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
###########################################
alias pbcopy='xclip -selection clipboard'
netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
}
pcinfo(){
	uname -a
	lsb_release -a
}
myip()
{
ifconfig | awk '/inet / {sub(/addr:/, "", $2); print $2}'
}
##############APT####################
alias srch='sudo apt-cache search'
alias inst='sudo apt-get install'
alias rmv='sudo apt-get remove --purge'
alias up='sudo apt-get update'
alias upg='sudo apt-get upgrade'
alias policy='sudo apt-cache policy'
alias repo="sudo apt-add-repository"
alias autoremove="sudo apt-get autoremove"
listppa(){
	for APT in `find /etc/apt/ -name \*.list`; do
	    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
	        HOST=`echo $ENTRY | cut -d/ -f3`
	        USER=`echo $ENTRY | cut -d/ -f4`
	        PPA=`echo $ENTRY | cut -d/ -f5`
	        #echo sudo apt-add-repository ppa:$USER/$PPA
	        if [ "ppa.launchpad.net" = "$HOST" ]; then
	            echo sudo apt-add-repository ppa:$USER/$PPA
	        else
	            echo sudo apt-add-repository \'${ENTRY}\'
	        fi
	    done
	done
}
fixmerge(){
sudo rm /var/lib/apt/lists/* -vf && sudo apt-get update
}
#############Python###############
alias pipi='sudo pip install'
alias pipu='sudo pip uninstall'
alias pips='sudo pip search'
alias piserve="python -m SimpleHTTPServer"
##################################
alias wget='wget -c'
alias lsd='ls -d */'
alias mkdir="mkdir -pv"
alias ping="ping -c 5"
alias desk="cd ~/Desktop"
alias bashrc="sublime ~/.bashrc"
alias c='clear'
alias reload='source ~/.bashrc'
alias subl='sudo sublime'
shopt -s checkwinsize
export PAGER='less -e'

currrconv() { wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3&hl=es" | sed '/res/!d;s/<[^>]*>//g'; }
alias eclipse="/home/walid/bin/eclipse/eclipse"
alias apache2="sudo service apache2 restart"
export PYTHONSTARTUP="$HOME/.pythonrc"
swish(){
	if [ $1 = "bash" ] 
		then
		    chsh -s /bin/bash
	        bash
	elif [ $1 = "zsh" ] 
		then
			chsh -s /bin/zsh
	        zsh
	else
		echo "error"
	fi
}
moveup(){
find -mindepth 2 -type f -print -exec mv {} . \;
}
  function apt-history(){
          case "$1" in
            install)
                  grep 'install ' /var/log/dpkg.log
                  ;;
            upgrade|remove)
                  grep $1 /var/log/dpkg.log
                  ;;
            rollback)
                  grep upgrade /var/log/dpkg.log | \
                      grep "$2" -A10000000 | \
                      grep "$3" -B10000000 | \
                      awk '{print $4"="$5}'
                  ;;
            *)
                  cat /var/log/dpkg.log
                  ;;
          esac
    }

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /home/walid/.travis/travis.sh ] && source /home/walid/.travis/travis.sh
