#!/bin/bash

# xcode command line tools
xcode-select --install

# nvm
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh)"
# Homebrew
# m1 homebrew https://stackoverflow.com/questions/64963370/error-cannot-install-in-homebrew-on-arm-processor-in-intel-default-prefix-usr
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
bash homebrew/brew.sh;

# Python
bash python/python.sh;

# Zsh
bash zsh/zsh.sh;

# git
cp git/.gitconfig $HOME/.gitconfig;

# rust
curl https://sh.rustup.rs -sSf | sh;
