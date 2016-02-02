#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ -e $HOME/.spacemacs ]]; then
    echo "replace ~/.spacemacs"
    rm $HOME/.spacemacs
else
    echo "Link .spacemacs"
fi
ln -s $THIS_DIR/.spacemacs $HOME/.spacemacs	

#show replace manual
if [[ -e ~/.emacs.d ]]; then
    echo "replace ~/.emacs.d"
    rm ~/.emacs.d -rf
else
    echo "copy ~/.emacs.d"
fi
cp ./spacemacs ~/.emacs.d -r

if [[ -e $HOME/.emacs.d/private ]] ;then
    rm $HOME/.emacs.d/private -rf
    echo "replace private"
else
    echo "Link private"
fi
ln -s $THIS_DIR $HOME/.emacs.d/private

if [[ -e /usr/local/bin/chinese_emacs ]]; then
    echo "replace chinese_emacs"
    sudo rm /usr/local/bin/chinese_emacs
else
    echo install chinese_emacs
fi
sudo cp ./chinese_emacs /usr/local/bin/chinese_emacs
