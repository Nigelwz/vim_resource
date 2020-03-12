#!/bin/bash

#set terminal color
sed -i '$a  PS1="\[\033[1;36;01m\]\u\[\033[00m\]\[\033[1;34;01m\]@\[\033[00m\]\[\033[1;32;01m\]\h\[\033[00m\]\[\033[34;01m\]:\[\033[00m\]\[\033[33;01m\]\w\[\033[00m\]\[\033[31;01m\] \$\[\033[37;00m\] " ' ~/.bashrc

source ~/.bashrc

set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script"

echo installing the must-have pre-requisites
while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    perl
    zip unzip
    build-essential
	git
	libncurses5-dev
	curl
    wget
	vim
EOF
)

echo installing the nice-to-have pre-requisites
echo you have 5 seconds to proceed ...
echo or
echo hit Ctrl+C to quit
echo -e "\n"
sleep 6

