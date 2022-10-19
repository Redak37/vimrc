#!/bin/sh

mv ./vimrc/.vimrc ~/

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
