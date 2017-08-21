#!/bin/bash

DOTFILES_FOLDER=`pwd`

#TODO: backup

# Create symlinks in home directory
echo "Symlinking dotfiles to HOME..."
ln -fs $DOTFILES_FOLDER/gdb/.gdbinit ~/.gdbinit
ln -fs $DOTFILES_FOLDER/vim/.vimrc ~/.vimrc
ln -fs $DOTFILES_FOLDER/vim/.vim ~/.vim

# Install Pathogen
echo "Installing Pathogen for Vim plugins..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install Vim plugins
echo "Installing Vim plugins..."
git submodule update --init --recursive

# Install YouCompleteMe Vim plugin
cd .vim/bundle/YouCompleteMe
./install.py --clang-completer
