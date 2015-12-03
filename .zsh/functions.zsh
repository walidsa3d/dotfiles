#list all ppas
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
#fix merge list problems
fixmerge(){
sudo rm /var/lib/apt/lists/* -vf && sudo apt-get update
}
#list packages in a ppa
listpack(){
awk '$1 == "Package:" { if (a[$2]++ == 0) print $2; }' /var/lib/apt/lists/*$1*$2*Packages
}
#extract archives
extract() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}
mkalias(){
  echo "alias $1='$2'" >>~/dotfiles/.zsh/aliases.zsh
}
ip(){
  echo "External IP:"
  dig +short myip.opendns.com @resolver1.opendns.com
}
trees(){
  tree -L $1
}
mkcd() {
  mkdir -p $1 & cd $1
}
gc(){
  git add -A . & git commit -m
}
#Git: bump version (major, minor, patch), generate changelog, commit all and tag
release() {
  version=$(bumpversion --allow-dirty --list $1|grep new_version|rev|cut -d= -f1|rev)
  echo $version
  gitchangelog > HISTORY
  git add -A .
  git commit
  git tag $version
}
fixzshistory(){
  cd
  mv .zsh_history .zsh_history_bad
  strings .zsh_history_bad > .zsh_history
  fc -R .zsh_histo
}




