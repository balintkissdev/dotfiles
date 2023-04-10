#!/bin/env bash

set -x

DOTFILES_FOLDER=`pwd`

echo "Symlinking dotfiles to HOME..."
ln -fs $DOTFILES_FOLDER/.bashrc.d ~/.bashrc.d
ln -fs $DOTFILES_FOLDER/gdb/.gdbinit ~/.gdbinit
mkdir -p ~/.config

echo "Setting up fonts..."
mkdir -p ~/.local/share/fonts
ln -fs $DOTFILES_FOLDER/.local/share/fonts ~/.local/share/fonts
ln -fs $DOTFILES_FOLDER/.config/fontconfig ~/.config/fontconfig

echo "Setting up NeoVim..."
ln -fs $DOTFILES_FOLDER/.config/nvim ~/.config/nvim

