#!/bin/sh

# VSCode Vim extension
# To enable key-repeating execute the following in your Terminal and restart VSCode:
#
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
#defaults delete -g ApplePressAndHoldEnabled
