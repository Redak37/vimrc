#!/bin/sh

cd ./vimrc && mv .vimrc ~/

cd ..

rm -rf vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

cd ~/
