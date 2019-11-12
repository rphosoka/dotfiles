#!/bin/bash

cd `dirname $0`

ln -nfs $PWD/config.fish ~/.config/fish/config.fish
ln -nfs $PWD/.vimrc ~/.vimrc
