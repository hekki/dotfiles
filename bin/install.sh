#!/bin/bash

BASE_DIR=$(dirname $(pwd))

#
# tmux
#
brew install tmux
cp "${BASE_DIR}/tmux.conf" ~/.tmux.conf

# https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#
# vim
#
cp "${BASE_DIR}/vimrc" ~/.vimrc

#
# fish shell
#
brew install fish
cp ~/.config/fish/config.fish ~/.config/fish/config.fish.backup
cp "${BASE_DIR}/config/fish/config.fish" ~/.config/fish/config.fish

# https://github.com/jorgebucaran/fisher
fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'
fish -c 'fisher install jethrokuan/z'
fish -c 'fisher install laughedelic/brew-completions'
fish -c 'fisher install matchai/spacefish'

