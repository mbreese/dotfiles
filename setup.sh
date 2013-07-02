#!/bin/bash
cd $(dirname $0)

DOTDIR=$(bin/realpath .)
if [ "$DOTDIR" == "" ]; then
    DOTDIR="$HOME/.dotfiles"
fi

for f in $(ls -a *.symlink); do
    TARGET=".$(echo "$f" | sed -e 's/.symlink//')"
    if [ -e $HOME/$TARGET ]; then
        if [ ! -L $HOME/$TARGET ]; then
            echo "$TARGET exists in $HOME - remove if you want to use the .dotfiles version"
        fi
    else
        ln -s $DOTDIR/$f $HOME/$TARGET
    fi
done

for f in $(ls bin); do
    if [ -e $HOME/bin/$f ]; then
        if [ ! -L $HOME/bin/$f ]; then
            echo "$f exists in $HOME/bin - remove if you want to use the .dotfiles version"
        fi
    else
        ln -s $DOTDIR/bin/$f $HOME/bin/$f
    fi
done
