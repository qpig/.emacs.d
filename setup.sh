#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ -e $HOME/.spacemacs ]]; then
    rm $HOME/.spacemacs
fi
echo "Link .spacemacs"
ln -s $THIS_DIR/.spacemacs $HOME/.spacemacs	

#show replace manual
if ! [[ -e ~/.emacs.d ]]; then
    echo "replace ~/.emacs.d"
    rm ~/.emacs.d -rf
    cp ./spacemacs ~/.emacs.d -r
fi

if [[ -e $HOME/.emacs.d/private ]] ;then
    rm $HOME/.emacs.d/private -rf
    echo "Link private"
    ln -s $THIS_DIR $HOME/.emacs.d/private
fi

if ! [[ -e /usr/local/bin/chinese_emacs ]]; then
    echo install chinese_emacs
    sudo cp ./chinese_emacs /usr/local/bin/
fi
