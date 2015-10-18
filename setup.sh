#!/bin/bash

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
mkdir -p ~/.vim/colors/
cp ./hybrid.vim ~/.vim/colors
