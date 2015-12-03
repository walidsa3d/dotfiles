##############APT####################
alias srch='sudo apt-cache search'
alias inst='sudo apt-get install'
alias rmv='sudo apt-get remove --purge'
alias up='sudo apt-get update'
alias upg='sudo apt-get upgrade'
alias policy='sudo apt-cache policy'
alias repo="sudo apt-add-repository"
alias auto="sudo apt-get autoremove"

#############Python###############
alias pipi='sudo pip install'
alias pipr='sudo pip uninstall'
alias pipu='sudo pip --upgrade'
alias pips='sudo pip search'
alias piserve="python -m SimpleHTTPServer"
alias flake="flake8 --immediate"
alias pyupload='sudo python setup.py sdist upload -r pypi'
alias pyregister='sudo python setup.py register -r pypi'
##################################
###############Bookmarks
alias desk="cd ~/Desktop"
alias movies="cd /mnt/store/.Movies"
alias ping="ping -c 5"
alias subl='sudo sublime'
alias eclipse="/home/walid/bin/eclipse/eclipse"
alias npmi="sudo npm install"
alias open="xdg-open"
alias subs="subliminal -l en -p opensubtitles -s"

#youtube-dl -q -o- $2 | mplayer -cache 8192  -;
#################Git
alias ga="git add -A"
alias gcm="git commit -m"
alias gp="git push"
alias gt="git tag"
alias gra="git remote add origin"
alias gb="git branch"
alias gco='git checkout'
alias ga='git add -A .'
alias gcm='git add -A . && git commit'
alias gst='git status'
alias glog='git log'
alias gslog='git shortlog'
alias gcp='git add -A . && git commit && git push origin master'
##################################################
alias grep='grep -i --color=auto'
alias sign='gpg --detach-sign --armor'
alias ls='ls --color=auto'
##############Process
alias p=' ps aux | grep'
alias k9='kill -9'
#################Core
if hash tree 2>/dev/null; then
    alias ts="tree -L 1 -shF --dirsfirst"
    alias tl="tree -L 1 -ugsphDF --dirsfirst"
    alias ta="tree -L 1 -ashF --dirsfirst"
    alias tal="tree -L 1 -augsphDF --dirsfirst"
else
    echo "Might want to install tree"
fi
alias ls="ls --color -Fh"
alias ll="ls --color -lFh"
alias la="ls --color -Fha"
alias lal="ls --color -lFha"
alias lsd='ls -d */'

if hash trash-put 2>/dev/null; then
    alias rm='trash-put -v'
else
    echo "Might want to install trash-cli"
    alias rm='rm -v'
fi

alias cp='cp -v'
alias mv='mv -v'
alias wget='wget -c'
alias mkdir="mkdir -pv"
alias c='clear'
alias symlink='ln -s'
alias bumpversion='bumpversion --allow-dirty'
alias py='python'
alias symlink='ln -s'
alias changelog='gitchangelog'
alias gf='git flow'
