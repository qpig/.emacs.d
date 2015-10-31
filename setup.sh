#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ -e $HOME/.spacemacs ]]; then
    rm $HOME/.spacemacs
fi
echo "Link .spacemacs"
ln -s $THIS_DIR/.spacemacs $HOME/.spacemacs	

echo "replace ~/.emacs.d"
rm ~/.emacs.d -rf
cp ./spacemacs ~/.emacs.d -r

if [[ -e $HOME/.emacs.d/private ]] ;then
    rm $HOME/.emacs.d/private -rf
echo "Link private"
ln -s $THIS_DIR $HOME/.emacs.d/private
fi
