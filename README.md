# Dotfiles

My dotfiles. Tailored for C/C++ development under Linux.

## Used Vim plugins

* Pathogen - Vim plugin manager
* NERDTree - File explorer panel
* Airline - Status bar
* Tagbar - C tag browser
* ctrlp - Fuzzy file, buffer, mru, tag finder
* Syntastic - Syntax checking
* cscope - C scope and function finder
* YouCompleteMe - Autocompletion
* Fugitive - Git integration
* gitgutter - Show Git diff while editing
* EasyMotion - Moving through words in file

## Requirements for certain Vim plugins

* To download plugins: installation of Git required with stable internet connection
* Tagbar: installation of [Exuberant Ctags](http://ctags.sourceforge.net/)
* cscope: installation of [Cscope](http://cscope.sourceforge.net/)
* YouCompleteMe: installation of Python and [Clang compiler frontend](https://clang.llvm.org/)

## Installation
```bash
git clone https://github.com/balintkiss501/dotfiles.git
cd dotfiles
chmod u+x bootstrap.sh
./bootstrap.sh
```
This will create symlinks in your $HOME to the dotfiles directory and downloads all plugins as git submodules with `git clone --recursive`.

To use semantic C/C++ code completion, compile YouCompleteMe with the --clang-completer flag.
```bash
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
