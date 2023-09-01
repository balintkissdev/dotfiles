#!/bin/env bash

dotfiles_folder=$(pwd)

backup_timestamp=$(date +%Y-%m-%d-%H-%M-%S)
dotfiles=(
    ".bashrc.d"
    ".config/fontconfig"
    ".config/i3"
    ".config/nvim"
    ".gdbinit"
    ".local/share/fonts"
    ".tmux.conf"
)

# Backup
backup_folder="$HOME/dotfiles_backup_${backup_timestamp}"
mkdir -p "$backup_folder"
for f in "${dotfiles[@]}"; do
    source_path="${HOME}/${f}"

    # If symlink, get actual file instead of copying symlink
    if [ -L "$source_path" ]; then
        symlink_target=$(readlink -f "$source_path")
        if [ -e "$symlink_target" ]; then
            echo "Backing up ${symlink_target} to ${backup_folder}/${f}"
            cp -r "$symlink_target" "${backup_folder}/"
        fi
    # If regular file
    elif [ -e "$source_path" ]; then
        echo "Backing up ~/${f} to ${backup_folder}/${f}"
        mv "$source_path" "${backup_folder}/"
    fi
done

# Create
for f in "${dotfiles[@]}"; do
    echo "Symlinking ~/${f}"
    mkdir -p "${HOME}/$(dirname "${f}")"
    ln -fsn "${dotfiles_folder}/${f}" "${HOME}/${f}"
done

source "$HOME/.bashrc"
echo "Done!"
