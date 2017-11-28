#!/bin/bash

set -e

echo 'Ensuring dependencies..'
sudo apt install git curl

echo 'Installing neobundle..'
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh

echo 'Installing fonts..'
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo 'Installing battery plugin...'
curl -O https://raw.githubusercontent.com/holman/spark/master/spark
sudo mv spark /usr/local/bin
sudo chmod u+x /usr/local/bin/spark

curl -O https://raw.githubusercontent.com/goles/battery/master/battery
sudo mv battery /usr/local/bin
sudo chmod u+x /usr/local/bin/battery

echo 'Remember to install YCM stuff, and switch the terminal font & colors.'
