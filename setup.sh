#!/bin/bash

cd $(dirname $0)

for f in $(ls -a); do
    if [[ "$f" != "." && "$f" != ".." && "$f" != ".git" && "$f" != "bin" && "$f" != "setup.sh" ]]; then
    	if [ -e $HOME/$f ]; then
    		echo "$f exists in $HOME - remove if you want to use the .dotfiles version"
    	else
    		if [ ! -L $HOME/$f ]; then
    			ln -s $f $HOME/$f
    		fi
    	fi
    fi
done

for f in $(ls bin); do
	if [ -e $HOME/bin/$f ]; then
   		echo "$f exists in $HOME/bin - remove if you want to use the .dotfiles version"
   	else
    		if [ ! -L $HOME/bin/$f ]; then
				ln -s bin/$f $HOME/bin/$f
    		fi
	fi
done