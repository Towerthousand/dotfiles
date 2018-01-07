#!/bin/bash

set -e

echo 'Ensuring dependencies..'
sudo apt install git curl dh-autoreconf

echo 'Installing neobundle..'
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh

echo 'Installing fonts..'
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo 'Installing battery plugin...'
curl -O https://raw.githubusercontent.com/holman/spark/master/spark
sudo mv spark /usr/local/bin
sudo chmod u+x /usr/local/bin/spark

curl -O https://raw.githubusercontent.com/goles/battery/master/battery
sudo mv battery /usr/local/bin
sudo chmod u+x /usr/local/bin/battery

echo 'Installing ctags...'
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
cd ..
rm -rf ctags

echo 'Remember to install YCM stuff after first vim startup, and switch the terminal font & colors.'
