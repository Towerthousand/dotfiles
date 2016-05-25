#!/bin/bash

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
echo 'REMEMBER TO INSTALL YCM STUFF!'
rm ./install.sh
