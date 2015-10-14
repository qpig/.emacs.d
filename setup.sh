#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if ! [[ -L $HOME/.spacemacs ]] ; then
	if [[ -e $HOME/.spacemacs ]]; then
		rm $HOME/.spacemacs
	fi
	echo "Link .spacemacs"
	ln -s $THIS_DIR/.spacemacs $HOME/.spacemacs	
fi

if ! [[ -L $HOME/.emacs.d/private ]] && [[ -d $HOME/.emacs.d/private ]]; then
	echo "Link private"
	mv $HOME/.emacs.d/private $HOME/.emacs.d/private.bak
	ln -s $THIS_DIR $HOME/.emacs.d/private
fi
