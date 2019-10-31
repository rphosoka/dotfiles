#!/bin/bash

brew install fish

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# plugin manager
# use fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# install powerline font
git clone https://github.com/powerline/fonts.git --depth=1 ~/dotfiles/tmp/fonts
~/dotfiles/tmp/fonts/install.sh
rm -rf ~/dotfiles/tmp/fonts

# install fzf
brew install fzf

# install ghq
brew install ghq

# add fisher plugin
./fish_add_plugin.sh

# add link
./link.sh
