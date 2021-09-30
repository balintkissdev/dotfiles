#!/bin/env bash

set -x

DOTFILES_FOLDER=`pwd`

echo "Symlinking dotfiles to HOME..."
ln -fs $DOTFILES_FOLDER/.bashrc.d ~/.bashrc.d
ln -fs $DOTFILES_FOLDER/gdb/.gdbinit ~/.gdbinit
mkdir -p ~/.config

echo "Setting up NeoVim..."
ln -fs $DOTFILES_FOLDER/.config/nvim ~/.config/nvim
ln -fs ~/.config/nvim/init.vim ~/.vimrc

