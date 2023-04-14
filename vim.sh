#!/usr/bin/env sh

SUDO=$(command -v sudo)

if [ "$(uname)" = "Darwin" ]; then
  PKGM=brew
  SUDO=""
elif [ "$(uname)" = "Linux" ]; then
  PKGM=apt
  SUDO=$(command -v sudo)
else
  echo "Unsupported platform $(uname)" | exit 1
fi

if [ "$PKGM" = "" ]; then
  echo "Couldn't find $PKGM" | exit 1
fi

$SUDO $PKGM update
$SUDO $PKGM install -y vim git
cp ./.vimrc ~/.vimrc
cp -r ./.vim ~/.vim
mkdir -p ~/.vim_runtime/temp_dirs/undodir/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c silent! -c PluginUpdate -c q -c q
