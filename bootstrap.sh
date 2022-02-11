#!/bin/bash

# xcode command line tools
xcode-select --install

# nvm
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh)"
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
bash homebrew/brew.sh;

# Python
bash python/python.sh;

# Zsh
bash zsh/zsh.sh;

# git
cp git/.gitconfig $HOME/.gitconfig;

# rust
curl https://sh.rustup.rs -sSf | sh;
