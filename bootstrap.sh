#!/bin/env bash

dotfiles_folder=$(pwd)

dotfiles=(
    ".bashrc.d"
    ".config/alacritty"
    ".config/fontconfig"
    ".config/i3"
    ".config/nvim"
    ".env"
    ".gdbinit"
    ".local/share/fonts"
    ".tmux.conf"
)

dependencies=(
    alacritty
    automake
    fzf
    gcc
    i3
    make
    neovim
    picom
    ripgrep
    tmux
)

install_dependencies() {
    echo "Installing dependencies ..."
    local package_install_cmd
    # Ubuntu/Debian
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get update
        package_install_cmd=(apt-get install -y)
        dependencies+=('g++')
    # Fedora
    elif [ -x "$(command -v dnf)" ]; then
        package_install_cmd=(dnf install -y)
        dependencies+=('g++')
    # Arch Linux
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -Sy
        package_install_cmd=(pacman -S --noconfirm --needed)
    else
        echo "error: Unsupported package manager. Currently supported package managers: apt-get, dnf, pacman. Please install the following dependencies manually:"
        for dep in "${dependencies[@]}"; do
            echo "  $dep"
        done
        exit 1
    fi

    sudo "${package_install_cmd[@]}" "${dependencies[@]}" || exit 1
}

install_dependencies

# Backup
backup_timestamp=$(date +%Y-%m-%d-%H-%M-%S)
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
